//
//  TintColor.swift
//  Azimuth7.0
//
//  Created by Joseph DeWeese on 9/9/24.
//

import SwiftUI

/// Custom Tint Colors For Transaction Row
struct TintColor: Identifiable {
    let id: UUID = .init()
    var color: String
    var value: Color
}

var tints: [TintColor]=[
    .init(color: "TaskColor1", value: .taskColor1),
    .init(color: "TaskColor2", value: .taskColor2),
    .init(color: "TaskColor3", value: .taskColor3),
    .init(color: "TaskColor4", value: .taskColor4),
    .init(color: "TaskColor5", value: .taskColor5),
    .init(color: "TaskColor6", value: .taskColor6),
    .init(color: "TaskColor7", value: .taskColor7),
    .init(color: "TaskColor8", value: .taskColor8),
    .init(color: "TaskColor9", value: .taskColor9),
    ]

