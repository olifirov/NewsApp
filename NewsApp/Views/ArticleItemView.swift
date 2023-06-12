//
//  NewsItemView.swift
//  NewsApp
//
//  Created by Дмитрий Олифиров on 08.06.2023.
//

import SwiftUI
import Kingfisher

struct ArticleItemView: View {
    
    @StateObject var vm: ArticleItemViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                
                if let url = URL(string: vm.article.urlToImage ?? "") {
                    KFImage(url)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .cornerRadius(10)
                }
                    
                Text(vm.article.title ?? "")
                    .bold()
                    .font(.title2)
                    .lineLimit(3)
            }
            .frame(height: 110)
            
            Text(vm.article.content ?? "")
                .lineLimit(2)
        }
        .multilineTextAlignment(.leading)
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 4)
        .padding(.horizontal)
        .onTapGesture {
            openURL()
        }
    }
    
    private func openURL() {
        if let url = URL(string: vm.article.url ?? "") {
            UIApplication.shared.open(url)
        }
    }
}
