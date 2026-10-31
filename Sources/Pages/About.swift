import Foundation
import Ignite

// DRAFT: a short factual placeholder put together from Andy's blog posts.
// Andy to rewrite in his own words before this goes live.

struct About: StaticPage {
    var title = "About"

    var body: some HTML {
        Text("About")
            .font(.title1)

        Text(markdown: """
        I'm Andy, an iOS engineer based in the north of England. I'm currently at \
        [Depop](https://www.depop.com), on the Better Matching Experience team, working on \
        the home, discover and search screens.
        """)

        Text(markdown: """
        Before that I spent several years at Sky Bet in Leeds, and did my university \
        placement year at Jigsaw in Manchester.
        """)

        Text(markdown: """
        In my spare time I'm building [Second Skin](/apps/second-skin/), an app for keeping \
        track of your tattoos, and writing about it as I go.
        """)
    }
}
