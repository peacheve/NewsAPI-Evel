//
//  ExploreView.swift
//  KumparanNews-Evel
//
//  Created by DDL10 on 20/08/23.
//


import SwiftUI

//struct CustomBackgroundList<>

struct ExploreView: View {
    
    @StateObject private var newsVM = NewsViewModel()
    
    var body: some View {
        NavigationStack{
            ZStack {
                Color.black.edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading) {
                    HStack(spacing: 12){
                        
                        Text("Explore")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(Color("ACPurple"))
                        
                        Spacer(minLength: 0)
                        
                        Button(action: {}) {
                            Image(systemName: "person.circle")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(.white)
                                .padding(10)
                        }
                    }
                    Spacer(minLength: 0)
                    HStack {
                        Text("Recent News")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                        Spacer()
                        Text("View more")
                            .font(.system(size: 12))
                            .foregroundColor(Color("ACPurple"))
                        
                    }
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack {
                            ForEach(newsVM.filteredNews, id: \.id) { news in
                                NavigationLink(destination: NewsDetailView(news: news)) {
                                    NewsCardView(news: news)
                                    //                                        .frame(width: 200, height: 200)
                                }
                                
                            }
                            
                        }
                        .lineSpacing(12)
                        .refreshable {
                            //       .task{
                            await newsVM.fetchNews()
                            
                        }
                        
                    }
                    
                  //  Spacer(minLength: 40)
                    HStack {
                        Text("Recommended")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                        Spacer()
                        Text("View more")
                            .font(.system(size: 12))
                            .foregroundColor(Color("ACPurple"))
                    }
                    
                    ScrollView(.horizontal) {
                        LazyHStack{
                            ForEach(newsVM.filteredNews) { news in
                                NavigationLink(destination: NewsDetailView(news: news)) {
                                    NewsCardView(news: news)
                                }
                            }
                        }
                        .lineSpacing(24)
                    }
                   // .navigationBarTitle("Explore")
                }
                .padding()
                .lineSpacing(4)
                .searchable(text: $newsVM.searchText)
                .refreshable {
                    await newsVM.fetchNews()
                }
            }
        }
        .task {
            await newsVM.fetchNews()
        }
    }
       
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
        .preferredColorScheme(.dark)
    }
}

