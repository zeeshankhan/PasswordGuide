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

        let degree = -1.0
        let angle = CGFloat(degree * .pi/180)
        ruleContainerView.transform = CGAffineTransform(rotationAngle: angle);
    }

}
