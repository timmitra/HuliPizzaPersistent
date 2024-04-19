//
//  MenuTabView.swift
//  minipizzaApp
//
//  Created by Steven Lipton on 10/13/23.
//

import SwiftUI

struct MenuTabView: View {
    @State var tabTag = 0
    @State var selectedMenuItem:MenuItem = MenuItem()
    @State var isItemDetailsPresented:Bool = false
    var body: some View {
        // The Tab view which conatins the other views we are working on.
        TabView(selection: $tabTag) {
            TicketView(tabTag: $tabTag)
                .tag(0)
                .tabItem {
                    Label("Order",systemImage: "cart.fill")
                }
            RatingsListView(tabTag:$tabTag)
                .tag(2)
                .tabItem {
                    Label("Ratings",systemImage: "star.fill")
                }
            NamesListView(tabTag:$tabTag)
                .tag(3)
                .tabItem {
                    Label("Names",systemImage: "person.crop.circle.fill")
                }
            
        }.animation(.easeIn, value: tabTag)
    }
}

#Preview {
    MenuTabView()
}
