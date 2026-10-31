#!/usr/bin/env python3
"""Copy published blog posts from the Obsidian vault into the Ignite site.

Posts are written in the vault as `posts/YYYY-MM-slug.md` with dev.to front matter,
and their images live in `posts/images/YYYY-MM-slug/`. For each post marked
`published: true` this script:

- writes `Content/posts/<slug>.md` with Ignite front matter (title, date,
  description, tags, cover image), taking the publish date from dev.to
- copies the images to `Assets/images/posts/<slug>/` and points the post at them

Re-running it overwrites earlier imports, so the vault stays the source of truth.

Usage: python3 scripts/import-posts.py [--vault PATH] [--date SLUG=YYYY-MM-DD ...]
"""

import argparse
import json
import re
import shutil
import sys
import urllib.request
from pathlib import Path

DEFAULT_VAULT_POSTS = Path.home() / "Documents/Obsidian/andy-notes/Blog posts/posts"
DEVTO_USERNAME = "andylawler"
SITE_URL = "https://andrewlawler.github.io"
SITE_ROOT = Path(__file__).resolve().parent.parent


def parse_front_matter(text):
    """Split a post into a dict of front matter and the Markdown body."""
    match = re.match(r"^---\s*\n(.*?)\n---\s*\n", text, re.DOTALL)
    if not match:
        return {}, text
    fields = {}
    for line in match.group(1).splitlines():
        if ":" not in line:
            continue
        key, value = line.split(":", 1)
        value = value.strip()
        # Ignite keeps quotes as part of the value, so strip them here.
        if len(value) >= 2 and value[0] == value[-1] and value[0] in "\"'":
            value = value[1:-1]
        fields[key.strip()] = value
    return fields, text[match.end():]


def devto_dates():
    """Map each dev.to post title to its publish date (YYYY-MM-DD)."""
    url = f"https://dev.to/api/articles?username={DEVTO_USERNAME}&per_page=100"
    try:
        # dev.to rejects Python's default user agent as a bot.
        request = urllib.request.Request(url, headers={"User-Agent": "andrewlawler.github.io import-posts"})
        with urllib.request.urlopen(request, timeout=20) as response:
            articles = json.load(response)
    except Exception as error:  # Network problems shouldn't stop an import.
        print(f"warning: couldn't fetch dev.to dates ({error})", file=sys.stderr)
        return {}
    return {article["title"]: article["published_at"][:10] for article in articles}


def main():
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("--vault", type=Path, default=DEFAULT_VAULT_POSTS,
                        help="the vault's posts folder")
    parser.add_argument("--date", action="append", default=[], metavar="SLUG=YYYY-MM-DD",
                        help="set a post's date by hand, e.g. for one not on dev.to")
    args = parser.parse_args()

    manual_dates = dict(item.split("=", 1) for item in args.date)
    published_dates = devto_dates()
    content_dir = SITE_ROOT / "Content/posts"
    assets_dir = SITE_ROOT / "Assets/images/posts"
    content_dir.mkdir(parents=True, exist_ok=True)

    imported = 0
    for source in sorted(args.vault.glob("*.md")):
        stem = source.stem  # e.g. 2026-10-swiftleeds-2026
        slug = re.sub(r"^\d{4}-\d{2}-", "", stem)
        fields, body = parse_front_matter(source.read_text(encoding="utf-8"))

        if fields.get("published", "").lower() != "true":
            print(f"skip   {stem} (not published)")
            continue

        title = fields.get("title", slug)
        date = manual_dates.get(slug) or published_dates.get(title)
        if not date:
            print(f"skip   {stem} (no date: not found on dev.to, pass --date {slug}=YYYY-MM-DD)")
            continue

        # Copy the post's images and point the Markdown at their new home.
        image_source = args.vault / "images" / stem
        cover = None
        if image_source.is_dir():
            image_target = assets_dir / slug
            if image_target.exists():
                shutil.rmtree(image_target)
            shutil.copytree(image_source, image_target)
            if (image_target / "cover.jpg").exists():
                # Absolute, because Ignite uses it as-is for og:image and
                # social previews need a full URL.
                cover = f"{SITE_URL}/images/posts/{slug}/cover.jpg"
        body = body.replace(f"](images/{stem}/", f"](/images/posts/{slug}/")

        front_matter = [
            "---",
            f"title: {title}",
            f"date: {date}",
            f"description: {fields.get('description', '')}",
            f"tags: {fields.get('tags', '')}",
        ]
        if cover:
            front_matter += [f"image: {cover}", f"alt: Cover image for {title}"]
        front_matter.append("---")

        target = content_dir / f"{slug}.md"
        target.write_text("\n".join(front_matter) + "\n\n" + body.lstrip(), encoding="utf-8")
        print(f"import {stem} -> Content/posts/{slug}.md ({date})")
        imported += 1

    print(f"\n{imported} post(s) imported.")


if __name__ == "__main__":
    main()
