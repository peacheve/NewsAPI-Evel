//
//  Jumbotron.swift
//  KumparanNews-Evel
//
//  Created by DDL10 on 21/08/23.
//

import SwiftUI

struct Jumbotron: View {
    let news: NewsModel
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            AsyncImage(url: URL(string: news.image.large)) { image in
                VStack {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(height: 180)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            } placeholder: {
                ProgressView()
                    .frame(width: 80, height: 80)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                
                Text(news.isoDate.formattedDate())
                    .font(.system(size: 10, weight: .bold))
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 100)
                
                Text(news.title)
                    .font(.system(size: 16, design: .rounded))
                    .fontWeight(.semibold)
                    .truncationMode(.tail)
                    .foregroundColor(.white)
                    .lineLimit(3)
                    .lineSpacing(0)
                    .shadow(color: .black, radius: 100)
                    .multilineTextAlignment(.leading)
                
            }
            .padding([.bottom, .leading])
        }
        .listRowSeparator(.hidden)
    }
}

struct Jumbotron_Previews: PreviewProvider {
    static var previews: some View {
        Jumbotron(news: NewsModel(
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
    }
}
