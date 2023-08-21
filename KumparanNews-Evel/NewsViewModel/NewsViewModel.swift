//
//  NewsViewModel.swift
//  KumparanNews-Evel
//
//  Created by DDL10 on 17/08/23.
//

import Foundation

class NewsViewModel: ObservableObject {
    @Published var news: [NewsModel] = []
    @Published var isLoading = false
    @Published var searchText: String = ""
    @Published var selectedCategory: String? = nil
    
    //fetch news category
    
    var uniqueCategories: [String] {
        Set(news.flatMap{$0.categories}).sorted()
    }
    
    //search function
    var filteredNews: [NewsModel] {
        if let selectedCategory = selectedCategory, !selectedCategory.isEmpty
        {
            return news.filter{news in
                news.categories.contains(selectedCategory)}
        } else if !searchText.isEmpty {
            return news.filter { news in
                news.title.localizedCaseInsensitiveContains(searchText)
            }
        } else {
            return news
        }
    }
    
    
    func fetchNews() async {
        DispatchQueue.main.async {
            self.isLoading = true
        }
        
        Task {
            do {
                let url = URL(string: "https://berita-indo-api-next.vercel.app/api/kumparan-news/")!
                let (data, _) = try await URLSession.shared.data(from: url)
                let response = try JSONDecoder().decode(NewsResponseModel.self, from: data)
                
                DispatchQueue.main.async {
                    self.news = response.data.map { newsData in
                        NewsModel(
                            creator: newsData.creator,
                            title: newsData.title,
                            link: newsData.link,
                            author: newsData.author,
                            categories: newsData.categories,
                            isoDate: newsData.isoDate,
                            description: newsData.description,
                            image: newsData.image)
                    }
                    self.isLoading = false
                }
            } catch {
                print("Error fetching data: \(error)")
            }
        }
    }
}
