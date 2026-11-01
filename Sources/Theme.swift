import Foundation
import Ignite

// The accent is iOS systemPink (light and dark variants). Everything else uses
// Ignite's defaults, which already follow the system font and colour scheme.

struct SiteLightTheme: Theme {
    var colorScheme = ColorScheme.light
    var accent = Color(hex: "#FF2D55")
    var link = Color(hex: "#FF2D55")
    var hoveredLink = Color(hex: "#D30F45")
    var siteWidth = ResponsiveValues(small: .px(576), medium: .px(720), large: .px(760))
}

struct SiteDarkTheme: Theme {
    var colorScheme = ColorScheme.dark
    var accent = Color(hex: "#FF375F")
    var link = Color(hex: "#FF375F")
    var hoveredLink = Color(hex: "#FF6482")
    var siteWidth = ResponsiveValues(small: .px(576), medium: .px(720), large: .px(760))
}
