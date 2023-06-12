//
//  Article.swift
//  NewsApp
//
//  Created by Дмитрий Олифиров on 08.06.2023.
//

import Foundation

struct Article: Decodable, Hashable {
    let source: Source?
    let author: String?
    let title: String
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(url)
    }
    
    static func == (lhs: Article, rhs: Article) -> Bool {
        return lhs.url == rhs.url
    }
}


