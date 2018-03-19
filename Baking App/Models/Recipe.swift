//
//  File.swift
//  Baking App
//
//  Created by Ahmed Hamdy Gomaa on 3/15/18.
//  Copyright © 2018 Ahmed Hamdy Gomaa. All rights reserved.
//

import Foundation

struct Recipe : Codable {
    var name:String
    var ingredients: [Ingrediants]
    var steps :[Steps]
    
}

struct Ingrediants:Codable {
    var quantity:Float
    var measure:String
    var ingredient:String
}

struct Steps: Codable {

    var shortDescription:String
    var description:String
    var videoURL:String
    
    
}
