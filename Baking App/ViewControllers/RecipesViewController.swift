//
//  ViewController.swift
//  Baking App
//
//  Created by Ahmed Hamdy Gomaa on 3/15/18.
//  Copyright © 2018 Ahmed Hamdy Gomaa. All rights reserved.
//

import UIKit

class RecipesViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,
    
UICollectionViewDelegateFlowLayout{
    
    
    @IBOutlet weak var recipeList: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       // self.navigationController?.isNavigationBarHidden = true
        

        RecipesViewModel.getRecipesData {

            DispatchQueue.main.async {
                self.recipeList.reloadData()

            }
        
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.topItem?.title = "Recipes"
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        
        if (UIDevice.current.orientation == UIDeviceOrientation.portrait)
        {
            return CGSize.init(width: self.view.frame.width, height: self.view.frame.height/3.8)
        }
        else{
            return CGSize.init(width: self.view.frame.width/2, height: self.view.frame.height/2)
            
        }
       
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return RecipesViewModel.getRecipeItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        return RecipesViewModel.configureCell(collectionView:collectionView,indexPath:indexPath)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        RecipesViewModel.moveToRecipeDetails(navigationController: self.navigationController!, selectedItem: indexPath.row)
        
    }
    

}

