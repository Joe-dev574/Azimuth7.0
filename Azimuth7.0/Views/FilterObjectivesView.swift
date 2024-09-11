//
//  FilterObjectivesView.swift
//  Azimuth7.0
//
//  Created by Joseph DeWeese on 9/10/24.
//

import SwiftUI
import SwiftData

/// Custom View
struct FilterObjectivesView<Content: View>: View {
    var content: ([Objective]) -> Content
    
    @Query(animation: .snappy) private var objectives: [Objective]
    init(category: Category?, searchText: String, @ViewBuilder content: @escaping ([Objective]) -> Content) {
        /// Custom Predicate
        let rawValue = category?.rawValue ?? ""
        let predicate = #Predicate<Objective> { objective in
            return (objective.title.localizedStandardContains(searchText) || objective.remarks.localizedStandardContains(searchText)) && (rawValue.isEmpty ? true : objective.category == rawValue)
        }
        
        _objectives = Query(filter: predicate, sort: [
            SortDescriptor(\Objective.dateAdded, order: .reverse)
        ], animation: .snappy)
        
        self.content = content
    }
    
    init(startDate: Date, endDate: Date, @ViewBuilder content: @escaping ([Objective]) -> Content) {
        /// Custom Predicate
        let predicate = #Predicate<Objective> { objective in
            return objective.dateAdded >= startDate && objective.dateAdded <= endDate
        }
        
        _objectives = Query(filter: predicate, sort: [
            SortDescriptor(\Objective.dateAdded, order: .reverse)
        ], animation: .snappy)
        
        self.content = content
    }
    
    /// Optional For Your Customized Usage
    init(startDate: Date, endDate: Date, category: Category?, @ViewBuilder content: @escaping ([Objective]) -> Content) {
        /// Custom Predicate
        let rawValue = category?.rawValue ?? ""
        let predicate = #Predicate<Objective> { objective in
            return objective.dateAdded >= startDate && objective.dateAdded <= endDate && (rawValue.isEmpty ? true : objective.category == rawValue)
        }
        
        _objectives = Query(filter: predicate, sort: [
            SortDescriptor(\Objective.dateAdded, order: .reverse)
        ], animation: .snappy)
        
        self.content = content
    }
    
    
    var body: some View {
        content(objectives)
    }
}
