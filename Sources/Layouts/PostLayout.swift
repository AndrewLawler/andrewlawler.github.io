import Foundation
import Ignite

/// The layout for every Markdown post in `Content/posts/`.
struct PostLayout: ArticlePage {
    var body: some HTML {
        Text(article.title)
            .font(.title1)
            .margin(.bottom, .small)

        Text {
            article.date.formatted(date: .long, time: .omitted)
            " · "
            "\(article.estimatedReadingMinutes) min read"
        }
        .foregroundStyle(.secondary)

        if let tagLinks = article.tagLinks() {
            Section {
                ForEach(tagLinks) { link in
                    link
                }
            }
            .margin(.bottom, .large)
        }

        Text(article.text)

        Divider()
            .margin(.top, .xLarge)

        Text(markdown: "Thanks for reading! If you'd like more, you can [subscribe with RSS](/feed.rss) or follow me on [dev.to](https://dev.to/andylawler).")
            .foregroundStyle(.secondary)
    }
}

extension Article {
    /// Posts live in `Content/posts/`, so Ignite gives them the type "posts".
    static func posts(from loader: ArticleLoader) -> [Article] {
        loader.typed("posts").sorted { $0.date > $1.date }
    }

    /// Posts from before the blog came back in 2026 (the 2020 dev.to posts).
    var isOlderPost: Bool {
        Calendar.current.component(.year, from: date) < 2026
    }
}
