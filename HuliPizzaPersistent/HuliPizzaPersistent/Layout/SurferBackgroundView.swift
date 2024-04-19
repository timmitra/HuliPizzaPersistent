//
//  SurferBackgroundView.swift
//  minipizzaApp
//
//  Created by Steven Lipton on 10/15/23.
//

import SwiftUI

struct SurferBackgroundView: View {
    var body: some View {
        ZStack{
            Image("Surfer1")
                .resizable()
            Rectangle()
                .foregroundStyle(.ultraThinMaterial)
        }
    }
}

#Preview {
    SurferBackgroundView()
}
