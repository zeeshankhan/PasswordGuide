//
//  ViewController.swift
//  ZKPasswordGuide
//
//  Created by Zeeshan Khan on 8/27/18.
//  Copyright © 2018 Zeeshan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var ruleContainerView: UIView!
    @IBOutlet private weak var ruleStackViewContainer: UIView!
    
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var uppercaseLetterRuleView: RuleView!
    @IBOutlet private weak var characterCountRuleView: RuleView!
    @IBOutlet private weak var numberLetterRuleView: RuleView!
    @IBOutlet private weak var specialCharacterRuleView: RuleView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ruleContainerView.layer.cornerRadius = 4.0
        ruleStackViewContainer.layer.cornerRadius = 4.0

//        let degree = -1.0
//        let angle = CGFloat(degree * .pi/180)
//        ruleContainerView.transform = CGAffineTransform(rotationAngle: angle)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(textFieldDidChange),
                                               name: .UITextFieldTextDidChange,
                                               object: nil)
    }

    @objc func textFieldDidChange() {
        guard let text = textField.text else {
            uppercaseLetterRuleView.removeStrikethrough()
            characterCountRuleView.removeStrikethrough()
            numberLetterRuleView.removeStrikethrough()
            specialCharacterRuleView.removeStrikethrough()
            return
        }
        
        if text.count < 8 {
            characterCountRuleView.removeStrikethrough()
        } else {
            characterCountRuleView.addStrikethrough()
        }
        
        let numberRegEx = ".*[0-9]+.*"
        let numbertest = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        if numbertest.evaluate(with: text) {
            numberLetterRuleView.addStrikethrough()
        } else {
            numberLetterRuleView.removeStrikethrough()
        }

        let upperRegEx = ".*[A-Z]+.*"
        let uppertest = NSPredicate(format:"SELF MATCHES %@", upperRegEx)
        if uppertest.evaluate(with: text) {
            uppercaseLetterRuleView.addStrikethrough()
        } else {
            uppercaseLetterRuleView.removeStrikethrough()
        }
        
        let regex = try! NSRegularExpression(pattern: ".*[^A-Za-z0-9].*", options: NSRegularExpression.Options())
        if regex.firstMatch(in: text, options: NSRegularExpression.MatchingOptions(), range:NSMakeRange(0, text.count)) != nil {
            print("could not handle special characters")
            specialCharacterRuleView.addStrikethrough()
        } else {
            specialCharacterRuleView.removeStrikethrough()
        }
        
    }
    
}
