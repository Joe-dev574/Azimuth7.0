//
//  HapticManager.swift
//  Azimuth7.0
//
//  Created by Joseph DeWeese on 9/10/24.
//

import Foundation
import SwiftUI

class HapticManager {
    static private let generator = UINotificationFeedbackGenerator( )
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
}
