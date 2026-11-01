import Foundation
import Ignite

// The About page: an intro, then two tabs (Outside of work, and How I got here, a
// timeline of jobs and milestones), then links to say hi. The text is Andy's own.

struct About: StaticPage {
    var title = "About"

    var body: some HTML {
        Text("About")
            .font(.title1)

        Text("The longer version: how I got into iOS, where I've worked, and what I get up to away from the keyboard.")
            .font(.lead)
            .margin(.bottom, .xLarge)

        // Two tabs, Outside of work first. Without JavaScript both panels just show in order.
        Include("about-segments.html")

        Section {
            Text("My most important role is being a Dad.")
                .font(.lead)

            Text(markdown: """
            When I'm not with family and at work, I'm also massively into music. I've never \
            really been the best guitar player, even though I have tried to learn many, many \
            Metallica riffs. Instead of playing, I try and support friends as much as possible \
            with music and this has led me to many shows and many festivals across the UK and abroad.
            """)

            Text(markdown: """
            Other than music I'm really interested in traditional tattooing, as you might see from \
            my posts and [side projects](/apps/second-skin/).
            """)

            Text(markdown: """
            In the other free time I have, I've also got into the gym a lot more in 2026 and I'm \
            trying to focus on performance.
            """)
        }
        .id("outside-of-work")
        .class("segment-panel")
        .attribute("role", "tabpanel")
        .aria(.labelledBy, "tab-outside-of-work")

        Section {
            Section {
                TimelineStep(
                    date: "2018",
                    title: "Started a Computer Science degree",
                    icon: "mortarboard",
                    place: "University of Liverpool",
                    text: """
                    Here I was a student who found iOS as a module at University and then found a \
                    brand new world which I was really passionate about. I then spent all my free \
                    time and money on courses to learn more.
                    """
                )

                TimelineStep(
                    date: "Oct 2019 to Feb 2020",
                    title: "iOS Developer intern",
                    icon: "briefcase",
                    place: "Apposing",
                    text: """
                    I started spending my free time outside of University at Apposing, an app agency \
                    in Liverpool. At the time Apposing worked on some really cool projects like \
                    Footasylum and the LFC app. This was my first real introduction to what a working \
                    environment was like and it enabled me to see more about how apps are built and \
                    what steps must be taken to build them properly.
                    """
                )

                TimelineStep(
                    date: "2020",
                    title: "Built classi",
                    icon: "car-front",
                    place: "University project",
                    text: """
                    [Classi](/apps/) was a classic car marketplace which was a University group \
                    project I did with some friends. It was the first app I've really ever designed \
                    start to finish and had to implement on my own. It was the first time I worked \
                    with other people and integrated with a real backend. This let me apply the \
                    skills I'd learned from Apposing into a real project.
                    """,
                    kind: .milestone
                )

                TimelineStep(
                    date: "Jun 2020 to Sep 2021",
                    title: "QA and iOS Developer",
                    icon: "puzzle",
                    place: "Jigsaw",
                    text: """
                    Jigsaw was my first insight into working longer term as a member of a team within \
                    a company. I got to see what a start-up was like, how iOS and Android apps could \
                    be built by a small team and how changes we made could impact people all over \
                    the world. It was the first time I got to build my own features and see them \
                    within a real production app and it was my first time being involved in QA which \
                    led to me testing releases such as our first release to users in New York.
                    """,
                    app: CompanyApp(name: "Jigsaw", url: "https://apps.apple.com/gb/app/id930197933")
                )

                TimelineStep(
                    date: "2020",
                    title: "Shipped my first app",
                    icon: "rocket-takeoff",
                    place: "TaskList",
                    text: """
                    [TaskList](/apps/) was the first app I ever shipped. It was built just after \
                    SwiftUI was first announced and was supposed to just allow me to learn it more. \
                    Instead it grew into a project that saw me learn about on device storage, how to \
                    upload builds to App Store Connect and how to set up an app to actually be \
                    released on the App Store.
                    """,
                    kind: .milestone
                )

                TimelineStep(
                    date: "2022",
                    title: "Finished my degree",
                    icon: "mortarboard-fill",
                    place: "University of Liverpool",
                    text: """
                    I worked on another app in my final year dissertation. This was to show the \
                    learnings I'd taken away from my prior experience. I built an app using the \
                    VIPER architecture and wrote my dissertation on how good app architecture can \
                    make building a modular app really easy.
                    """,
                    kind: .milestone
                )

                TimelineStep(
                    date: "Jun 2022 to May 2024",
                    title: "iOS Engineer",
                    icon: "phone",
                    place: "Sky Betting & Gaming, Leeds",
                    text: """
                    This was my first real role out of University and not as a year in industry. I \
                    got to see how the expectations for a mid-level iOS engineer differed from my \
                    junior roles and I was able to prove myself and work on some really cool things, \
                    such as our dynamic content system for the Sky Bet app which let us show \
                    different modules in different orders on the app without an app release. I also \
                    worked on some pretty cool migrations to get away from legacy Objective-C code \
                    as Sky Bet was quite an old app.
                    """,
                    app: CompanyApp(name: "Sky Bet", url: "https://apps.apple.com/gb/app/id428237841")
                )

                TimelineStep(
                    date: "May 2024 to Sep 2025",
                    title: "Senior iOS Software Engineer",
                    icon: "graph-up-arrow",
                    place: "Sky Betting & Gaming, Leeds",
                    text: """
                    My promotion from Mid Level to Senior within Sky Bet. This saw me take on more of \
                    a mentoring role within the team and also a leadership one as we had a pivotal \
                    transformation project to deliver. This saw me not only build my skills as a new \
                    Senior engineer but I had to also mentor others, create a solid delivery plan and \
                    be a solid technical voice within a challenging migration. This migration was a \
                    success and since it was pre-AI it was quite a lot of hands on work for us all.
                    """
                )

                TimelineStep(
                    date: "Sep 2025 to now",
                    title: "iOS Engineer II",
                    icon: "bag-heart",
                    place: "Depop, remote",
                    text: """
                    After working on such a pivotal project at Sky Bet I definitely wanted a \
                    challenge. I wanted to join a company with more engineers for me to learn from as \
                    I'd already taken quite a high role at Sky Bet. Depop enabled me to join a \
                    thriving team working on some of the highest engagement areas of the app. Even \
                    within my first year I've worked on features across Home, Search, Discover and \
                    landing pages and I've been a core part of mass architectural change within Home \
                    which has enabled us to truly deliver a more personalised experience for our \
                    users. I'm also trying to provide my mentoring and leadership skills alongside \
                    knowledge sharing within our internal forums.
                    """,
                    app: CompanyApp(name: "Depop", url: "https://apps.apple.com/gb/app/id518684914"),
                    kind: .current
                )
            }
            .class("timeline")
            .attribute("role", "list")
        }
        .id("how-i-got-here")
        .class("segment-panel")
        .attribute("role", "tabpanel")
        .aria(.labelledBy, "tab-how-i-got-here")

        Text("👋🏻 Say hi")
            .font(.title3)
            .margin(.top, .xLarge)

        Text(markdown: """
        You can find me on [LinkedIn](https://www.linkedin.com/in/andrewlawler-io/) and \
        [GitHub](https://github.com/AndrewLawler), and my posts also go out on \
        [dev.to](https://dev.to/andylawler).
        """)
    }
}

/// A company app I've had code released in, linked to its App Store page.
struct CompanyApp {
    var name: String
    var url: String
}

/// One step on the About page timeline: a job, a milestone, or where I am now,
/// with an icon in its marker on the line.
struct TimelineStep: HTML {
    enum Kind {
        case job, milestone, current
    }

    var date: String
    var title: String
    /// A Bootstrap Icons name, shown in the step's marker on the line.
    var icon: String
    var place: String
    var text: String
    /// The company's app, shown as an App Store link under the step.
    var app: CompanyApp? = nil
    var kind = Kind.job

    var body: some HTML {
        Section {
            Section {
                // Decorative: the marker is hidden from screen readers, so no description.
                Image(systemName: icon, description: "")
            }
            .class("timeline-icon")
            .aria(.hidden, "true")

            Text {
                Span(date)
                if kind == .current {
                    Span("Now")
                        .class("timeline-now")
                }
            }
            .class("timeline-date")

            Text(title)
                .class("timeline-title")

            Text(place)
                .class("timeline-place")

            Text(markdown: text)
                .class("timeline-text")

            if let app {
                Link(target: app.url) {
                    Image(systemName: "apple", description: "")
                    Span("\(app.name) on the App Store")
                }
                .target(.newWindow)
                .class("timeline-app")
            }
        }
        .class("timeline-step", kindClass)
        .attribute("role", "listitem")
    }

    private var kindClass: String {
        switch kind {
        case .job: "timeline-job"
        case .milestone: "timeline-milestone"
        case .current: "timeline-current"
        }
    }
}
