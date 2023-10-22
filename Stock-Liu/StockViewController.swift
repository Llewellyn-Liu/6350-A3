//
//  StockViewController.swift
//  Stock-Liu
//
//  Created by Runlin Liu on 10/21/23.
//

import UIKit
import Alamofire
import SwiftyJSON

class StockViewController: UIViewController {

    @IBOutlet weak var textSymbol: UITextField!
    
    
    @IBAction func getJson(_ sender: Any) {
        guard let stockSymbol = textSymbol.text else {return}
        
        let url = "\(baseUrl)profile/\(stockSymbol)?apikey=\(apiKey)"
        print(url)
        
        AF.request(url).responseJSON { response in
            if(response.error != nil){
                print(response.error?.localizedDescription)
                return
            }
            // We have valid data here
            guard let rawData = response.data else {return}
            guard let jsonArray = JSON(rawData).array else {return}
            guard let stock = jsonArray.first else {return}
            
            let symbol = stock["symbol"].stringValue
            let price = stock["price"].floatValue
            let companyName = stock["companyName"].stringValue
            let description = stock["description"].stringValue
            
            print(symbol)
            print(price)
            print(companyName)
            print(description)
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
