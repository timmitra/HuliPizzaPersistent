//
//  RatingsRowView.swift
//  minipizzaApp
//
//  Created by Steven Lipton on 10/14/23.
//

import SwiftUI

struct RatingRowView: View {
    var pizzaName:String
    var rating:Int
    var systemName:String
    var body: some View {
        HStack{
            Text(pizzaName)
            Spacer()
            RatingView(rating: rating, systemName: systemName)
        }
    }
}

#Preview {
    RatingRowView(pizzaName: "Huli Pizza", rating: 6, systemName: "star")
}
