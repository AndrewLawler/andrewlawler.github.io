import Foundation
import Ignite

struct Posts: StaticPage {
    var title = "Posts"

    @Environment(\.articles) var articles

    var body: some HTML {
        Text("Posts")
            .font(.title1)
            .margin(.bottom, .large)

        Include("post-search.html")

        TagFilter(articles: Article.posts(from: articles))

        PostGrid(articles: Article.posts(from: articles))
    }
}

/// The page for each tag at `/tags/<tag>`, plus the all-tags page at `/tags`.
struct TagListing: TagPage {
    @Environment(\.articles) var articles

    var body: some HTML {
        Text(tag.name == "All Tags" ? "All posts" : "Posts tagged “\(tag.name)”")
            .font(.title1)
            .margin(.bottom, .large)

        TagFilter(articles: Article.posts(from: articles), selected: tag.name == "All Tags" ? nil : tag.name)

        PostGrid(articles: tag.articles.sorted { $0.date > $1.date })
    }
}
