//
//  HeaderView.swift
//  minipizzaApp
//
//  Created by Steven Lipton on 10/13/23.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack{
            SurferBackgroundView()
            VStack{
                HStack{
                    Text("Huli Pizza Company")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                    Spacer()
                       
                }
                HStack{
                    Text("Pizza Island Style")
                        .font(.headline)
                    Spacer()
                }
            }
            .padding()
        }
        .frame(maxHeight: 100)
    }
}

#Preview {
    HeaderView()
}
