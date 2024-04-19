//
//  RatingView.swift
//  SwiftDataHuliPizza
//
//  Created by Steven Lipton on 8/24/23.
//

import Foundation
import SwiftUI

struct RatingView: View {
    var rating:Int
    var systemName:String
    var body: some View {
        HStack{
            ForEach(1...6,id:\.self){ ratingStar in
                Image(systemName: rating >= ratingStar ? systemName + ".fill": systemName)
            }
        }
    }
}

#Preview {
    RatingView(rating: 5, systemName:"star")
}
