//
//  TabModel.swift
//  Azimuth7.0
//
//  Created by Joseph DeWeese on 9/10/24.
//

import SwiftUI

/// App Tab's
enum Tab: String, CaseIterable {
    case grind = "Grind"
    case objectives = "Objectives"
    case search = "Search"
    case notes = "Notes"
  
    
    
    var systemImage: String {
        switch self {
        case .grind:
            return "mug.fill"
        case .objectives:
            return "location.north.circle"
        case .search:
            return "magnifyingglass.circle"
        case .notes:
            return "square.and.pencil.circle"
       
        }
    }
    
    var index: Int {
        return Tab.allCases.firstIndex(of: self) ?? 0
    }
}



