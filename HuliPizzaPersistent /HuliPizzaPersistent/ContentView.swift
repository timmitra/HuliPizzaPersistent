//
//  ContentView.swift
//  HuliPizzaPersistent
//
//  Created by Steven Lipton on 10/27/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{
            HeaderView()
            MenuTabView()
        }.padding()
           
    }
}


#Preview {
    ContentView()
}
