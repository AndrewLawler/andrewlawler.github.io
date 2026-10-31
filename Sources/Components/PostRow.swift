import Foundation
import Ignite

/// One post in a list: title, date and description.
struct PostRow: HTML {
    var article: Article

    var body: some HTML {
        Section {
            Text {
                Link(article)
            }
            .font(.title4)
            .margin(.bottom, .xSmall)

            Text(article.date.formatted(date: .abbreviated, time: .omitted))
                .font(.small)
                .foregroundStyle(.secondary)
                .margin(.bottom, .xSmall)

            Text(article.description)
        }
        .margin(.bottom, .large)
    }
}
