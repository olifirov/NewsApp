//
//  NewsScreenViewModel.swift
//  NewsApp
//
//  Created by Дмитрий Олифиров on 08.06.2023.
//

import Foundation
import Combine

class NewsScreenViewModel: ObservableObject {
    
    let manager: APIManager
    @Published var articles: [Article] = []
    @Published var searchText: String = ""
    var cancellables = Set<AnyCancellable>()
    
    init(manager: APIManager) {
        self.manager = manager
        addSearchSubscriber()
    }
    
    func loadArticles(searchText: String) async {
        let articles = await manager.getArticles(query: searchText)
        
        await MainActor.run {
            self.articles = articles
        }
    }
    
    private func addSearchSubscriber() {
        $searchText
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .sink { [weak self] searchText in
                guard let self = self else { return }
                Task {
                    await self.loadArticles(searchText: searchText)
                }
            }
            .store(in: &cancellables)
    }
}
