# andrewlawler.github.io

My personal site: blog posts, my apps, and their privacy and support pages. It's built in Swift with [Ignite](https://github.com/Ignite-Swift/Ignite) and deployed to GitHub Pages by GitHub Actions.

## Layout

- `Sources/`: the site in Swift. `Site.swift` is the entry point. `Pages/` holds the static pages (home, posts, about, apps, Second Skin privacy and support) and `Layouts/` holds the page chrome and the post layout.
- `Content/posts/`: the posts, as Markdown. Don't edit these here; they're imported from the vault (see below).
- `Assets/`: images and the favicon, copied as-is to the site root.
- `scripts/import-posts.py`: copies published posts from the Obsidian vault into `Content/posts/` and `Assets/images/posts/`.
- `Build/`: the generated site (ignored by git).

## Writing a post

1. Write the post in the vault (`Blog posts/posts/YYYY-MM-slug.md`) and publish it on dev.to as usual.
2. Run `python3 scripts/import-posts.py`. It imports every post marked `published: true` and takes each post's date from dev.to. For a post that isn't on dev.to, pass `--date slug=YYYY-MM-DD`.
3. Preview, then commit and push to `main`.

On dev.to, set each post's `canonical_url` to its URL here, so search engines treat this site as the original.

## Previewing

```sh
swift run AndyLawlerSite
python3 -m http.server 8000 --directory Build
```

Then open <http://localhost:8000>. (Or install the Ignite CLI with `brew tap ignite-swift/ignite && brew install ignite-swift` and run `ignite run --preview`.)

## Deploying

Every push to `main` builds the site and deploys it. Pull requests only check that the site builds. Ignite is pinned to an exact version in `Package.swift` because it's pre-1.0, so update it on purpose and check the site still looks right.
