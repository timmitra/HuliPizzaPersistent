//
//  RatingsListView.swift
//  minipizzaApp
//
//  Created by Steven Lipton on 10/13/23.
//

import SwiftUI
import SwiftData


struct RatingsListView: View {
  
  @Environment(\.modelContext) private var modelContext
  @State var ratings:[RatingModel] = []
//  @Query(filter: greatRatingsPredicate, sort:[sortPizzas, sortStars]) var ratings:[RatingModel]
    @Binding var tabTag:Int
    @State private var isPresentingNewSheet:Bool = false
    @State var stars:Int = 0
    @State var pizzaName:String = ""
    @State private var selectedPizzaName:String = ""
    var menu = MenuModel().menu
    
    @State private var isPizzaSort = true
    @State private var isGreatRatings = false
    @State private var isAcendingSort = true
    
    

    func saveRating(){
        let newName = selectedPizzaName
        let newStars = stars
        let newRating = RatingModel(pizzaName: newName, rating: newStars)
        //ratings.append( newRating)
      modelContext.insert(newRating)
       
    }
    
    func fetchRatings(){
      let greatRatingsPredicate = #Predicate<RatingModel>{ rating in rating.rating >= 5 }
      let allRatingsPredicate = #Predicate<RatingModel>{ _ in true }
      let sortStars = SortDescriptor(\RatingModel.rating, order: .reverse)
      let sortPizzas = SortDescriptor(\RatingModel.pizzaName)
      let fetchDescriptor = FetchDescriptor(predicate: allRatingsPredicate, sortBy: [sortPizzas, sortStars])
      // the long way to do try with do:catch
      do {
        try ratings = modelContext.fetch(fetchDescriptor)
      } catch {
        print(error.localizedDescription)
      }
    }
    
    
    var pizzaImage:UIImage{
        let key:Int! = menu.first{$0.name == selectedPizzaName}?.key
        if key != nil {
            return UIImage(named: "\(key!)_sm") ?? UIImage(named:"Surfer1_sm")!
        }
        return UIImage(named:"Surfer1_sm")!
    }
    
    
    
    var body: some View {
        VStack{
            HStack{
                Button{
                    isPizzaSort.toggle()
                }
                label:{
                    Image(systemName: isPizzaSort ? "abc" : "list.star")
                }
                Button{
                    isAcendingSort.toggle()
                }
                label:{
                    Image(systemName: isAcendingSort ? "arrow.up.doc" : "arrow.down.doc")
                    }
                Spacer()
                Button{
                    isGreatRatings.toggle()
                } label:{
                    Image(systemName: isGreatRatings ? "heart.circle.fill" : "heart")
                }
            }
            .font(.title)
            Text("Ratings").font(.title).fontWeight(.heavy)
            if ratings.isEmpty{
                ZStack{
                    SurferBackgroundView()
                    Text("No Ratings Yet")
                        .font(.title).fontWeight(.heavy)
                }
            }
            List{
                ForEach(ratings){rating in
                    RatingRowView(pizzaName: rating.pizzaName, rating: rating.rating, systemName: RatingsIcon.star.rawValue)
                }
//Deletion goes here! ------>
                .onDelete { indexSet in
                  for index in indexSet {
                    modelContext.delete(ratings[index])
                  }
                }
            }
            HStack{
                List(menu.map{$0.name},id:\.self){ name in
                    Text(name).font(.headline)
                        .onTapGesture {
                            selectedPizzaName = name
                        }
                }
                VStack(alignment:.leading){
                    Text("Rate your \(selectedPizzaName) Pizza")
                        .font(.title2).bold()
                        .padding()
                    HStack {
                        Spacer()
                        Picker("Symbol",selection: .constant(RatingsIcon.star)){
                            ForEach(RatingsIcon.allCases, id:\.self){ icon in
                                Image(systemName:icon.rawValue + ".fill").tag(icon)
                            }
                        }
                    }
                    Image(uiImage: pizzaImage)
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .shadow(radius: 10,x:3,y:2)
                        .padding()
                    HStack{
                        Image(systemName: "x.circle")
                            .font(.largeTitle)
                            .padding([.leading,.trailing],4)
                            .background(.regularMaterial)
                            .onTapGesture {
                                stars = 0
                            }
                        ForEach(1...6,id:\.self){ ratingStar in
                            Image(systemName: stars >= ratingStar ? (RatingsIcon.star.rawValue + ".fill") : RatingsIcon.star.rawValue)
                                .font(.title)
                                .padding([.leading,.trailing],4)
                                .background(.regularMaterial)
                                .onTapGesture {
                                    stars = ratingStar
                                }
                        }
                        Spacer()
                        
                    }
                    .padding()
                    Button("Add Rating"){
                        saveRating()
                        stars = 0
                        selectedPizzaName = ""
                      fetchRatings()
                    }
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .padding([.top,.bottom])
                    .frame(maxWidth:.greatestFiniteMagnitude)
                    .background(.surf, in: RoundedRectangle(cornerRadius: 15))
                    .padding([.leading,.trailing])
                    
                    Spacer()
                }
                .onAppear{
                    stars = 0
                }
                .background(.ultraThickMaterial)
            }
        }
        .onAppear{
            fetchRatings()
        }
    }

}

#Preview {
    RatingsListView(tabTag: .constant(2))
}

