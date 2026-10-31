import Foundation
import Ignite

struct MainLayout: Layout {
    var body: some Document {
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
            " · "
            Link("Mastodon", target: "https://mastodon.social/@andylawlerdev")
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
