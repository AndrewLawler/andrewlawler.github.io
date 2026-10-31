import Foundation
import Ignite

struct Home: StaticPage {
    var title = "Home"

    @Environment(\.articles) var articles

    var body: some HTML {
        Image("/images/avatar.png", description: "Andy's Memoji, doing a call-me hand gesture")
            .resizable()
            .frame(width: 96)
            .margin(.bottom, .medium)

        Text("Hi, I'm Andy 👋🏻")
            .font(.title1)

        Text("I'm an iOS engineer at Depop. I write about Swift, SwiftUI, conferences and building my own apps in public.")
            .font(.lead)
            .margin(.bottom, .xLarge)

        Text("Latest posts")
            .font(.title3)
            .margin(.bottom, .medium)

        ForEach(Article.posts(from: articles).prefix(5)) { post in
            PostRow(article: post)
        }

        Link("All posts →", target: Posts())
    }
}
