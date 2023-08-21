//
//  NewsResponseModel.swift
//  KumparanNews-Evel
//
//  Created by DDL10 on 17/08/23.
//

import Foundation


struct NewsResponseModel: Codable {
    let data: [NewsData]
}

struct NewsData: Codable {
    let creator: String
    let title: String
    let link: String
    let author: String
    let categories: [String]
    let isoDate: String
    let description: String
    let image: NewsImage
}
