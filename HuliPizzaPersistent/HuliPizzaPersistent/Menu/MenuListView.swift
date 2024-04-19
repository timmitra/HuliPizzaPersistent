//
//  MenuListView.swift
//  minipizzaApp
//
//  Created by Steven Lipton on 10/13/23.
//

import SwiftUI

struct MenuListView: View {
    @Binding var tabTag:Int
    @Binding var selectedItem:MenuItem
    var menu:[MenuItem] = MenuModel().menu
    
    var body: some View {
        
        VStack {
            Text("Menu")
                .font(.title).fontWeight(.heavy)
            List{
                ForEach(MenuCategory.allCases,id:\.self){category in
                    Section(category.rawValue){
                        ForEach(menu.filter{$0.category == category}){ item in
                            MenuItemRowView(menuItem: item)
                                .onTapGesture {
                                    selectedItem.key = item.key
                                    selectedItem.name = item.name
                                    selectedItem.basicPrice = item.basicPrice
                                    selectedItem.category = item.category
                                    selectedItem.rating = item.rating
                                }
                        }
                        
                    }
                }
                
                
            }
            .navigationTitle(selectedItem.name)
        }
    }
}

#Preview {
    MenuListView(tabTag: .constant(1), selectedItem:.constant(MenuItem()))
}
