//
//  Theme+General.swift
//
//
//  Created by Andrew Lawler on 13/10/2023.
//

import Publish

public extension Theme {
    static var general: Self {
        Theme(
            htmlFactory: BlogSiteHTMLFactory(),
            resourcePaths: ["Resources/SiteTheme/styles.css"]
        )
    }
}
