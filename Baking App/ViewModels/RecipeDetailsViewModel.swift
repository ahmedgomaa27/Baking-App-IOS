//
//  RecipeDetailsViewModel.swift
//  Baking App
//
//  Created by Ahmed Hamdy Gomaa on 3/18/18.
//  Copyright © 2018 Ahmed Hamdy Gomaa. All rights reserved.
//

import Foundation
import UIKit

class RecipeDetailsViewModel {
    static var recipeSelected : Recipe?
    
    static func recipeSelected(recipe:Recipe){
        recipeSelected = recipe
    }
    
  static  func getNumberOfSteps() -> Int {
    return (recipeSelected?.steps.count)!
    }
    
    static func configureTableCell(tableView:UITableView,indexPath:IndexPath)-> UITableViewCell{
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell")
        cell?.textLabel?.text = String.init(format: "%@%d: %@", "Step ",indexPath.row + 1,(recipeSelected?.steps[indexPath.row].shortDescription)!)
        
        return cell!
    }
    
    
    static func moveToStepsView(navigationController: UINavigationController,selectedStep: Int)  {
        
        

        let step =  recipeSelected?.steps[selectedStep]
    
        
        let stepDetailsView = navigationController.storyboard?.instantiateViewController(withIdentifier: "stepDetails") as! StepDetailsViewController
        
        stepDetailsView.position = selectedStep
        stepDetailsView.allSteps = recipeSelected?.steps
        stepDetailsView.descString = step?.description
       
        if (step?.videoURL.isEmpty)! {
            stepDetailsView.videoUrl = " "
        }
        else{
        stepDetailsView.videoUrl = step?.videoURL
        }
        navigationController.pushViewController(stepDetailsView, animated: true)
    }
    
   static func getIngrediantContent() -> String {
    var temp :String = ""
    
    for item in (recipeSelected?.ingredients)! {
        temp = temp + String.init(format: "-> %0.1f %@ Of %@\n\n", item.quantity,item.measure,item.ingredient)
    }
    
    return temp
    
    }
    
}
