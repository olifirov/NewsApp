//
//  ArticleWebView.swift
//  NewsApp
//
//  Created by Дмитрий Олифиров on 11.06.2023.
//

import SwiftUI
import WebKit

struct ArticleWebView: UIViewRepresentable {
    let urlString: String

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let url = URL(string: urlString) else { return }
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}

//struct ContentView: View {
//    var body: some View {
//        ArticleWebView(url: URL(string: "https://www.example.com")!)
//    }
//}
