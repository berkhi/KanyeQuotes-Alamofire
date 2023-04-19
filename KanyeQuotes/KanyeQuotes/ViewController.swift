//
//  ViewController.swift
//  KanyeQuotes
//
//  Created by BerkH on 18.04.2023.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    var quote: [KanyeQuote] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        APIHandler.sharedInstance.getData { (result: Result<KanyeQuote, Error>) in
            
            switch result {
            case .success(let data):
                print(data.quote)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

struct KanyeQuote: Decodable {
    let quote: String
    
    enum CodingKeys: String, CodingKey {
        case quote = "quote"
    }
}
