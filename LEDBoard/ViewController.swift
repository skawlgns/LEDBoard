//
//  ViewController.swift
//  LEDBoard
//
//  Created by 남지훈 on 2021/11/16.
//

import UIKit

class ViewController: UIViewController, SettingDelegate{
    func changedSetting(text: String?, textColor: UIColor, backgroundColor: UIColor) {
        if let text = text {
            self.mainText.text = text
        }
        self.mainText.textColor = textColor
        self.view.backgroundColor = backgroundColor
    }
    

    @IBOutlet weak var mainText: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let settingViewController = segue.destination as? SettingViewController{
            settingViewController.delegate = self
            settingViewController.ledText = self.mainText.text
            settingViewController.textColor = self.mainText.textColor
            settingViewController.backgroundColor = self.view.backgroundColor ?? .black
        }
    }
    
}

