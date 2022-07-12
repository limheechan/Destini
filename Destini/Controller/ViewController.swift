//
//  ViewController.swift
//  Destini
//
//  Created by 임희찬 on 2022/07/12.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var storyLabel: UILabel!
    
    @IBOutlet weak var choice1Button: UIButton!
    
    @IBOutlet weak var choice2Button: UIButton!
    
    var storyBraing = StoryBrain()
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
     
    }
    
    @IBAction func choiceMade(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        
        if let userAnswer = userAnswer {
            storyBraing.userSelcte(userAnswer: userAnswer)
        }else { print("nil")}
        
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
        
    }
    
    @objc func updateUI(){
        choice1Button.alpha = 0.9
        choice2Button.alpha = 0.9
        storyLabel.layer.borderWidth = 3.0
        storyLabel.layer.borderColor = UIColor.white.cgColor
        
        storyLabel.layer.cornerRadius = 0.5 * storyLabel.bounds.size.width
        
        
        storyLabel.text = storyBraing.stories[storyBraing.storyNumber].title
        choice1Button.setTitle(storyBraing.stories[storyBraing.storyNumber].choice1, for: .normal)
        choice2Button.setTitle(storyBraing.stories[storyBraing.storyNumber].choice2, for: .normal)
        
    }

}

