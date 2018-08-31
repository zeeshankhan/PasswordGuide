//
//  ViewController.swift
//  ZKPasswordGuide
//
//  Created by Zeeshan Khan on 8/27/18.
//  Copyright © 2018 Zeeshan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var rulesView: UIView! /// for rotation
    @IBOutlet private weak var ruleContainerView: UIView! /// for outer gray corner
    @IBOutlet private weak var ruleStackViewContainer: UIView! /// For inner gray corner
    @IBOutlet private weak var checkedImageView: UIImageView!
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var uppercaseLetterRuleView: RuleView!
    @IBOutlet private weak var characterCountRuleView: RuleView!
    @IBOutlet private weak var numberLetterRuleView: RuleView!
    @IBOutlet private weak var specialCharacterRuleView: RuleView!

    override func viewDidLoad() {
        super.viewDidLoad()

        checkedImageView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01);
        ruleStackViewContainer.layer.cornerRadius = 4.0
        ruleContainerView.layer.cornerRadius = 4.0
        
        let degree = -1.5
        let angle = CGFloat(degree * .pi/180)
        rulesView.transform = CGAffineTransform(rotationAngle: angle)
        rulesView.layer.borderWidth = 1
        rulesView.layer.borderColor = UIColor.clear.cgColor //#colorLiteral(red: 0.2901960784, green: 0.2039215686, blue: 0.5764705882, alpha: 1).cgColor
        rulesView.layer.shouldRasterize = true
        rulesView.layer.rasterizationScale = UIScreen.main.scale
        rulesView.layer.cornerRadius = 4.0
        
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
        let isCountOk = text.count < 8
        if isCountOk {
            characterCountRuleView.removeStrikethrough()
        } else {
            characterCountRuleView.addStrikethrough()
        }
        
        let numberRegEx = ".*[0-9]+.*"
        let numbertest = NSPredicate(format:"SELF MATCHES %@", numberRegEx)
        let isNumOk = !numbertest.evaluate(with: text)
        if isNumOk {
            numberLetterRuleView.removeStrikethrough()
        } else {
            numberLetterRuleView.addStrikethrough()
        }

        let upperRegEx = ".*[A-Z]+.*"
        let uppertest = NSPredicate(format:"SELF MATCHES %@", upperRegEx)
        let isUppercaseOk = !uppertest.evaluate(with: text)
        if isUppercaseOk {
            uppercaseLetterRuleView.removeStrikethrough()
        } else {
            uppercaseLetterRuleView.addStrikethrough()
        }
        
        let regex = try! NSRegularExpression(pattern: ".*[^A-Za-z0-9].*", options: NSRegularExpression.Options())
        let isSpecOk = regex.firstMatch(in: text, options: NSRegularExpression.MatchingOptions(), range:NSMakeRange(0, text.count)) != nil
        if isSpecOk {
            print("could not handle special characters")
            specialCharacterRuleView.addStrikethrough()
        } else {
            specialCharacterRuleView.removeStrikethrough()
        }
     
        if !isCountOk, !isNumOk, !isUppercaseOk, isSpecOk {
            growImage()
        } else {
            shrinkImage()
        }
    }
    
    func growImage() {
        if !checkedImageView.transform.isIdentity {
            UIView.animate(withDuration: 0.3,
                           delay: 0,
                           usingSpringWithDamping: 1,
                           initialSpringVelocity: 1,
                           options: .curveEaseInOut,
                           animations: {
                            self.checkedImageView.transform = CGAffineTransform.identity
                }, completion: nil)            
        }
    }
    
    func shrinkImage() {
        if checkedImageView.transform.isIdentity {
            UIView.animate(withDuration: 0.3) {
                self.checkedImageView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01);
            }
        }
    }
}
