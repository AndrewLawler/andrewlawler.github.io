import Foundation
import Ignite

/// The layout for every Markdown post in `Content/posts/`.
struct PostLayout: ArticlePage {
    @Environment(\.articles) var articles

    var body: some HTML {
        PostHeader(article: article)

        if let series = Series.named(article.seriesName) {
            SeriesBox(article: article, series: series, posts: series.posts(from: articles))
        }

        Text(article.text)

        Divider()
            .margin(.top, .xLarge)

        if let devto = article.devtoURL {
            Text(markdown: "Thanks for reading! If you'd like to leave a comment, this post is also [on dev.to](\(devto)). For more, you can [subscribe with RSS](/feed.rss) or follow me on [dev.to](https://dev.to/andylawler).")
                .foregroundStyle(.secondary)
        } else {
            Text(markdown: "Thanks for reading! If you'd like more, you can [subscribe with RSS](/feed.rss) or follow me on [dev.to](https://dev.to/andylawler).")
                .foregroundStyle(.secondary)
        }
    }
}

/// The top of a post, laid out like dev.to's: the cover across the top of a
/// card, then who wrote it and when, the title and the tags.
struct PostHeader: HTML {
    var article: Article

    var body: some HTML {
        Section {
            // Decorative: the title below says the same thing.
            if let image = article.image {
                Image(decorative: PostCard.sitePath(image))
                    .class("post-header-cover")
            }

            Section {
                Section {
                    Image(decorative: "/images/avatar.png")
                        .class("post-author-avatar")

                    Section {
                        Text("Andy Lawler")
                            .class("post-author-name")

                        if let devto = article.devtoURL {
                            Text {
                                meta
                                " · "
                                Link("Also on dev.to", target: devto)
                                    .target(.newWindow)
                            }
                            .class("post-author-meta")
                        } else {
                            Text(meta)
                                .class("post-author-meta")
                        }
                    }
                }
                .class("post-author")

                Text(article.title)
                    .font(.title1)
                    .class("post-header-title")

                Section {
                    ForEach(article.tags ?? []) { tag in
                        Link("#\(tag)", target: "/tags/\(tag.convertedToSlug())")
                            .class("post-header-tag")
                    }
                }
                .class("post-header-tags")
            }
            .class("post-header-body")
        }
        .class("post-header")
    }

    private var meta: String {
        "Posted on \(article.date.formatted(date: .long, time: .omitted)) · \(article.estimatedReadingMinutes) min read"
    }
}

extension Article {
    /// The same post on dev.to, written by the import script.
    var devtoURL: String? {
        metadata["devto"] as? String
    }

    /// Posts live in `Content/posts/`, so Ignite gives them the type "posts".
    static func posts(from loader: ArticleLoader) -> [Article] {
        loader.typed("posts").sorted { $0.date > $1.date }
    }

    /// Posts from before the blog came back in 2026 (the 2020 dev.to posts).
    var isOlderPost: Bool {
        Calendar.current.component(.year, from: date) < 2026
    }
}
