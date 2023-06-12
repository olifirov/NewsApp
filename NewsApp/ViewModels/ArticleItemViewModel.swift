//
//  ArticleItemViewModel.swift
//  NewsApp
//
//  Created by Дмитрий Олифиров on 08.06.2023.
//

import Foundation

class ArticleItemViewModel: ObservableObject {
    
    let article: Article
    
    init(article: Article) {
        self.article = article
    }
}
