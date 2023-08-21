//
//  NewsListView.swift
//  KumparanNews-Evel
//
//  Created by DDL10 on 17/08/23.
//

import SwiftUI
import UIKit

//struct CustomBackgroundList<>

struct NewsListView: View {
    
    @ObservedObject private var newsVM = NewsViewModel()
    
    var body: some View {
        
            NavigationStack {
                ZStack {
                    Color.black.edgesIgnoringSafeArea(.all)
                    
                    if newsVM.isLoading {
                        ProgressView("Load News...")
                    } else {
                        VStack (alignment: .leading) {
                                
                            HStack(spacing: 12){
                                
                                Text("Kumparan News")
                                    .font(.largeTitle)
                                    .fontWeight(.heavy)
                                    .foregroundColor(Color("ACPurple"))
                                
                                Spacer(minLength: 0)
                                
                                
                                Button(action: {}) {
                                    Image(systemName: "bell")
                                        .resizable()
                                        .frame(width: 24, height: 24)
                                        .foregroundColor(.white)
                                        .padding(10)
                                }
                                Button(action: {}) {
                                    Image(systemName: "person.circle")
                                        .resizable()
                                        .frame(width: 24, height: 24)
                                        .foregroundColor(.white)
                                        .padding(10)
                                }
                            }
                            
                            NewsCategory(categories: newsVM.uniqueCategories, selectedCategory: $newsVM.selectedCategory)
                            
                            .background(Color.black)
                            .padding(.horizontal)
                            
                            List(newsVM.filteredNews) { newsItem in
                                NavigationLink(destination: NewsDetailView(news: newsItem)) {
                                    NewsRowView(news: newsItem)
                            
                            
//
//                            ScrollView {
//                                VStack (alignment: .leading, spacing: 10) {
//                                    ForEach(newsVM.filteredNews, id: \.id){ result in
//                                        NavigationLink {
//                                            NewsDetailView(news: result)
//                                        } label: {
//                                            NewsRowView(news: result)
//                                        }
//
//                                    }
                                }
                            }
                            .listStyle(.plain)
                            
                        }
                    }

                }
                
           //.background(Color.black)
             }
             .task{await newsVM.fetchNews()
        
             }
             .searchable(text: $newsVM.searchText)
             .preferredColorScheme(.dark)
    }
       
}

//                                List(newsVM.filteredNews) { newsItem in NavigationLink(destination: NewsDetailView(news: newsItem)) {
//                                    NewsRowView(news: newsItem)
//                                }
//                                }
//                                .listStyle(.plain)
//                                // .listRowBackground((Color.black))
//   //                             .navigationTitle("Kumparan News")
//                                .foregroundColor(.black)
//                                //.background(Color.black)
//                                .searchable(text: $newsVM.searchText)
//                                .refreshable {
//                                    await newsVM.fetchNews()
//                                }
                                


struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView()
        //.preferredColorScheme(.dark)
    }
}
