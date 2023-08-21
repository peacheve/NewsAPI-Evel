//
//  NewsModel.swift
//  KumparanNews-Evel
//
//  Created by DDL10 on 17/08/23.
//

import Foundation

struct NewsModel: Identifiable {
    let id = UUID()
    let creator: String
    let title: String
    let link: String
    let author: String
    let categories: [String]
    let isoDate: String
    let description: String
    let image: NewsImage
}
    
struct NewsImage: Codable {
    let small: String
    let medium: String
    let large: String
    let extraLarge: String
}
