import Foundation
import Ignite

// The accent is the blue from the old Publish site. Everything else uses
// Ignite's defaults, which already follow the system font and colour scheme.

struct SiteLightTheme: Theme {
    var colorScheme = ColorScheme.light
    var accent = Color(hex: "#1F6FD1")
    var link = Color(hex: "#1F6FD1")
    var hoveredLink = Color(hex: "#174F96")
    var siteWidth = ResponsiveValues(small: .px(576), medium: .px(720), large: .px(760))
}

struct SiteDarkTheme: Theme {
    var colorScheme = ColorScheme.dark
    var accent = Color(hex: "#5AA2F5")
    var link = Color(hex: "#5AA2F5")
    var hoveredLink = Color(hex: "#8CBEF8")
    var siteWidth = ResponsiveValues(small: .px(576), medium: .px(720), large: .px(760))
}
