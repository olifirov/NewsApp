//
//  NewsAPIManager.swift
//  NewsApp
//
//  Created by Дмитрий Олифиров on 08.06.2023.
//

import Foundation

protocol APIManager {
    func getArticles(query: String) async -> [Article]
}

class NewsAPIManager: APIManager {
    let APIKey = "41598ec44208416d8d4f6f73ed9c8574"

    func getArticles(query: String) async -> [Article] {
        
        var urlString = "https://newsapi.org/v2/top-headlines?country=us&apiKey=\(APIKey)"
        if query != "" {
            urlString = "https://newsapi.org/v2/everything?q=\(query)&apiKey=\(APIKey)"
        }
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return []
        }

        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            if let news = try? JSONDecoder().decode(NewsResponse.self, from: data) {
                return news.articles
            }
        } catch {
            print(error.localizedDescription)
        }
        return []
    }
}


