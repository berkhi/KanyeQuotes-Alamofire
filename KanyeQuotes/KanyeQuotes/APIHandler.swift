//
//  APIHandler.swift
//  KanyeQuotes
//
//  Created by BerkH on 19.04.2023.
//

import Foundation
import Alamofire

class APIHandler {
    static let sharedInstance = APIHandler()
    let url = "https://api.kanye.rest"
    
    func getData(complation: @escaping (Result<KanyeQuote, Error>) -> Void) {
        AF.request(url).responseDecodable(of: KanyeQuote.self) { response in
            switch response.result {
            case .success(let data):
                // Handle successful response
                print(data)
            case .failure(let error):
                // Handle error
                print(error)
            }
        }
    }
}
