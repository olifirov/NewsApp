//
//  NewsScreenView.swift
//  NewsApp
//
//  Created by Дмитрий Олифиров on 08.06.2023.
//

import SwiftUI

struct NewsScreenView: View {
    
    @StateObject var vm: NewsScreenViewModel
    @State var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    LazyVStack(alignment: .leading) {
                        ForEach(vm.articles, id: \.self) { article in
                            ArticleItemView(vm: ArticleItemViewModel(article: article))
                        }
                    }
                }
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .navigationTitle("News")
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .searchable(text: $vm.searchText)
        .task {
            await vm.loadArticles(searchText: vm.searchText)
        }
    }
}


struct NewsScreenView_Previews: PreviewProvider {
    static var previews: some View {
        NewsScreenView(vm: NewsScreenViewModel(manager: NewsAPIManager()))
    }
}
