//
//  SettingViewController.swift
//  OddEvenGame
//
//  Created by YANJU1CY 🇰🇷 on 2023/06/20.
//

import UIKit

protocol SettingDelegate {
    func getBallsCount(ballCounts: Int)
}

class SettingViewController: UIViewController {
    @IBOutlet weak var ballCountsTextField: UITextField!
    
    var defaultBallCounts = 10
    var settingDelegate: SettingDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func completeBtnPressed(_ sender: Any) {
        
        guard let ballsStr = self.ballCountsTextField.text, let balls = Int(ballsStr) else {
            self.settingDelegate?.getBallsCount(ballCounts: self.defaultBallCounts)
            self.dismiss(animated: true, completion: nil)
            return
        }
        
        self.settingDelegate?.getBallsCount(ballCounts: balls)
        
        self.dismiss(animated: true, completion: nil)
    }
    
}
