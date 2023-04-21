//
//  ViewController.swift
//  KanyeQuotes
//
//  Created by BerkH on 18.04.2023.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    var quotes = [String]()
    var currentIndex = 0
    var alphaCounter = 1
    
    @IBOutlet var lblQuote: UILabel!
    @IBOutlet var imgKanye: UIImageView!
    @IBOutlet var btnBack: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        imgKanye.image = UIImage(named: "kanye")
        // Do any additional setup after loading the view.
        fetchData()
        
    }
    
    @IBAction func btnForward(_ sender: UIButton) {
        if currentIndex == quotes.count - 1 {
            fetchData()
            currentIndex += 1
            alphaCounter += 1
            //print(quotes.count)
        }else{
            currentIndex += 1
            alphaCounter += 1
            lblQuote.text = quotes[currentIndex]
            //print(currentIndex)
        }
        btnBack.alpha = 1
    }
    
    @IBAction func btnBack(_ sender: UIButton) {
        
        if currentIndex > 0 {
            currentIndex -= 1
            alphaCounter -= 1
            lblQuote.text = quotes[currentIndex]
            //print(currentIndex)
            
            if alphaCounter == 1{
                sender.alpha = 0.5
            }
        }
    }
    
    private func fetchData() {
        APIHandler.sharedInstance.getData { (result: Result<KanyeQuote, Error>) in
            switch result {
            case .success(let data):
                print(data.quote)
                self.quotes.append(data.quote)
                self.lblQuote.text = self.quotes.last
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
