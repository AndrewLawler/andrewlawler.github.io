import Foundation
import Publish
import Plot

struct AndyLawlerDevBlog: Website {
    enum SectionID: String, WebsiteSectionID {
        case articles
        case about
    }

    struct ItemMetadata: WebsiteItemMetadata {}

    var url = URL(string: "https://andrewlawler.github.io")!
    var name = "AndyLawlerDev - iOS Blog"
    var description = "This is the official dev blog of AndyLawlerDev"
    var language: Language { .english }
    var imagePath: Path? { nil }
    var favicon: Favicon? { Favicon(path: Path("Resources/images/favicon.png")) }
}

try AndyLawlerDevBlog().publish(using: [
    .addMarkdownFiles(),
    .copyResources(),
    .generateHTML(withTheme: .general),
    .generateRSSFeed(including: [.articles]),
    .generateSiteMap()
])
