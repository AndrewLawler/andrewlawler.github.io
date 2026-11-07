---
title: My blog is moving home: rebuilding my site in Swift with Ignite 🏡
date: 2026-11-03
description: Why I moved my personal site from Publish to Ignite, how it's all built in Swift and deployed for free with GitHub Actions, and where my posts will live from now on.
tags: swift, ios, webdev, showdev
devto: https://dev.to/andylawler/my-blog-is-moving-home-rebuilding-my-site-in-swift-with-ignite-3j7i
image: https://andrewlawler.github.io/images/posts/moving-my-site-to-ignite/cover.jpg
alt: Cover image for My blog is moving home: rebuilding my site in Swift with Ignite 🏡
---

Hi! 👋🏻 If you've read my last few posts, you might not know that they all have a second home now... my own site, [andrewlawler.github.io](https://andrewlawler.github.io/). This post is all about how it got there and why I rebuilt it.

![The home page of andrewlawler.github.io: a round photo of Andy, "Hi, I'm Andy 👋🏻" with a short intro, three Get to know me cards (More about me, My apps, All posts) and the start of Latest posts](/images/posts/moving-my-site-to-ignite/home.jpg)

## 🕰️ A site I forgot I had

Back in October 2023 I built myself a little personal site using John Sundell's [Publish](https://github.com/JohnSundell/Publish), a static site generator written in Swift. This was back before the days of AI so it was definitely a scrappy project and it was honestly fun to see what could be made using Swift. The site itself was pretty barebones, I had one basic post which just outlined a few things about the site but that was it. I then didn't really write anything or touch the site... until now.

When I began writing again, my first thought was to use the site but honestly it just wasn't really in the state to be used, so instead of waiting I opted to use my old [dev.to](https://dev.to/andylawler) account instead. After a few posts on there, I thought it would be nice to try and get everything onto my own site, plus I had been thinking that I would need somewhere to hold my portfolio and the relevant support pages for Second Skin when it launches so it felt like the best time.

When I came back to the repo, the first thing I did was try and build it again. The good news was it still built on the latest Swift. The bad news was that generating the site failed, because of a file rename I'd clearly started in 2023 and never finished, which is pretty typical of me to be fair. Once I got rid of the changes I'd made the site generated which was a success..... but it still had all the issues that drove me away in 2023 in the first place.

The bigger problem though was Publish itself. Its last release was 0.9.0 back in April 2022, so it's pretty much unmaintained now. I didn't really want to start again on my site, using a library that in reality was never going to get any more updates. So I felt that before I even touched anything, I should consider how I'd even want my site to work.

## 🔥 So why Ignite?

So, if not Publish, then what? Well I had two real options:

- **[Astro](https://astro.build) or something similar.** Probably the lower maintenance choice, tons of themes and a big community behind it.
- **[Ignite](https://github.com/Ignite-Swift/Ignite).** A static site generator from Paul Hudson, also in Swift, but you build your pages with a SwiftUI style syntax.

In the end, Ignite was the clear winner for me. I'm passionate about Swift and honestly just building things with Swift has always been the goal for me so keeping this website powered by Swift was a priority. When I saw Ignite and how maintained it was, it was really a no brainer.

If you've written any SwiftUI, Ignite will feel quite familiar. Here's a small part of my home page:

```swift
struct Home: StaticPage {
    var title = "Home"

    @Environment(\.articles) var articles

    var body: some HTML {
        Section {
            Text {
                "Hi, I'm Andy "
                Span("👋🏻")
                    .class("wave")
            }
            .font(.title1)

            Text("I'm an iOS engineer, currently working at Depop and based in Liverpool.")
                .font(.lead)
        }
        .class("hero")
    }
}
```

Pages are structs, they have a `body`, and you style things with modifiers. The whole site is then described in one `Site` struct, which lists the pages, the layout, the themes and the RSS feed:

```swift
struct AndyLawlerSite: Site {
    var name = "Andy Lawler"
    var url = URL(static: "https://andrewlawler.github.io")

    var homePage = Home()
    var layout = MainLayout()

    var staticPages: [any StaticPage] {
        Posts()
        About()
        Apps()
        SecondSkin()
    }

    var articlePages: [any ArticlePage] {
        PostLayout()
    }
}
```

> ⚠️ **Tip:** Ignite is still pre-1.0, so minor releases can break things. I've pinned it to an exact version (`exact: "0.7.2"`) in `Package.swift` and I'll update it on purpose rather than by accident.

## 🚀 One repo, deployed for free

The old site had its source in one private repo and the built output in another. I think this was the advice at the time? Honestly, I can't quite remember. This time though, everything is all just in one public repo and a GitHub Actions workflow builds the site on each merge and releases it to GitHub Pages. Making the repo public is what keeps this free. A private repo deploying to Pages needs GitHub Pro, and honestly there's nothing secret in a personal blog anyway.

```yaml
jobs:
  build:
    runs-on: macos-26
    steps:
      - uses: actions/checkout@v4
      - name: Build site
        run: swift run AndyLawlerSite
      - name: Upload site
        if: github.event_name != 'pull_request'
        uses: actions/upload-pages-artifact@v3
        with:
          path: Build
```

The build has to run on macOS, as that's where Ignite is developed and tested.

## 🪜 The bits that tripped me up

It wasn't all smooth sailing, so here are a few things that tripped me up and might save you some time if you try this yourself:

- **Posts need to live in a subfolder.** Ignite puts every Markdown file in `Content/` into your RSS feed and tag pages, and a Markdown file sat at the top level of `Content/` actually crashed the build for me. So posts live in `Content/posts/`, and normal pages like my privacy and support pages are Swift `StaticPage`s instead.
- **Watch your Swift version on CI.** GitHub's stable `macos-26` runner has Xcode 26 with Swift 6.2, but a newer swift-collections (one of Ignite's dependencies) needs Swift 6.4. Builds were fine on my Mac and failed on CI, so for now I've capped swift-collections in `Package.swift` until the runner catches up.
- **Dates and quotes in front matter.** Ignite keeps the quotes around front matter values and only reads dates in a `y-M-d` format, which caught me out when bringing posts across.
- **Don't keep the repo in iCloud.** My repo lived in my `~/Documents`, which iCloud syncs. That gave me a weird codesign "detritus" error (`swift package reset` sorted it) and a pile of duplicate "Site 2.swift" files that broke the build. 🤦‍♂️
- **Ignite's CSS wins by default.** Ignite sets link colours and button backgrounds directly, so if you want your own styles to stick, your overrides need to be just as specific.

## ✨ What's on the site

Now it's built out a bit more, here's what you'll find:

- **Posts.** Everything I've written, with search and tag filters, going all the way back to my two posts from 2020.
- **About.** A little more about me, what I'm passionate about and where I've worked.
- **Apps.** The apps I've worked on at Jigsaw, Sky Bet and Depop, plus my own ones like Second Skin and some older side projects.
- **RSS.** If you're still an RSS person (I see you 👀), there's a feed too.

![The Posts page: a search box, tag filter pills from #ios to #techtalks, and post cards for Second Skin, the AI novice post and SwiftLeeds 2026](/images/posts/moving-my-site-to-ignite/posts.jpg)
![The About page on the How I got here tab: a timeline starting with a Computer Science degree in 2018, then Apposing, classi and Jigsaw](/images/posts/moving-my-site-to-ignite/about-timeline.jpg)

I also gave it a bit of a fresh coat of paint, with the iOS system pink as the accent colour and a little bit of motion as you scroll.

## 📍 So where will my posts live now?

My site is now the home for everything I write. I write the posts in Obsidian, and a little script copies anything marked as published (plus its images) over into the site, so there's only ever one copy of each post to look after.

I'm still going to post on dev.to too, as that's where a lot of you are reading this. Each post there has a `canonical_url` pointing back to the copy on my site, so search engines know where the original lives.

## 🔜 What's next?

I always feel wary when I consider what's next with personal websites, I could say I have grand plans and then disappear again. However, I think this time I'll be here for a while. Keep an eye on the site for any upcoming posts and maybe some new designs when I think we need a fresh lick of paint. I'll also hopefully get myself a nice little domain name so I can drop the default GitHub Pages domain but we will see how that goes.
