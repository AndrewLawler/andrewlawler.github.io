import Foundation
import Ignite

struct Apps: StaticPage {
    var title = "Apps"

    var body: some HTML {
        Text("Apps")
            .font(.title1)

        Text("Apps I've helped build at work, and the ones I build for myself.")
            .font(.lead)
            .margin(.bottom, .xLarge)

        AppSectionTitle("💼 At work", subtitle: "Apps I've worked on during my various roles.")

        Section {
            WorkAppCard(
                name: "Depop",
                icon: "bag-heart",
                role: "iOS Engineer II",
                dates: "Sep 2025 to now",
                url: "https://apps.apple.com/gb/app/id518684914"
            )

            WorkAppCard(
                name: "Sky Bet",
                icon: "trophy",
                role: "iOS Engineer, then Senior iOS Engineer",
                dates: "Jun 2022 to Sep 2025",
                url: "https://apps.apple.com/gb/app/id428237841"
            )

            WorkAppCard(
                name: "Jigsaw",
                icon: "puzzle",
                role: "QA and iOS Developer",
                dates: "Jun 2020 to Sep 2021",
                url: "https://apps.apple.com/gb/app/id930197933"
            )
        }
        .class("work-grid")

        AppSectionTitle("🛠️ Personal", subtitle: "What I'm building in my spare time, and the apps I built along the way.")

        Section {
            AppCard(
                name: "Second Skin",
                tagline: "Your tattoos, from idea to healed.",
                status: "Coming soon to iPhone and iPad",
                image: "/images/posts/building-second-skin/cover.jpg",
                imageDescription: "Second Skin's welcome, about you and collection screens",
                target: SecondSkin().path
            )
        }
        .class("post-grid")

        Section {
            AppCard(
                name: "TaskList",
                tagline: "Track your tasks in a way that suits you. This was the first app I ever shipped. It led me to learn about Realm and was my first insight into actually uploading something and working with App Store Connect.",
                status: "On the App Store in 2020 · Code on GitHub",
                icon: "/images/apps/tasklist/icon.png",
                image: "/images/apps/tasklist/banner.jpg",
                imageDescription: "TaskList's add task and task list screens",
                target: "https://github.com/AndrewLawler/SwiftUITodo"
            )

            AppCard(
                name: "classi",
                tagline: "A classic car marketplace for finding buyers and sellers near you. This was my university project, where I was the only iOS engineer. It was my first time working in a team with a backend engineer and needing to design and build an app on my own.",
                status: "University project, 2020 · Code on GitHub",
                icon: "/images/apps/classi/icon.png",
                image: "/images/apps/classi/banner.jpg",
                imageDescription: "classi's search, welcome, car listing and profile screens",
                target: "https://github.com/AndrewLawler/classi-ios"
            )

            AppCard(
                name: "LyricBook",
                tagline: "Store and read the lyrics to your favourite songs.",
                status: "2019 to 2020 · Code on GitHub",
                icon: "/images/apps/lyricbook/icon.png",
                image: "/images/apps/lyricbook/banner.jpg",
                imageDescription: "LyricBook's download, song and favourite songs screens",
                target: "https://github.com/AndrewLawler/LyricBook-iOS"
            )

            AppCard(
                name: "SearchFilm",
                tagline: "Search for films and save your favourites on your device. One of my first apps.",
                status: "2020 · Code on GitHub",
                icon: "/images/apps/searchfilm/icon.png",
                image: "/images/apps/searchfilm/banner.jpg",
                imageDescription: "SearchFilm's film list and film detail screens",
                target: "https://github.com/AndrewLawler/SearchFilm"
            )
        }
        .class("post-grid", "post-grid-compact")
    }
}

/// A heading between the groups of apps, with a line under it.
struct AppSectionTitle: HTML {
    var title: String
    var subtitle: String

    init(_ title: String, subtitle: String) {
        self.title = title
        self.subtitle = subtitle
    }

    var body: some HTML {
        Text(title)
            .font(.title3)
            .margin(.bottom, .xSmall)

        Text(subtitle)
            .foregroundStyle(.secondary)
            .margin(.bottom, .medium)
    }
}

/// A company app I've had code released in: an icon tile (not the company's logo)
/// and my role. The whole card opens the App Store page.
struct WorkAppCard: HTML {
    var name: String
    var icon: String
    var role: String
    var dates: String
    var url: String

    var body: some HTML {
        Section {
            Section {
                // Decorative: the name sits right under it.
                Image(systemName: icon, description: "")
            }
            .class("work-icon")
            .aria(.hidden, "true")

            Text {
                Link(name, target: url)
                    .target(.newWindow)
                    .class("stretched-link")
            }
            .class("post-card-title", "work-name")

            Text(role)
                .class("work-role")

            Text(dates)
                .class("work-dates")

            Text {
                Image(systemName: "apple", description: "")
                " App Store"
            }
            .class("work-store")
        }
        .class("post-card", "work-card")
    }
}

/// The app's icon. Pass nil for a placeholder tile while the real icon isn't final.
struct AppIcon: HTML {
    var image: String?
    var name: String

    var body: some HTML {
        if let image {
            Image(image, description: "\(name) app icon")
                .class("app-icon")
        } else {
            Text("TBC")
                .class("app-icon", "app-icon-placeholder")
                .attribute("role", "img")
                .aria(.label, "\(name) app icon, to be confirmed")
        }
    }
}

/// An app as a tappable card: icon, name, tagline and a screenshot banner.
struct AppCard: HTML {
    var name: String
    var tagline: String
    var status: String
    var icon: String? = nil
    var image: String
    var imageDescription: String
    var target: String

    var body: some HTML {
        Section {
            Section {
                Section {
                    AppIcon(image: icon, name: name)

                    Section {
                        Text {
                            Link(name, target: target)
                                .class("stretched-link")
                        }
                        .class("post-card-title")

                        Text(tagline)
                            .class("post-card-description")

                        Text(status)
                            .class("badge-soon")
                            .margin(.top, .small)
                    }
                }
                .class("app-header")
            }
            .class("post-card-body")

            Image(image, description: imageDescription)
                .class("app-card-image")
        }
        .class("post-card", "app-card")
    }
}

struct SecondSkin: StaticPage {
    var title = "Second Skin"
    var path = "/apps/second-skin"
    var description = "Second Skin is an iOS app for keeping track of your tattoos, from idea to healed."

    var body: some HTML {
        Section {
            AppIcon(image: nil, name: "Second Skin")

            Section {
                Text("Second Skin")
                    .font(.title1)

                Text("Your tattoos, from idea to healed.")
                    .font(.lead)

                Text("Coming soon to iPhone and iPad")
                    .class("badge-soon")
            }
        }
        .class("app-header")
        .margin(.bottom, .large)

        Text(markdown: """
        Second Skin is an iOS app for keeping track of your tattoos: the pieces you have, \
        the ideas you're planning, your bookings and some fun stats along the way. \
        It's private by design, with no sign-up, no ads, no tracking and no servers.
        """)

        Section {
            Image("/images/posts/building-second-skin/welcome.jpg", description: "The Second Skin welcome screen")
            Image("/images/posts/building-second-skin/progress-dark.jpg", description: "Second Skin screens in dark mode")
        }
        .class("screenshots")

        Text(markdown: "I'm building it in public. You can follow along in the [Building Second Skin](/posts/building-second-skin/) series.")

    }
}
