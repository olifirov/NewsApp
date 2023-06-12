//
//  Response.swift
//  NewsApp
//
//  Created by Дмитрий Олифиров on 08.06.2023.
//

import Foundation

struct NewsResponse: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}
