import Foundation
import Ignite

/// A post as a tappable card: cover image, date and tags, title and description.
/// The title link is stretched over the whole card, so anywhere on it opens the post,
/// apart from the tags, which open their tag page.
struct PostCard: HTML {
    var article: Article

    var body: some HTML {
        Section {
            if let image = article.image {
                Image(decorative: Self.sitePath(image))
                    .class("post-card-image")
            }

            Section {
                Section {
                    Span(date)
                        .class("post-card-date")

                    ForEach(article.tags ?? []) { tag in
                        Link("#\(tag)", target: "/tags/\(tag.convertedToSlug())")
                            .class("post-card-tag")
                    }
                }
                .class("post-card-meta")

                Text {
                    Link(article)
                        .class("stretched-link")
                }
                .class("post-card-title")

                Text(summary)
                    .class("post-card-description")
            }
            .class("post-card-body")
        }
        .class("post-card")
    }

    /// The front matter description. Ignite's `description` is the post's first paragraph.
    private var summary: String {
        (article.metadata["description"] as? String) ?? article.description
    }

    private var date: String {
        article.date.formatted(date: .abbreviated, time: .omitted)
    }

    /// Post front matter holds full image URLs (dev.to needs them). Use the path
    /// instead, so the cards also show the local images when previewing.
    static func sitePath(_ image: String) -> String {
        image.replacingOccurrences(of: "https://andrewlawler.github.io", with: "")
    }
}

/// Posts laid out as cards: the newest full width, the rest two across.
struct PostGrid: HTML {
    var articles: [Article]
    /// Two across with no full-width first card, for the older posts.
    var isCompact = false

    var body: some HTML {
        Section {
            ForEach(articles) { post in
                PostCard(article: post)
            }
        }
        .class("post-grid", isCompact ? "post-grid-compact" : "")
    }
}

/// Tag pills linking to each tag's page, most used first. `selected` is the
/// current tag, or nil on the all-posts page.
struct TagFilter: HTML {
    var articles: [Article]
    var selected: String?

    var body: some HTML {
        Section {
            pill("All", path: "/posts", isActive: selected == nil)

            ForEach(tags) { tag in
                pill("#\(tag)", path: "/tags/\(tag.convertedToSlug())", isActive: tag == selected)
            }
        }
        .class("tag-filter")
        .aria(.label, "Filter posts by tag")
    }

    private var tags: [String] {
        let counts = articles.flatMap { $0.tags ?? [] }.reduce(into: [:]) { $0[$1, default: 0] += 1 }
        return counts.keys.sorted { (counts[$0]!, $1) > (counts[$1]!, $0) }
    }

    private func pill(_ title: String, path: String, isActive: Bool) -> some InlineElement {
        Link(title, target: path)
            .class("tag-pill")
            .class(isActive ? "active" : "")
            .aria(.current, isActive ? "page" : nil)
    }
}
