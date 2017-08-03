//
//  Section.swift
//  TBODeveloperOverlay
//
//  Created by Cornelius Horstmann on 28.07.17.
//  Copyright © 2017 TBO Interactive GmbH & CO KG. All rights reserved.
//

import Foundation

public struct Section {
    public var items: [Item]
    public var title: String?
    public var footer: String?
    
    public init(items: [Item], title: String? = nil, footer: String? = nil) {
        self.items = items
        self.title = title
        self.footer = footer
    }
}

public extension Section {
    enum Item {
        case info(title: String, detail: String?)
        case segue(title: String, detail: String?)
        case action(title: String, detail: String?)
        
        var reuseIdentifier: String {
            switch self {
            case .info: return "info"
            case .segue: return "segue"
            case .action: return "action"
            }
        }
    }
}
