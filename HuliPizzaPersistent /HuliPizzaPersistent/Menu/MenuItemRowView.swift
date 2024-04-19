//
//  MenuItemRowView.swift
//  minipizzaApp
//
//  Created by Steven Lipton on 10/13/23.
//

import SwiftUI

struct MenuItemRowView: View {
    var menuItem:MenuItem
    var body: some View {
        HStack{
            Image(uiImage: menuItem.uiImage)
                .clipShape(RoundedRectangle(cornerRadius: 4))
            Text(menuItem.name)
                .font(.title2)
                .fontWeight(.bold)
            Spacer()
            Text(menuItem.basicPrice,format: .currency(code: "USD"))
        }
    }
}

#Preview {
    MenuItemRowView(menuItem: MenuModel().menu[0])
}
