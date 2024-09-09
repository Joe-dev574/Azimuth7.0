//
//  Objective.swift
//  Azimuth7.0
//
//  Created by Joseph DeWeese on 9/9/24.
//

import SwiftUI
import SwiftData

@Model
class Objective: Codable {
    /// Properties
    var title: String
    var remarks: String
    var dateAdded: Date
    var category: String
    var tintColor: String
    var enableReminder: Bool = false
    var reminderID: String = ""
    
    init(title: String, remarks: String, dateAdded: Date, category: Category, tintColor: TintColor) {
        self.title = title
        self.remarks = remarks
        self.dateAdded = dateAdded
        self.category = category.rawValue
        self.tintColor = tintColor.color
    }
    /// Conforming Codable Protocol
    enum CodingKeys: CodingKey {
        case title
        case remarks
        case dateAdded
        case category
        case tintColor
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decode(String.self, forKey: .title)
        remarks = try container.decode(String.self, forKey: .remarks)
        dateAdded = try container.decode(Date.self, forKey: .dateAdded)
        category = try container.decode(String.self, forKey: .category)
        tintColor = try container.decode(String.self, forKey: .tintColor)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(title, forKey: .title)
        try container.encode(remarks, forKey: .remarks)
        try container.encode(dateAdded, forKey: .dateAdded)
        try container.encode(category, forKey: .category)
        try container.encode(tintColor, forKey: .tintColor)
    }
    
    /// Extracting Color Value from tintColor String
    @Transient
    var color: Color {
        return tints.first(where: { $0.color == tintColor })?.value ?? Constants.shared.tintColor
    }
    
    @Transient
    var tint: TintColor? {
        return tints.first(where: { $0.color == tintColor })
    }
    
    @Transient
    var rawCategory: Category? {
        return Category.allCases.first(where: { category == $0.rawValue })
    }
}

