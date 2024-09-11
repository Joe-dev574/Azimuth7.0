//
//  ObjectivesListScreen.swift
//  Azimuth7.0
//
//  Created by Joseph DeWeese on 9/10/24.
//

import SwiftUI

struct ObjectivesListScreen: View {
    /// View Properties
    @State private var startDate: Date = .now.startOfMonth
    @State private var endDate: Date = .now.endOfMonth
    @State private var showFilterView: Bool = false
    @State private var selectedCategory: Category = .objective
    @State private var selectedObjective: Objective?
    /// For Animation
    @Namespace private var animation
    var body: some View {
        GeometryReader {
            let size = $0.size
            
            NavigationStack{
                ScrollView(.vertical) {
                    LazyVStack(spacing: 10, pinnedViews: [.sectionHeaders]) {
                        Section{
                            /// Date Filter Button
                            Button(action: {
                                showFilterView = true
                                HapticManager.notification(type: .success)
                            }, label: {
                                Text("Date Scope:  \(format(date: startDate,format: "dd.MMM.yy"))  to  \(format(date: endDate,format: "dd.MMM.yy"))")
                                    .font(.callout)
                                    .tint(appTint)
                            })
                            .buttonStyle(.borderedProminent)
                            .hSpacing(.center)
                            FilterObjectivesView(startDate: startDate, endDate: endDate) { objectives in
                                /// Card View
                                ObjectiveCardView()
                            }
                            FilterObjectivesView(startDate: startDate, endDate: endDate, category: selectedCategory) { objectives in
                                ForEach(objectives) { objective in
                                    ObjectiveCardView()
                                        .onTapGesture {
                                            selectedObjective = objective
                                        }
                                }
                            }
                            .animation(.none, value: selectedCategory)
                        } header: {
                            HeaderView(size)
                        }
                    }
                }
            }
            .overlay {
                if showFilterView {
                    DateFilterView(start: startDate, end: endDate, onSubmit: { start, end in
                        startDate = start
                        endDate = end
                        showFilterView = false
                    }, onClose: {
                        showFilterView = false
                    })
                    .transition(.move(edge: .leading))
                }
            }
            .animation(.snappy, value: showFilterView)
        }
    }
    
    ///Header View
    @ViewBuilder
    func HeaderView(_ size: CGSize) -> some View {
        
        HStack{
            HStack {
                Text("Azimuth")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.leading, 40)
                    .foregroundColor(.launchAccent)
                    .offset(y: 2)
                Image(systemName: "location.north.circle")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundStyle(.colorGrey)
                Text("5.0")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.launchAccent)
                    .offset(y: 2)
                
            }
            Spacer()
            NavigationLink {
                ObjectiveView()
            } label: {
                Image(systemName: "plus")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 45, height: 45)
                    .background(appTint.gradient, in: .circle)
                    .contentShape(.circle)
                    .padding(.horizontal)
            }
        }
        .padding(10)
        .background{
            VStack(spacing: 0) {
                Rectangle()
                    .fill(.ultraThinMaterial)
                
                Divider()
            }
            .visualEffect { content, geometryProxy in
                content
                    .opacity(headerBGOpacity(geometryProxy))
            }
            .padding(.horizontal, -15)
            .padding(.top, -(safeArea.top + 15))
        }
    }
    func headerBGOpacity(_ proxy: GeometryProxy) -> CGFloat {
        let minY = proxy.frame(in: .scrollView).minY + safeArea.top
        return minY > 0 ? 0 : (-minY / 15)
    }
    
    func headerScale(_ size: CGSize, proxy: GeometryProxy) -> CGFloat {
        let minY = proxy.frame(in: .scrollView).minY
        let screenHeight = size.height
        
        let progress = minY / screenHeight
        let scale = (min(max(progress, 0), 1)) * 0.4
        
        return 1 + scale
    }
}

#Preview {
    ContentView()
}
