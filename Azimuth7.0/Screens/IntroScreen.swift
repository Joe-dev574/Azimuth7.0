//
//  IntroScreen.swift
//  Azimuth7.0
//
//  Created by Joseph DeWeese on 9/9/24.
//

import SwiftUI

struct IntroScreen: View {
    /// Visibility Status
    @AppStorage("isFirstTime") private var isFirstTime: Bool = true
    var body: some View {
        VStack(spacing: 15) {
            Text("What's New in \nAzimuth2.0")
                .font(.largeTitle.bold())
                .multilineTextAlignment(.center)
                .padding(.top, 65)
                .padding(.bottom, 35)
            
            /// Points View
            VStack(alignment: .leading, spacing: 25, content: {
                PointView(symbol: "sparkles", title: "Objectives", subTitle: "Track, objectives, tasks and goals, easily and intuitively using Azimuth's clean and direct approach to self management.")
                
                PointView(symbol: "chart.bar.fill", title: "Visual Charts", subTitle: "Visually manage your progress, using eye-catching graphic representations.")
                
                PointView(symbol: "magnifyingglass", title: "Advance Filters", subTitle: "Find the objectives, tasks, or the documented brain matter you want by advance search and filtering.")
            })
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 15)
            
            Spacer(minLength: 10)
            
            Button(action: {
                isFirstTime = false
            }, label: {
                Text("Continue")
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .background(appTint.gradient, in: .rect(cornerRadius: 12))
                    .contentShape(.rect)
            })
        }
        .padding(15)
    }
    
    /// Point View
    @ViewBuilder
    func PointView(symbol: String, title: String, subTitle: String) -> some View {
        HStack(spacing: 20) {
            Image(systemName: symbol)
                .font(.largeTitle)
                .foregroundStyle(appTint.gradient)
                .frame(width: 45)
            
            VStack(alignment: .leading, spacing: 6, content: {
                Text(title)
                    .font(.title3)
                    .fontWeight(.semibold)
                
                Text(subTitle)
                    .font(.callout)
                    .foregroundStyle(.gray)
            })
        }
    }
}

#Preview {
    IntroScreen()
}
