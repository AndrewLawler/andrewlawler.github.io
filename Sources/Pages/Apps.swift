import Foundation
import Ignite

struct Apps: StaticPage {
    var title = "Apps"

    var body: some HTML {
        Text("Apps")
            .font(.title1)
            .margin(.bottom, .large)

        Section {
            Text {
                Link("Second Skin", target: SecondSkin())
            }
            .font(.title4)
            .margin(.bottom, .xSmall)

            Text("Your tattoos, from idea to healed. Coming soon to iPhone and iPad.")
        }
    }
}

struct SecondSkin: StaticPage {
    var title = "Second Skin"
    var path = "/apps/second-skin"
    var description = "Second Skin is an iOS app for keeping track of your tattoos, from idea to healed."

    var body: some HTML {
        Text("Second Skin")
            .font(.title1)

        Text("Your tattoos, from idea to healed.")
            .font(.lead)
            .margin(.bottom, .large)

        Text(markdown: """
        Second Skin is an iOS app for keeping track of your tattoos: the pieces you have, \
        the ideas you're planning, your bookings and some fun stats along the way. \
        It's private by design, with no sign-up, no ads, no tracking and no servers.
        """)

        Text(markdown: "I'm building it in public. You can follow along in the [Building Second Skin](/posts/building-second-skin/) series.")

        Text {
            Link("Privacy policy", target: SecondSkinPrivacy())
            " · "
            Link("Support", target: SecondSkinSupport())
        }
        .margin(.top, .large)
    }
}
