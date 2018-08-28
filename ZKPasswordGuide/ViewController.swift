//
//  ViewController.swift
//  ZKPasswordGuide
//
//  Created by Zeeshan Khan on 8/27/18.
//  Copyright © 2018 Zeeshan. All rights reserved.
//

import UIKit
import Cartography
import RxSwift
import RxCocoa
import RxDataSources
import Differentiator

class ViewController: UIViewController {

    private lazy var titleLabel = self.makeTitleLabel()
    private lazy var subTitleLabel = self.makeSubtitleLabel()
    private lazy var passwordRuleTableView = self.makeTableView()
    private lazy var passwordTextField = self.makeTextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func makeTitleLabel() -> UILabel {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        label.textColor = .black
        label.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        label.text = "Set Password"
        label.textAlignment = .center
        return label
    }
    
    private func makeSubtitleLabel() -> UILabel {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .lightGray
        label.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        label.text = "Must contain at-least"
        label.textAlignment = .center
        return label
    }
    
    private func makeTableView() -> UITableView {
        let tableView = UITableView.init(frame: .zero, style: .plain)
        tableView.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        return tableView
    }
    
    private func makeTextField() -> UITextField {
        let textField = UITextField(frame: .zero)
        textField.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        return textField
    }

    private func setupUI() {
        
        view.addSubview(titleLabel)
        constrain(view, titleLabel) { superView, subView in
            subView.top == superView.top + 24
            subView.leading == superView.leading + 16
            subView.trailing == superView.trailing - 16
        }

        view.addSubview(subTitleLabel)
        constrain(view, subTitleLabel, titleLabel) { superView, subView, topView in
            subView.top == topView.bottom + 4
            subView.leading == superView.leading + 16
            subView.trailing == superView.trailing - 16
        }

        view.addSubview(passwordRuleTableView)
        constrain(view, passwordRuleTableView, subTitleLabel) { superView, subView, topView in
            subView.top == topView.bottom + 24
            subView.leading == superView.leading + 24
            subView.trailing == superView.trailing - 24
        }
        
        view.addSubview(passwordTextField)
        constrain(view, passwordTextField, passwordRuleTableView) { superView, subView, topView in
            subView.top == topView.bottom + 24
            subView.leading == superView.leading + 24
            subView.trailing == superView.trailing - 24
            subView.height == 44.0
        }
    }
    

}

