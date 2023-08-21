//
//  NewsRowView.swift
//  KumparanNews-Evel
//
//  Created by DDL10 on 17/08/23.
//

import SwiftUI

struct NewsRowView: View {
    
    let news: NewsModel
    
    var body: some View {
//    ZStack {
//        Color.black.edgesIgnoringSafeArea(.all)
        HStack(spacing: 14) {
                AsyncImage(url: URL(string: news.image.medium)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 80, height: 62)
                        .clipShape(RoundedRectangle(cornerRadius: 4))
                } placeholder: {
                    ProgressView()
                        .frame(width: 80, height: 80)
                    
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    HStack (alignment: .top, spacing: 2){
                        Text(news.creator)
                            .font(.system(size: 12, design: .rounded))
                            .fontWeight(.medium)
                            .foregroundColor(Color("TextSecondary"))
                        
                        Text("•")
                            .font(.system(size: 12, design: .rounded))
                            .fontWeight(.medium)
                            .foregroundColor(Color("TextSecondary"))
                        
                        Text(" \(news.categories.joined(separator: ","))")
                            .font(.system(size: 12, design: .rounded))
                            .foregroundColor(Color("TextSecondary"))
                        
                    }
                    
                    Text(news.title)
                        .font(.system(size: 16, design: .rounded))
                        .fontWeight(.semibold)
                      // .alignment(.leading)
                        .lineLimit(3)
                        .truncationMode(.tail)
                        .foregroundColor(.white)
                    
                    HStack (alignment: .top) {
                        Text(news.isoDate.formattedDate())
                        
                        Spacer()
                        
                        Image(systemName: "bookmark")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 14, height: 14)
                        
                        Image(systemName: "ellipsis")
                            .resizable()
                        //.frame(width: 12, height: 4)
                            .rotationEffect(.degrees(90))
                            .aspectRatio(contentMode: .fit
                            )
                            .frame(width: 14, height: 14)
                        
                    }
                    .font(.footnote)
                    .foregroundStyle(.gray)
                }
                //                }
                
            }
            
            //padding jarak content
            
//        }
    }
    
    struct NewsRowView_Previews: PreviewProvider {
        static var previews: some View {
            NewsRowView(news: NewsModel(
                creator: "creator",
                title: "Title of the News",
                link: "https://kumparan.com/kumparannews/bareskrim-akan-sita-rekening-panji-gumilang-senilai-ratusan-miliar-terkait-tppu-210BEYvucGH",
                author: "Author",
                categories: ["News"],
                isoDate: "2023-08-16T08:54:31.000Z",
                description: "This is exmaple of description",
                image: NewsImage(
                    small: "",
                    medium: "https://blue.kumparan.com/image/upload/fl_progressive,fl_lossy,c_fill,q_auto:best,w_480,f_jpg/v1634025439/01h6qwnxf9hd2p03gjweemew7n.jpg",
                    large: "",
                    extraLarge: "")))
             .preferredColorScheme(.dark)
        }
    }
}

