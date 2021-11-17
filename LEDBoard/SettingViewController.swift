//
//  SettingViewController.swift
//  LEDBoard
//
//  Created by 남지훈 on 2021/11/16.
//

import UIKit

protocol SettingDelegate: AnyObject {
    func changedSetting(text: String?, textColor: UIColor, backgroundColor: UIColor)
}

class SettingViewController: UIViewController {
    
    
    @IBOutlet weak var textField: UITextField!
    
    
    @IBOutlet weak var yellowBtn: UIButton!
    @IBOutlet weak var greenBtn: UIButton!
    @IBOutlet weak var blueBtn: UIButton!
    
    @IBOutlet weak var blackBtn: UIButton!
    @IBOutlet weak var orangeBtn: UIButton!
    @IBOutlet weak var purpleBtn: UIButton!
    
    weak var delegate: SettingDelegate?
    var textColor: UIColor = .yellow
    var backgroundColor: UIColor = .black
    
    var ledText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    
    }
    
    private func configureView(){
        if let ledText = self.ledText{
            self.textField.text = ledText
        }
        self.changeTextColor(color: self.textColor)
        self.changeBackgroundColor(color: self.backgroundColor)
    }
   
    
    @IBAction func textColorBtn(_ sender: UIButton) {
        if sender == self.yellowBtn {
            self.changeTextColor(color: .yellow)
            self.textColor = .yellow
        } else if sender == self.greenBtn {
            self.changeTextColor(color: .green)
            self.textColor = .green
        } else if sender == self.blueBtn {
            self.changeTextColor(color: .blue)
            self.textColor = .blue
        }
    }
    
    @IBAction func backgroundColorBtn(_ sender: UIButton) {
        if sender == self.blackBtn {
            self.changeBackgroundColor(color: .black)
            self.backgroundColor = .black
        } else if sender == self.orangeBtn {
            self.changeBackgroundColor(color: .orange)
            self.backgroundColor = .orange
        } else if sender == self.purpleBtn {
            self.changeBackgroundColor(color: .purple)
            self.backgroundColor = .purple
        }
    }
    
    @IBAction func saveBtn(_ sender: UIButton) {
        self.delegate?.changedSetting(text: self.textField.text, textColor: textColor, backgroundColor: backgroundColor)
        self.navigationController?.popViewController(animated: true)
    }
    
    private func changeTextColor(color: UIColor){
        self.yellowBtn.alpha = color == UIColor.yellow ? 1 : 0.3
        self.greenBtn.alpha = color == UIColor.green ? 1 : 0.3
        self.blueBtn.alpha = color == UIColor.blue ? 1 : 0.3
    }
    
    private func changeBackgroundColor(color: UIColor){
        self.blackBtn.alpha = color == UIColor.black ? 1 : 0.3
        self.orangeBtn.alpha = color == UIColor.orange ? 1 : 0.3
        self.purpleBtn.alpha = color == UIColor.purple ? 1 : 0.3
        
    }
    
}
