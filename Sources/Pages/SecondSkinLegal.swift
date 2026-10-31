import Foundation
import Ignite

// DRAFT privacy policy, written from the privacy decisions in the Second Skin
// architecture notes. Review it against the shipping app before using this URL
// in App Store Connect. Not legal advice.

struct SecondSkinPrivacy: StaticPage {
    var title = "Second Skin privacy policy"
    var path = "/apps/second-skin/privacy"
    var description = "How Second Skin handles your data: it doesn't collect any."

    var body: some HTML {
        Text("Second Skin privacy policy")
            .font(.title1)

        Text("Last updated: TODO before release")
            .foregroundStyle(.secondary)
            .margin(.bottom, .large)

        Text(markdown: """
        **The short version: Second Skin doesn't collect any of your data.** There's no account, \
        no ads, no analytics and no tracking, and there are no Second Skin servers.
        """)

        Text("Where your data lives")
            .font(.title3)

        Text(markdown: """
        Everything you add to Second Skin (your pieces, photos, ideas, artists, bookings and notes) \
        is stored on your device. If you're signed in to iCloud, it syncs between your devices \
        through your own iCloud account, using Apple's CloudKit private database. \
        That data belongs to your iCloud account and the developer can't see or access it. \
        If you're signed out of iCloud, it stays on your device.
        """)

        Text("Crash reports")
            .font(.title3)

        Text(markdown: """
        If you've chosen to share analytics with app developers in your device's settings, \
        Apple may pass on anonymous crash and performance reports. Second Skin doesn't use any \
        third-party crash reporting or analytics tools.
        """)

        Text("Permissions")
            .font(.title3)

        Text(markdown: """
        Second Skin only asks for access when you use a feature that needs it: the camera to \
        take photos of your tattoos, Face ID if you choose to lock the app, and Photos if you \
        save images to your library. Picking photos to import doesn't need any permission.
        """)

        Text("Deleting your data")
            .font(.title3)

        Text(markdown: """
        **Delete everything** in Settings removes all of your data from your device and from \
        your iCloud account. **Export collection** gives you a copy of your data and photos \
        before you do.
        """)

        Text("Contact")
            .font(.title3)

        Text(markdown: "If you have any questions about this policy, see the [support page](/apps/second-skin/support/).")
    }
}

struct SecondSkinSupport: StaticPage {
    var title = "Second Skin support"
    var path = "/apps/second-skin/support"
    var description = "Get help with Second Skin."

    var body: some HTML {
        Text("Second Skin support")
            .font(.title1)

        Text(markdown: """
        Need help, found a bug or have an idea? Get in touch and I'll get back to you as soon as I can.
        """)

        // TODO: add a support contact (email address or form) before release.
        Text("Contact: TODO before release")
            .foregroundStyle(.secondary)
    }
}
