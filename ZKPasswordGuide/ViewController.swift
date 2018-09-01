//
//  ViewController.swift
//  ZKPasswordGuide
//
//  Created by Zeeshan Khan on 8/27/18.
//  Copyright © 2018 Zeeshan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var lockImageView: UIImageView! /// for rotation
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

        /// Set initial form
        checkedImageView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01);

        /// Set Corners
        ruleStackViewContainer.layer.cornerRadius = 4.0
        ruleContainerView.layer.cornerRadius = 4.0
        rulesView.layer.cornerRadius = 4.0

        /// Rotate Views
        lockImageView.rotate(angle: -15)
        rulesView.rotate(angle: -2.5)
        
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

        let isCountOk = text.count > 7
        isCountOk
            ? characterCountRuleView.addStrikethrough()
            : characterCountRuleView.removeStrikethrough()
        
        let isNumOk = text.isNumberIncluded
        isNumOk
            ? numberLetterRuleView.addStrikethrough()
            : numberLetterRuleView.removeStrikethrough()

        let isUppercaseOk = text.isUppercaseIncluded
        isUppercaseOk
            ? uppercaseLetterRuleView.addStrikethrough()
            : uppercaseLetterRuleView.removeStrikethrough()
        
        let isSpecOk = text.isSpecialCharIncluded
        isSpecOk
            ? specialCharacterRuleView.addStrikethrough()
            : specialCharacterRuleView.removeStrikethrough()
     
        (isCountOk && isNumOk && isUppercaseOk && isSpecOk)
            ? growImage()
            : shrinkImage()
    }
    
    func growImage() {
        guard !checkedImageView.transform.isIdentity else { return }
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       usingSpringWithDamping: 1,
                       initialSpringVelocity: 1,
                       options: .curveEaseInOut,
                       animations: {
                        self.checkedImageView.transform = .identity
        }, completion: nil)
    }
    
    func shrinkImage() {
        guard checkedImageView.transform.isIdentity else { return }
        UIView.animate(withDuration: 0.3) {
            self.checkedImageView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01);
        }
    }
}
