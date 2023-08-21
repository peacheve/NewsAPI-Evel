//
//  NewsDetailView.swift
//  KumparanNews-Evel
//
//  Created by DDL10 on 17/08/23.
//

import SwiftUI

struct NewsDetailView: View {
    let news: NewsModel
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            NavigationStack {
                ScrollView {
                    VStack(alignment: .leading, spacing: 20)
                    {
                        AsyncImage(url: URL(string: news.image.large)) {
                            phase in
                            phase.resizable()
                                .scaledToFill()
                                .overlay{
                                    Color.black
                                        .opacity(0.5)
                                }
                        } placeholder: {
                            ProgressView()
                                .frame(width: 80, height: 80)
                        }
                        .frame(maxWidth: .infinity, maxHeight: 220)
                        .clipped()
                        
                        VStack(alignment: .leading, spacing: 16) {
                            HStack(spacing: 8) {
                                Image(systemName: "doc.text.image")
                                    .resizable()
                                    .frame(width: 12, height: 12)
                                    .foregroundColor(Color("ACPurple"))
                                //Categories
                                Text(" \(news.categories.joined(separator: ","))")
                                    .font(.system(size: 14, design: .rounded))
                                    .foregroundColor(Color("ACPurple"))
                            }
                            
                            Text(news.title)
                                .font(.system(.title, design: .rounded))
                                .foregroundColor(Color.white
                                )
                                .fontWeight(.bold)
                                .lineLimit(5)
                            HStack(spacing: 4) {
                                Text(news.creator)
                                    .font(.system(.caption, design: .rounded))
                                    .foregroundColor(Color("TextSecondary"))
                                Text("-")
                                    .foregroundColor(Color("TextSecondary"))
                                Text(news.author)
                                    .font(.system(.caption, design: .rounded))
                                    .foregroundColor(Color("TextSecondary"))
                            }
                            Text("Published at: \(news.isoDate.formattedDate())")                     .font(.system(.caption, design: .rounded))
                                .foregroundColor(Color("TextTertiary"))
                            
                            //socmed
                            
                            
                            Text(news.description)
                                .font(.system(.body, design: .rounded))
                                .foregroundColor(Color.white)
                                .lineLimit(nil)
                        }
                        .padding()
                    }
                }
            }
            
        }
        
        // .ignoresSafeArea()
        //    }
    }
    
    struct NewsDetailView_Previews: PreviewProvider {
        static var previews: some View {
            NewsDetailView(news: NewsModel(
                creator: "Creator",
                title: "Title of the news",
                link: "https://kumparan.com/kumparannews/bareskrim-akan-sita-rekening-panji-gumilang-senilai-ratusan-miliar-terkait-tppu-210BEYvucGH",
                author: "Author",
                categories: ["News"],
                isoDate: "2023-08-16T08:54:31.000Z",
                description: "This is example of the description",
                image: NewsImage (small: "",
                                  medium: "https://blue.kumparan.com/image/upload/fl_progressive,fl_lossy,c_fill,q_auto:best,w_480,f_jpg/v1634025439/01h6qwnxf9hd2p03gjweemew7n.jpg",
                                  large: "https://blue.kumparan.com/image/upload/fl_progressive,fl_lossy,c_fill,q_auto:best,w_720,f_jpg/v1634025439/01h6qwnxf9hd2p03gjweemew7n.jpg",
                                  extraLarge: "" )))
                    .preferredColorScheme(.dark)
        }
    }
}
