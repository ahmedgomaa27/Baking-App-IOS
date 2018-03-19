//
//  StepDetailsViewController.swift
//  Baking App
//
//  Created by Ahmed Hamdy Gomaa on 3/18/18.
//  Copyright © 2018 Ahmed Hamdy Gomaa. All rights reserved.
//

import UIKit
import AVKit

class StepDetailsViewController: UIViewController {
    
    
    var descString:String?
    var videoUrl:String?
    var allSteps: [Steps]!
    var position:Int!
    let playerController = AVPlayerViewController()
    
    
    
    @IBOutlet weak var videoView: UIView!
    @IBOutlet weak var descText: UITextView!
    @IBOutlet weak var nextBtnView: UIButton!
    @IBOutlet weak var prevBtnView: UIButton!
    @IBAction func nextStepBtn(_ sender: UIButton) {
        
        prevBtnView.isEnabled = true
        playerController.player?.pause()
        if position < (allSteps?.count)!-1 {
            position = position + 1
            
            let text = allSteps[position].description
            let url = allSteps[position].videoURL
            configureVideoPlayer(urlString: url)
            configureLabel(text:text)
            
        } else{
            nextBtnView.isEnabled = false
            
        }
        
    }
    
    
    @IBAction func prevStepBtn(_ sender: UIButton) {
        nextBtnView.isEnabled = true
        playerController.player?.pause()
        
        if position > 0 {
            position = position - 1
            
            let text = allSteps[position].description
            
            
            configureLabel(text:text)
            let url = allSteps[position].videoURL
            
            configureVideoPlayer(urlString: url)
            
        } else{
            
            prevBtnView.isEnabled = false
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if position == 0  {
            prevBtnView.isEnabled = false
        }
        if position == allSteps.count - 1 {
            nextBtnView.isEnabled = false
        }
        
        configureLabel(text: descString!)
        
        
        configureVideoPlayer(urlString: videoUrl!)
        
        
    }
    
    
    func configureLabel(text:String){
        
        descText.text = text
        descText.isEditable = false
        
        
    }
    func configureVideoPlayer(urlString: String)  {
        
        if (urlString == " " || urlString.isEmpty) {
            
            if(videoView != nil){
                videoView.removeFromSuperview()
            }
            playerController.view.removeFromSuperview()
            playerController.removeFromParentViewController()
            
            
        }
        else{
            let url = URL.init(string: urlString)
            let player = AVPlayer(url: url!)
            playerController.player = player
            self.addChildViewController(playerController)
            if(videoView == nil){
                playerController.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 200)
                view.insertSubview(playerController.view, belowSubview: descText)
                view.addConstraint(NSLayoutConstraint(item: descText, attribute: .top, relatedBy: .equal, toItem: playerController.view, attribute: .bottom, multiplier: 1.0, constant: 0))
                
                
            }
            else{
                // check for iphone X
                if (UIScreen.main.nativeBounds.height != 2436){

                videoView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 250)

                }
                playerController.view.frame = videoView.frame
                view.addSubview(playerController.view)
            }
            
            
        }
        
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
