---
title: Back after 6 years: my SwiftLeeds 2026 best bits 🎤
date: 2026-10-17
description: Where I've been for the last six years, and my highlights from my sixth SwiftLeeds, from SwiftUI's TextRenderer to building an audience for your apps.
tags: swift, ios, career, techtalks
image: https://andrewlawler.github.io/images/posts/swiftleeds-2026/cover.jpg
alt: Cover image for Back after 6 years: my SwiftLeeds 2026 best bits 🎤
---

Hi! 👋🏻 I'm Andy. It's been over 6 years now since I last wrote on this blog, it baffles me too that it's been that long... When I started writing here I was just a university student who had found iOS development and started doing tons and tons of YouTube tutorials and courses (shoutout to Sean Allen for those). Over time I felt like I learned something and I wanted to share it with others.

![My Memoji, doing a call-me hand gesture](/images/posts/swiftleeds-2026/andy-memoji.png)

## 📍 Where have I been?

After a short while I started spending my free time at an app agency and then I managed to get a placement year during my degree working for Jigsaw which at the time was a dating app based in Manchester.

This was my first real insight into what working on a real app was like. I managed to work on and ship my own features, test releases and really feel part of a team. 

After going back to university and finishing my degree, I then moved on to work for Sky Bet in Leeds. Here I worked on the main Sky Bet iOS app each day, building things like our new dynamic content system to show different things on the home screen to our users and then later being quite a key part in a huge migration to a brand new Sky Bet app. 

That was quite a challenge and I definitely wanted to try something new, so now I'm working at Depop as part of the Better Matching Experience team. Here I get to work daily on improving the experience for our users on the home, discover and search screens and much more. Enough about me anyway... why am I back?

Well, I just attended the SwiftLeeds iOS conference for the whopping 6th time. Yes, you read that right, 6th time. It left me with the motivation to share and that's what has led me to revive this blog. So without further ado, here is a little round-up of the conference, my favourite bits and some takeaways.

![My SwiftLeeds 2026 badge, designed like a boarding pass](/images/posts/swiftleeds-2026/swiftleeds-2026-badge.jpg)
*Boarding pass number six. ✈️*

---

## 🏆 My two favourite talks

### Delightful Text-Driven Experiences with SwiftUI's TextRenderer ([Eli Perkins](https://eliperkins.com))

Eli works on [Particle](https://apps.apple.com/us/app/particle-personalized-news/id6683283775) and showed how SwiftUI's [`TextRenderer`](https://developer.apple.com/documentation/swiftui/textrenderer) lets you bring your text to life and really delight your users. Eli's talk made me realise that we often think about animating our screens and creating interesting things for our users, but I don't often consider doing the same with the text as well.

So how do text renderers work and how do we use one? Well first, to use them you can add the `.textRenderer` modifier to your text, passing in a renderer.

```swift
Text("Hello, World!")
    .textRenderer(Passthrough())
```

To create a renderer, you conform your struct to the `TextRenderer` protocol and implement `draw(layout:in:)`. The simplest one just draws every line as normal:

```swift
struct Passthrough: TextRenderer {
    func draw(layout: Text.Layout, in context: inout GraphicsContext) {
        for line in layout {
            context.draw(line)
        }
    }
}
```

SwiftUI hands your renderer the text broken into lines, and each line into runs. A run is a chunk of the line that's styled differently from the text around it, so a bold word or an inline icon, for example, ends up in its own run. Inside each run are the glyphs: every letter, space and punctuation mark.

![Diagram: Text.Layout contains a Line, the Line contains three runs (Hello, a bold SwiftLeeds, and !), and each letter in a run is a glyph](/images/posts/swiftleeds-2026/textrenderer-layout.png)

You can apply operations like opacity and colour to any of those levels, and group them, much like you would with images. Every `TextRenderer` is also `Animatable`, so if you add an `animatableData` property and animate it, you can reveal text line by line or glyph by glyph.

Here's a quick example of that. This renderer fades each glyph in and slides it up into place, one after the other:

```swift
struct AppearRenderer: TextRenderer {
    var progress: Double

    var animatableData: Double {
        get { progress }
        set { progress = newValue }
    }

    func draw(layout: Text.Layout, in context: inout GraphicsContext) {
        // Lines → runs → glyphs
        let glyphs = layout.flatMap { $0 }.flatMap { $0 }
        let count = Double(glyphs.count)

        for (index, glyph) in glyphs.enumerated() {
            let start = Double(index) / count * 0.7
            let amount = min(max((progress - start) / 0.3, 0), 1)

            var copy = context
            copy.opacity = amount
            copy.translateBy(x: 0, y: (1 - amount) * 20)
            copy.draw(glyph)
        }
    }
}
```

Animate `progress` from 0 to 1 and you get this:

![Animated GIF: the text "Hello, SwiftLeeds!" appears one glyph at a time, each letter fading in and sliding up into place](/images/posts/swiftleeds-2026/textrenderer-appear.gif)

> 💡 **Tip:** Paul Hudson's [Prismic](https://github.com/twostraws/Prismic) is a collection of ready-made renderers to play with. I'm starting there while exploring ways to bring some text renderers to my personal projects and also at work.

### Building Beyond Mistakes ([Frank Solleveld](https://github.com/FrankSolleveld))

My favourite talk on day two had no code in it. Frank wasn't even supposed to be doing a talk at the conference but as one of the other speakers fell ill, Frank was ready in the wings to give us his talk.

This talk was different from the others. Frank talked about his start with iOS development, how he found the love for building things but as most of us did, he struggled when he had his first real taste of working in a company. I still remember myself the first time I worked on a real app as part of a company and how different that experience was compared to the apps I'd spent my own time building, so I could relate to this part of the talk.

Frank took us on a journey, where he talked about his doubts and confidence knocks he had during the early start of his career but then how he managed to really excel and eventually find his way to where he is today. A few things from his talk that I'm taking with me:

![Frank's advice for building beyond mistakes: 1. Communicate about expectations. 2. Build for a real problem, whether it's for yourself or for other people. 3. Don't give up on yourself. Building things isn't easy.](/images/posts/swiftleeds-2026/frank-advice.png)

> 💬 People are just people, even conference speakers. Everyone is just part of the community.

This talk really resonated with me, and I think it did for everyone else too, as after speaking to other attendees it seemed to be everyone's favourite of the conference. I'm looking forward to seeing this one published online.

## 🤖 Working with AI without losing the craft

### Bringing back the love of Swift ([Antoine van der Lee](https://www.avanderlee.com))

Antoine opened the conference with this one. This talk hit the mark with everyone in the room, as I think we all ask ourselves quite often if the vast change to our careers due to AI has made us love the code we are writing less.

> 💬 Are we losing our love of Swift as we write less of the code ourselves?

Antoine raised the concern that developers aren't really taking as many courses anymore. People are even reading fewer articles which doesn't bode well for me beginning to write more on this blog. He also went on to say that developers are exploring code less, but in reality we are shipping more than ever. 

I can only speak from my own experience but I feel that. I've always been a relatively high-output engineer and I'm a fan of having a few things on the go, but AI has made that a different ball game.

The sheer amount of code output I see per week now with AI does mean that we aren't as close to the code we are writing and I know for myself, I'm reading less and exploring less online as a result. This talk made me reflect, and I think the outcome for me is that I want to ground myself more in the technology I'm using every day.

Alongside these topics, Antoine shared some tips for working with AI, such as:

![Antoine's tips for working with AI: 1. Use Plan mode, even for tasks that look too simple to need it. 2. Ask the agent to review your usage, and automate any step that repeats. 3. Give the AI as much visibility as you can, with MCPs and other tools. 4. Use models from different providers to review each other's work.](/images/posts/swiftleeds-2026/antoine-ai-tips.png)

He also shared some handy tools:

- [RocketSim and RocketTrace](https://www.avanderlee.com/ai-development/agentic-ios-development-rocketsim-rockettrace/), a CLI and agent skill for driving the simulator, plus Xcode Instruments for AI agents.
- [sosumi.ai](https://sosumi.ai), Apple's docs (including the Human Interface Guidelines) in a form agents can read.
- His post on [reducing token usage in Claude Code, Codex and Cursor](https://www.avanderlee.com/ai-development/reduce-token-usage-claude-code-codex-cursor/).

Overall, I really enjoyed this one and I think we can all take something from it.

### From Code to Outcomes ([Natalija Marcinska](https://www.linkedin.com/in/nmarcinska))

Natalija (BBC Mobile) closed day one, and her talk felt like a nice follow-on from Antoine's, as it came at AI from the product side. Her point was that AI has made it easier than ever to build the wrong thing really quickly. You can build an amazing technical solution, but if your users don't actually need it then all of that time has been wasted.

She talked about how engineers already make product decisions every day, so we should also be asking whether something should be built at all, and that discovery is part of engineering too. The line that stuck with me was this one:

> 💬 The best code to delete is the code for a feature that would have wasted months.

My takeaways from this one:

![Building with user impact in mind: 1. Busy isn't the same as valuable. Did the thing you built actually help your users? 2. Get engineering in early. It shapes solutions that are more technically sound. 3. Validate with scrappy experiments. Build the smallest safe version first, then invest.](/images/posts/swiftleeds-2026/natalija-takeaways.png)

## 🗄️ You might not need a backend yet

### CloudKit Public Database as a Backend ([Danijela Vrzan](https://www.danijelavrzan.com))

Danijela opened day two, and her main advice was to avoid building a backend for as long as possible. So before reaching for one, ask yourself:

![Before you build a backend, ask yourself: 1. Could you use SwiftData? 2. Could you bundle the content into the app? 3. Could you rely on third-party APIs directly?](/images/posts/swiftleeds-2026/cloudkit-questions.png)

If you do need shared data, the CloudKit Public Database might be the answer. It's managed by Apple, shared across all the users of your app and doesn't need an account system of your own. It's best for static-ish content though, and it isn't the place to store anything sensitive.

> ⚠️ **Tip:** Development and Production are separate environments in CloudKit. Don't forget to deploy your schema changes from Development to Production, and be aware that any records you upload to Development won't be carried across. If you've uploaded lots of data, you'll have to upload it all again.

This one got me thinking about my own app. Rather than baking configuration straight into the app, I could use the public database alongside the private one to store key content. Definitely one to explore.

## 📣 Building an audience

### Building an Audience for Your Apps (Joe Allen)

Joe, who makes [Teleprompter Pro](https://teleprompterpro.com), closed out the conference. For years Joe slowly built up an email list from within his apps, so when he released something new, he let his audience know and got a huge influx of downloads. His point was that an audience is your unfair advantage:

> 💬 Your competitors don't have *your* audience.

The obvious worry is "I don't want to spam my users", and Joe's answer to that was... you could just not spam them. 😄 You do need to think about GDPR when you contact users though, and you shouldn't hold your content or features hostage just to get someone's email address.

> 💡 **Tip:** Register the domains and addresses you send email from in your Apple Developer account (Certificates, Identifiers & Profiles, under Sign in with Apple for Email Communication). Users who Sign in with Apple may be using Private Relay, and without that setup your emails won't reach them.

I'd love to think more about how we do this at Depop. For my own apps, I'm keeping things private with no email list, so this blog is going to be my way of building an audience instead.

## ⚡ The quickfire round

There were plenty of other great talks too, so here's a quick look at the rest:

- **Unleash the power of Swift Charts** (Francesco Marini). This one was all about making your charts readable and accessible. Check your colour palette with [Viz Palette](https://projects.susielu.com/viz-palette), use a font you know is readable like [Lexend](https://fonts.google.com/specimen/Lexend) or [OpenDyslexic](https://opendyslexic.org), format your legend and axes, and pick the right mark for the job (bar or line?). He also showed [TabularData](https://developer.apple.com/documentation/tabulardata), which is really handy for loading CSV and JSON into a `DataFrame`.
- **CarPlay from Zero** ([Eyad Kelleh](https://eyadkelleh.com) & [Maurice Pfurr](https://www.linkedin.com/in/maurice-pfurr)). Eyad and Maurice built [Charge a Smile](https://www.chargeasmile.com) to compare EV charging prices. CarPlay apps are built from Apple's templates rather than custom UI, and the entitlement you request decides which ones you get.
- **Vapor 5 is actually here** ([Tim Condon](https://www.timc.dev)). Vapor 4 has been around since 2020 with over 300 releases, so this is a big one! Vapor 5 focuses on performance, structured concurrency throughout and macro-based routing. [The beta is out now](https://blog.vapor.codes/posts/vapor-5-beta/) and I'm keen to give the macro-based routing a go.
- **Beyond Boilerplate: Production-Ready Swift Macros** ([Kevin Morales](https://kevinhomorales.com)). Macros are great for stable, repeated patterns, but if the code changes often, or you'd only be saving a few lines, it's probably not worth it. I'm wondering whether there are some custom macros I could use for validation. [Sample code here](https://github.com/KevinhoMorales/BeyondBoilerplate-SwiftMacros).
- **Who Let the App Intents Out?** ([Claire Sivadier](https://clairerimel.github.io)). App Intents let your app's actions run from Siri, Shortcuts and Apple Intelligence, and with the new Siri relying on them they're well worth a look. Claire's app [Peticle](https://www.peticle.app) shows them off well.
- **Why Does Our Swift Code Work?** ([Yuki Aki](https://freddi.dev)). I loved the analogy here: the compiler is the safe road and the runtime is the car driving along it. Yuki walked us through the pipeline from `.swift` to AST, type-checked AST, raw SIL, canonical SIL, LLVM IR and finally a `.o` file. It made me think more about how I structure my code, and how much the compiler has to work out in a single expression.
- **Getting physical: Using Swift for 3D printing** ([Eric Bariaux](https://github.com/ebariaux)). With [Cadova](https://github.com/tomasf/Cadova) you can design 3D-printable models in Swift, SwiftUI-style, and watch them update in real time in CadovaViewer, a bit like a SwiftUI preview. This one is purely for fun, but I'm definitely giving it a go.
- **Swift Meets Kotlin** ([Yeskendir Salgara](https://github.com/sorunokoe)). Trackman shares its Domain and Data layers through Kotlin Multiplatform and keeps the UI and Presentation layers in native Swift, using [SKIE](https://github.com/touchlab/SKIE) to make the bridge between them feel more like Swift. Even if you never use KMP, it's a good reminder that getting your layering right matters in any architecture.

## 🛠️ What I'm going to try

So after two days of talks, here's what I'm taking away to try:

- Playing around with `TextRenderer` effects, starting with Prismic
- Adding App Intents for the main actions in my own app, and thinking about how I can future-proof it with all the Siri changes coming in
- Considering the CloudKit Public Database for storing information that all users can use
- Building an audience through this blog (no spam, I promise)
- The Vapor 5 beta, and maybe a 3D print designed in Swift
- And after Frank's talk, releasing something new in 2026

A lot of these are going to end up in my side project, **Second Skin**. It's an iOS app for keeping track of your tattoos: the pieces you have, the ideas you're collecting, the sessions you've booked and your aftercare routine. It's built in SwiftUI with no accounts and no servers, as everything syncs through your own iCloud, so Danijela's talk came at a pretty good time. It's still early days, but hopefully this is the something new that Frank's talk pushed me to release. I'll be writing more about building it here, so watch this space! 👀

![The SwiftLeeds closing slide on stage: "Built by humans. Thank you for being part of it."](/images/posts/swiftleeds-2026/swiftleeds-2026-closing.jpg)
*Built by humans. A fitting way to close a conference where AI came up in so many of the talks.*

Thanks to everyone who organised, spoke at and came along to SwiftLeeds this year, it was another great one. See you all at number seven! If you were there, I'd love to hear what your favourite talk was in the comments.
