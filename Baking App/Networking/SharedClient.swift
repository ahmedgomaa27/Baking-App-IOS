//
//  SharedClient.swift
//  Baking App
//
//  Created by Ahmed Hamdy Gomaa on 3/15/18.
//  Copyright © 2018 Ahmed Hamdy Gomaa. All rights reserved.
//

import Foundation


class SharedClient {
    
    static func fetchRecipesData(complition: @escaping ([Recipe])->()) {
        
        let url = URL.init(string: "https://d17h27t6h515a5.cloudfront.net/topher/2017/May/59121517_baking/baking.json")!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            do{
                
//            let json = try JSONSerialization.jsonObject(with: data!, options:JSONSerialization.ReadingOptions())
//                print(json)
            let decoder = JSONDecoder()
            let mappedArray = try decoder.decode([Recipe].self, from: data!)
            print(mappedArray)
            complition(mappedArray)
            return
            }catch let mError{
                
                print(mError)
            }
            
        }.resume()
        
    }
}
