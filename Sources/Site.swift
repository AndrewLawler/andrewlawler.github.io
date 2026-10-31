import Foundation
import Ignite

@main
struct SiteBuilder {
    static func main() async {
        var site = AndyLawlerSite()

        do {
            try await site.publish()
        } catch {
            print(error.localizedDescription)
            // Fail the CI build rather than deploying a half-built site.
            exit(1)
        }
    }
}

struct AndyLawlerSite: Site {
    var name = "Andy Lawler"
    var titleSuffix = " – Andy Lawler"
    var description: String? = "iOS development, building apps in public, and the occasional conference write-up."
    var url = URL(static: "https://andrewlawler.github.io")
    var author = "Andy Lawler"
    var language: Language = .englishUnitedKingdom
    var builtInIconsEnabled: BootstrapOptions = .localBootstrap
    var favicon: URL? = URL(static: "/images/favicon.png")

    var homePage = Home()
    var layout = MainLayout()
    var tagPage = TagListing()

    var lightTheme: (any Theme)? = SiteLightTheme()
    var darkTheme: (any Theme)? = SiteDarkTheme()

    var feedConfiguration: FeedConfiguration? = FeedConfiguration(mode: .full, contentCount: 20)

    var staticPages: [any StaticPage] {
        Posts()
        About()
        Apps()
        SecondSkin()
        SecondSkinPrivacy()
        SecondSkinSupport()
    }

    var articlePages: [any ArticlePage] {
        PostLayout()
    }
}
