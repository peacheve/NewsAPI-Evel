//
//  NewsCategory.swift
//  KumparanNews-Evel
//
//  Created by DDL10 on 20/08/23.
//

//import SwiftUI
//
//struct NewsCategory: View {
//    @State var top = (UIApplication.shared.safeAreaInsets.top ?? "")
    
//    var body: some View {
//
//
//
//
//    }
//
//}
//
//struct NewsCategory_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsCategory(categories: <#[String]#>, selectedCategory: <#Binding<String?>#>)
//    }
//}

import SwiftUI

struct NewsCategory: View {
    var categories: [String]
    @Binding var selectedCategory: String?

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                Text("All")
                    .padding(.horizontal, 12)
                    .padding(.vertical, 5)
                    .background(selectedCategory == nil ? Color.black : Color("ACPurple"))
                    .foregroundColor(.white)
//                    .cornerRadius(15)
                    .onTapGesture {
                        selectedCategory = nil
                    }

                ForEach(categories, id: \.self) { category in
                    Text(category)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 5)
                        .background(selectedCategory == category ? Color.black : Color("ACPurple"))
                        .foregroundColor(.white)
              
//                        .cornerRadius(15)
                        .onTapGesture {
                            selectedCategory = category
                        }
                }
            }
         //   .padding(.horizontal)
        }
      //  Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct NewsCategory_Previews: PreviewProvider {
    static var previews: some View {
        NewsCategory(categories: ["News", "Entertainment", "Bisnis", "Bola & Sport"], selectedCategory: .constant(nil))
    }
}
