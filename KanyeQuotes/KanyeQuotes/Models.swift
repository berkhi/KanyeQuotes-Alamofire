//
//  Models.swift
//  KanyeQuotes
//
//  Created by BerkH on 21.04.2023.
//

import Foundation

struct KanyeQuote: Decodable {
    let quote: String
    
    enum CodingKeys: String, CodingKey {
        case quote = "quote"
    }
}


