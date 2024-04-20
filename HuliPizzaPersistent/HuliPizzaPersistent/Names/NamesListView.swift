//
//  NamesListView.swift
//  minipizzaApp
//
//  Created by Steven Lipton on 10/13/23.
//

import SwiftUI
import SwiftData


struct NamesListView: View {
  @Environment(\.modelContext) private var modelContext
    @Binding var tabTag:Int
    @State private var names:[NameModel] = []
  //@Query() private var names:[NameModel]
    @State private var entryName:String = ""
    @State private var partySize:Int = 1
    @State private var isSortingUp = true
  
    func addName(){
        let newEntry = entryName
        let newPartySize = partySize
        let newName = NameModel(name: newEntry,partySize: newPartySize)
        modelContext.insert(newName)
        entryName = ""
      fetchNames()
    }
  func fetchNames(){
    let sortDescriptor = SortDescriptor(
      \NameModel.name,
       order: isSortingUp ? .forward : .reverse
    )
    try? names = modelContext.fetch(FetchDescriptor(sortBy: [sortDescriptor]))
   }
  
    var body: some View {
        
        VStack{
            Text("Customer Names")
                .font(.title).fontWeight(.heavy)
            HStack{
                TextField("Enter a new name", text: $entryName)
                    .onSubmit {
                       addName()
                    }
                    .background(.background)
                Picker("Party Size",selection:$partySize){
                    ForEach(0...20,id:\.self){ size in
                        Text(size,format:.number).tag(size)
                    }
                }
                Button("Add Name"){
                    addName()
                }
            }
            .padding()
            .background(.regularMaterial)
            if names.isEmpty{
                ZStack {
                    SurferBackgroundView()
                    Text("No Names Yet")
                        .font(.title).fontWeight(.heavy)
                }
            }
            Button{
                isSortingUp.toggle()
              fetchNames()
            } label: {
                Image(systemName: isSortingUp ? "arrow.up.doc" : "arrow.down.doc")
            }
            .font(.largeTitle)
            .fontWeight(.heavy)
            .foregroundColor(.white)
            .padding([.top,.bottom])
            .padding([.leading,.trailing], 30)
            .background(.surf, in: RoundedRectangle(cornerRadius: 15))
            .padding([.leading,.trailing,.top])

            List{
                ForEach(names){name in
                    HStack{
                        Text(name.name)
                            .font(.title2)
                        Spacer()
                        Text("Party of \(name.partySize)")
                    }.font(.title2)
                }
                .onDelete { indexSet in
                  for index in indexSet {
                    modelContext.delete(names[index])
                  }
                }
            }
        }
        .onAppear{
          fetchNames()
        }
    }
}

#Preview {
    NamesListView(tabTag: .constant(3))
}
