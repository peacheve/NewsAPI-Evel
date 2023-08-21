//
//  NewsCardView.swift
//  KumparanNews-Evel
//
//  Created by DDL10 on 20/08/23.
//

import SwiftUI

struct NewsCardView: View {
    
    let news: NewsModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            AsyncImage(url: URL(string: news.image.medium)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                //.scaledToFit()
                    .frame(width: 166, height: 104)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            } placeholder: {
                ProgressView()
                    .frame(width:100, height: 100)
            }
            .padding()
            
            //  Spacer(minLength: 2)
          //  VStack {
                HStack() {
                    Text(news.creator)
                        .padding(.leading)
                        .font(.footnote)//(.system(size: 12, design: .rounded))
                        .foregroundColor(Color("TextSecondary"))


                    Text("•")
                        .font(.footnote)//(.system(size: 12, design: .rounded))
                        .foregroundColor(Color("TextSecondary"))

                    Text(" \(news.categories.joined(separator: ","))")
                        .font(.footnote)//(.system(size: 12, design: .rounded))
                        .foregroundColor(Color("TextSecondary"))
                }
                
                //   VStack(alignment: .leading) {
                Text(news.title)
                    .font(.system(size: 16, design: .rounded))
                    .fontWeight(.heavy)
                    .truncationMode(.tail)
                    .foregroundColor(Color.white)
                    .lineLimit(0)
                    .lineSpacing(0)
                   // .padding(.leading)
                
                //.minimumScaleFactor(0.5)
                
                // .frame(maxWidth: .infinity)
                
                HStack() {
                    Text(news.isoDate.formattedDate())
                        .font(.footnote)
                        .foregroundColor(Color("TextSecondary"))
                        .padding(.leading)
                    
                    //                        .font(.system(size: 14, design: .rounded))
                    
                    Spacer(minLength: 20)
            
                    
                    Image(systemName: "bookmark")
                        .resizable()
                        .foregroundColor(.white)
                    //.padding(.leading)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 16, height: 16)
                    
                }
            }
            .padding(.all)
            .frame(width: 182, height: 230)
            .background(Color("Card"))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            
            
        }
        
        //        .overlay(
        //            RoundedRectangle(cornerRadius: 20)
        //                .stroke(Color(.sRGB, red: 0/255, green: 0/255, blue: 0/255, opacity: 0.1), lineWidth: 1))
        
//    }
}
struct NewsCardView_Previews: PreviewProvider {
    static var previews: some View {
        NewsCardView(news: NewsModel(
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

