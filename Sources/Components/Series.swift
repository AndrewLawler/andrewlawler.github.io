import Foundation
import Ignite

/// Posts on one topic, published in parts. A post joins a series with
/// `series: <name>` in its front matter; the name must match one listed here.
struct Series {
    var name: String
    /// The page that lists every part.
    var path: String

    static let all = [
        Series(name: "Building Second Skin", path: "/apps/second-skin#building-in-public")
    ]

    static func named(_ name: String?) -> Series? {
        all.first { $0.name == name }
    }

    /// The series' posts, oldest first, so part 1 comes first.
    func posts(from loader: ArticleLoader) -> [Article] {
        Article.posts(from: loader).filter { $0.seriesName == name }.reversed()
    }
}

extension Article {
    var seriesName: String? {
        metadata["series"] as? String
    }
}

/// The box at the top of a post in a series: which part it is, a link to the
/// full list, and links to the parts either side.
struct SeriesBox: HTML {
    var article: Article
    var series: Series
    var posts: [Article]

    var body: some HTML {
        if let index = posts.firstIndex(where: { $0.path == article.path }) {
            Section {
                Text {
                    "Part \(index + 1) of "
                    Link(series.name, target: series.path)
                }
                .class("series-box-title")

                Section {
                    if index > 0 {
                        Link("← Part \(index): \(posts[index - 1].title)", target: posts[index - 1].path)
                    }

                    if index + 1 < posts.count {
                        Link("Part \(index + 2): \(posts[index + 1].title) →", target: posts[index + 1].path)
                            .class("series-box-next")
                    }
                }
                .class("series-box-links")
            }
            .class("series-box")
        }
    }
}
