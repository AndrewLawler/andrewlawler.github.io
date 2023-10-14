//
//  BlogSiteHTMLFactory.swift
//
//
//  Created by Andrew Lawler on 13/10/2023.
//

import Foundation
import Publish
import Plot

extension DateFormatter {
    func formattedDate(for date: Date) -> String {
        dateStyle = .medium
        return string(from: date).replacingOccurrences(of: ",", with: "")
    }
}

struct BlogSiteHTMLFactory<Site: Website>: HTMLFactory {
    func makeIndexHTML(for index: Index,
                       context: PublishingContext<Site>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: index, on: context.site),
            .body {
                SiteHeader(context: context, selectedSelectionID: nil)
                MostRecentArticle(context: context)
                RecentArticles(context: context, header: "Recent SwiftUI Articles", tag: "swiftui")
                RecentArticles(context: context, header: "Recent UIKit Articles", tag: "uikit")
                SiteFooter()
            }
        )
    }

    func makeSectionHTML(for section: Section<Site>,
                         context: PublishingContext<Site>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: section, on: context.site),
            .body {
                SiteHeader(context: context, selectedSelectionID: section.id)
                Wrapper {
                    H1(section.title)
                        .class("section-title")
                    ItemList(items: section.items, site: context.site)
                }
                SiteFooter()
            }
        )
    }

    func makeItemHTML(for item: Item<Site>,
                      context: PublishingContext<Site>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: item, on: context.site),
            .body(
                .class("item-page"),
                .components {
                    SiteHeader(context: context, selectedSelectionID: item.sectionID)
                    Wrapper {
                        Article {
                            H1(item.title)
                            Div {
                                ItemTagList(item: item)
                                Paragraph("Published: \(DateFormatter().formattedDate(for: item.date))")
                            }
                            .class("article-tag-and-date")
                            Div(item.body)
                        }.class("content")
                    }
                    SiteFooter()
                }
            )
        )
    }

    func makePageHTML(for page: Page,
                      context: PublishingContext<Site>) throws -> HTML {
        HTML(
            .lang(context.site.language),
            .head(for: page, on: context.site),
            .body {
                SiteHeader(context: context, selectedSelectionID: nil)
                H1(page.title)
                Wrapper(page.body)
                SiteFooter()
            }
        )
    }

    func makeTagListHTML(for page: TagListPage,
                         context: PublishingContext<Site>) throws -> HTML? {
        HTML(
            .lang(context.site.language),
            .head(for: page, on: context.site),
            .body {
                SiteHeader(context: context, selectedSelectionID: nil)
                Wrapper {
                    H1("Browse all tags")
                    List(page.tags.sorted()) { tag in
                        ListItem {
                            Link(tag.string, url: context.site.path(for: tag).absoluteString)
                        }
                        .class("tag")
                    }
                    .class("all-tags")
                }
                SiteFooter()
            }
        )
    }

    func makeTagDetailsHTML(for page: TagDetailsPage,
                            context: PublishingContext<Site>) throws -> HTML? {
        HTML(
            .lang(context.site.language),
            .head(for: page, on: context.site),
            .body {
                SiteHeader(context: context, selectedSelectionID: nil)
                Wrapper {
                    H1 {
                        Text("Tagged with ")
                        Span(page.tag.string)
                            .class("tag")
                    }

                    Link("Browse all tags",
                        url: context.site.tagListPath.absoluteString
                    )
                    .class("browse-all")

                    ItemList(
                        items: context.items(
                            taggedWith: page.tag,
                            sortedBy: \.date,
                            order: .descending
                        ),
                        site: context.site
                    )
                }
                SiteFooter()
            }
        )
    }
}

private struct Wrapper: ComponentContainer {
    @ComponentBuilder var content: ContentProvider

    var body: Component {
        Div(content: content).class("wrapper")
    }
}

private struct MostRecentArticle<Site: Website>: Component {
    var context: PublishingContext<Site>

    var body: Component {
        Wrapper {
            H1("Latest Article").class("recent-articles-header")
            ItemList(
                items: [context.allItems(sortedBy: \.date, order: .descending)[0]],
                site: context.site
            )
        }
    }
}

private struct RecentArticles<Site: Website>: Component {
    var context: PublishingContext<Site>
    let header: String
    let tag: String

    var body: Component { itemToReturn }

    // MARK: - Private Methods

    private var items: [Item<Site>] {
        context.items(taggedWith: .init(tag), sortedBy: \.date, order: .descending)
    }

    private var itemToReturn: Component {
        !items.isEmpty ? recentArticlesDiv : Div()
    }

    private var recentArticlesDiv: Component {
        Wrapper {
            H1(header).class("recent-articles-header")
            ItemList(
                items: context.items(taggedWith: .init(tag), sortedBy: \.date, order: .descending),
                site: context.site
            )
        }
    }
}

private struct SiteHeader<Site: Website>: Component {
    var context: PublishingContext<Site>
    var selectedSelectionID: Site.SectionID?

    var body: Component {
        Header {
            Wrapper {
                Image(url: "https://ca.slack-edge.com/T02D8450YTY-U02DYH5H11D-6e9d1e533981-512", description: "Profile Image")
                    .class("circular-portrait")
                Div {
                    Link("andylawlerdev.", url: "/")
                        .class("site-name")
                    Paragraph {
                        Text("iOS Articles and Content by ")
                        Link("Andy Lawler", url: "https://www.x.com/andylawlerdev")
                    }.class("site-description")
                }.class("site-information")
                if Site.SectionID.allCases.count >= 1 {
                    navigation
                }
            }
        }
    }

    private var navigation: Component {
        Navigation {
            List(Site.SectionID.allCases) { sectionID in
                let section = context.sections[sectionID]

                return Link(section.title,
                    url: section.path.absoluteString
                )
                .class(sectionID == selectedSelectionID ? "selected" : "")
            }
        }
    }
}

private struct ItemList<Site: Website>: Component {
    var items: [Item<Site>]
    var site: Site

    var body: Component {
        List(items) { item in
            Article {
                H1(Link(item.title, url: item.path.absoluteString))
                Div {
                    ItemTagList(item: item, site: site)
                    Paragraph(DateFormatter().formattedDate(for: item.date))
                }
                .class("article-tag-and-date")
                Paragraph(item.description)
            }
        }
        .class("item-list")
    }
}

private struct ItemTagList<Site: Website>: Component {
    var item: Item<Site>
    var site: Site?

    var body: Component {
        if let site {
            List(item.tags) { tag in
                Link(tag.string, url: site.path(for: tag).absoluteString).class("tag-\(tag.string.lowercased())")
            }.class("tag-list")
        } else {
            List(item.tags) { tag in
                Paragraph(tag.string).class("tag-\(tag.string.lowercased())")
            }.class("tag-list")
        }
    }
}

private struct SiteFooter: Component {
    var body: Component {
        Footer {
            Paragraph {
                Text("AndyLawlerDev © 2023")
            }
            Paragraph {
                Text("Built in Swift using ")
                Link("Publish", url: "https://github.com/johnsundell/publish")
            }
            Paragraph {
                Link("Twitter", url: "https://www.x.com/andylawlerdev")
                Text(" | ")
                Link("LinkedIn", url: "https://www.linkedin.com/in/andrewlawler-io/")
                Text(" | ")
                Link("Mastodon", url: "https://mastodon.social/@andylawlerdev")
            }
        }
    }
}
