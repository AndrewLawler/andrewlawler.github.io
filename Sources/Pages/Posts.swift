import Foundation
import Ignite

struct Posts: StaticPage {
    var title = "Posts"

    @Environment(\.articles) var articles

    var body: some HTML {
        Text("Posts")
            .font(.title1)
            .margin(.bottom, .large)

        ForEach(Article.posts(from: articles)) { post in
            PostRow(article: post)
        }
    }
}

/// The page for each tag at `/tags/<tag>`, plus the all-tags page at `/tags`.
struct TagListing: TagPage {
    var body: some HTML {
        Text(tag.name == "All Tags" ? "All posts" : "Posts tagged “\(tag.name)”")
            .font(.title1)
            .margin(.bottom, .large)

        ForEach(tag.articles.sorted { $0.date > $1.date }) { post in
            PostRow(article: post)
        }
    }
}
