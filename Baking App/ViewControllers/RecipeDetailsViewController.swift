//
//  RecipeDetailsViewController.swift
//  Baking App
//
//  Created by Ahmed Hamdy Gomaa on 3/15/18.
//  Copyright © 2018 Ahmed Hamdy Gomaa. All rights reserved.
//

import UIKit

class RecipeDetailsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBAction func showIngrediants(_ sender: UIButton) {
        
        var ingrediantContent : String?
        
        ingrediantContent = RecipeDetailsViewModel.getIngrediantContent()
        
        let alert = UIAlertController(title: "Ingrediants", message: ingrediantContent!, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Copy", style: .default, handler: { (self) in
            UIPasteboard.general.string = ingrediantContent
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))

        
        
        self.present(alert, animated: true)
    }
    
    
    @IBOutlet weak var recipeImageView: UIImageView!
    var imageSelected:UIImage?
    
   
    

    @IBOutlet weak var stepsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        recipeImageView.image = imageSelected
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return RecipeDetailsViewModel.getNumberOfSteps()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return RecipeDetailsViewModel.configureTableCell(tableView:tableView,indexPath:indexPath)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        RecipeDetailsViewModel.moveToStepsView(navigationController: navigationController!, selectedStep: indexPath.row)
    }

}
