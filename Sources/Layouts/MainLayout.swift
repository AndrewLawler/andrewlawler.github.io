import Foundation
import Ignite

struct MainLayout: Layout {
    var body: some Document {
        Head {
            // The build time in the URL makes browsers fetch the new CSS after each
            // deploy, instead of using a cached copy for up to 10 minutes.
            MetaLink(href: "/css/site.css?v=\(Self.buildVersion)", rel: .stylesheet)
            MetaLink(href: "/images/apple-touch-icon.png", rel: "apple-touch-icon")
        }

        Body {
            NavigationBar(logo: Span("Andy Lawler").fontWeight(.bold)) {
                Link("Posts", target: Posts())
                Link("Apps", target: Apps())
                Link("About", target: About())
            }
            .navigationItemAlignment(.trailing)
            .position(.fixedTop)
            .background(.ultraThinMaterial)

            content
                .padding(.top, 100)

            SiteFooter()

            // Slides cards and timeline steps into view as you scroll, on every page.
            // Without JavaScript, or with reduce motion on, they just show.
            Include("reveal.html")
        }
    }
}

struct SiteFooter: HTML {
    var body: some HTML {
        Divider()
            .margin(.top, .xLarge)

        Text {
            Link("RSS", target: "/feed.rss")
            " · "
            Link("dev.to", target: "https://dev.to/andylawler")
            " · "
            Link("GitHub", target: "https://github.com/AndrewLawler")
            " · "
            Link("LinkedIn", target: "https://www.linkedin.com/in/andrewlawler-io/")
        }
        .horizontalAlignment(.center)
        .font(.small)

        Text("Built in Swift with Ignite.")
            .horizontalAlignment(.center)
            .font(.small)
            .foregroundStyle(.secondary)
            .margin(.bottom, .xLarge)
    }
}

extension MainLayout {
    /// Set once per build.
    static let buildVersion = String(Int(Date().timeIntervalSince1970))
}
