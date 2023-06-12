//
//  NewsAppApp.swift
//  NewsApp
//
//  Created by Дмитрий Олифиров on 08.06.2023.
//

import SwiftUI

@main
struct NewsAppApp: App {
    var body: some Scene {
        WindowGroup {
            NewsScreenView(vm: NewsScreenViewModel(manager: NewsAPIManager()))
                .preferredColorScheme(.light)
        }
    }
}
