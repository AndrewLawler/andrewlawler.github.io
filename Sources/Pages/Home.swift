import Foundation
import Ignite

struct Home: StaticPage {
    var title = "Home"

    @Environment(\.articles) var articles

    var body: some HTML {
        Section {
            Section {
                Image("/images/andy.jpg", description: "Andy, smiling, in a black band T-shirt")
                    .class("hero-photo")
            }
            .class("hero-photo-wrap")

            Section {
                Text {
                    "Hi, I'm Andy "
                    Span("👋🏻")
                        .class("wave")
                }
                .font(.title1)

                Text("I'm an iOS engineer, currently working at Depop and based in Liverpool. I write about Swift, SwiftUI, conferences and building my own apps in public.")
                    .font(.lead)
                    .margin(.bottom, 0)
            }
        }
        .class("hero")

        Text("Get to know me")
            .font(.title3)
            .margin(.bottom, .medium)

        Section {
            ExploreCard(
                icon: "person-heart",
                title: "More about me",
                text: "How I got here, from a Computer Science degree to Depop, and what I get up to outside of work.",
                target: "/about"
            )

            ExploreCard(
                icon: "phone",
                title: "My apps",
                text: "Second Skin, and the apps I built along the way.",
                target: "/apps"
            )

            ExploreCard(
                icon: "journal-text",
                title: "All posts",
                text: "Search and filter everything I've written, back to 2020.",
                target: "/posts"
            )
        }
        .class("explore-grid")

        Section {
            Text("Latest posts")
                .font(.title3)
                .margin(.bottom, 0)
            Link("All posts →", target: Posts())
        }
        .class("section-title")

        PostGrid(articles: Array(Article.posts(from: articles).filter { !$0.isOlderPost }.prefix(5)))
    }
}

/// A small tappable card pointing to another part of the site.
struct ExploreCard: HTML {
    var icon: String
    var title: String
    var text: String
    var target: String

    var body: some HTML {
        Section {
            Section {
                // Decorative: the title says where the card goes.
                Image(systemName: icon, description: "")
            }
            .class("explore-icon")
            .aria(.hidden, "true")

            Text {
                Link(title, target: target)
                    .class("stretched-link")
            }
            .class("explore-title")

            Text(text)
                .class("explore-text")
        }
        .class("post-card", "explore-card")
    }
}
