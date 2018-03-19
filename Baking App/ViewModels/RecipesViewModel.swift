//
//  RecipeViewModel.swift
//  Baking App
//
//  Created by Ahmed Hamdy Gomaa on 3/15/18.
//  Copyright © 2018 Ahmed Hamdy Gomaa. All rights reserved.
//

import Foundation
import UIKit

class RecipesViewModel {
    static var recipes = [Recipe]()
    
    static var imagesList = [#imageLiteral(resourceName: "nutellapie"),#imageLiteral(resourceName: "brownies"),#imageLiteral(resourceName: "yellowcake"),#imageLiteral(resourceName: "cheesecake")]
    
    static func getRecipesData(complition:@escaping ()->()){
        SharedClient.fetchRecipesData { (mResponse) in
            recipes = mResponse
            //print(recipes)
            complition()
            return
        }
    }
    
    static  func configureCell(collectionView:UICollectionView,indexPath:IndexPath) -> RecipeCollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! RecipeCollectionViewCell
        
        if recipes.count != 0 {
            cell.recipeName.text = recipes[indexPath.row].name
            cell.recipeImageView.image = imagesList[indexPath.row]
        }
        return cell
    }
    
    static func getRecipeItems() -> Int {
        return recipes.count
    }
    
    
    static  func moveToRecipeDetails(navigationController:UINavigationController,selectedItem:Int)  {
        
        RecipeDetailsViewModel.recipeSelected(recipe: recipes[selectedItem])
        
        let recipeDetailsView = navigationController.storyboard?.instantiateViewController(withIdentifier: "recipeDetails") as! RecipeDetailsViewController
        
        recipeDetailsView.imageSelected = imagesList[selectedItem]
        
        
        // to set view controller title use next line
        // recipeDetailsView.title = "hello"
        
        // to set title for back button after select item from collectionview
        navigationController.navigationBar.topItem?.title = recipes[selectedItem].name
        
        navigationController.pushViewController(recipeDetailsView, animated: true)
        
        
    }
    
    
    
}
