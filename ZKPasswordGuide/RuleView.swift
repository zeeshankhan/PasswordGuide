//
//  RuleView.swift
//  ZKPasswordGuide
//
//  Created by Zeeshan Khan on 8/28/18.
//  Copyright © 2018 Zeeshan. All rights reserved.
//

import UIKit

class RuleView: UIView {
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var strikethroughView: UIView!
    @IBOutlet private weak var strikethroughViewWidth: NSLayoutConstraint!
    private var isStriked = false
    
    private func toggleStrikethrough() {
        titleLabel.transform = CGAffineTransform(translationX: 10, y: 0)
        UIView.animate(withDuration: 0.3,
                       delay: 0,
                       //usingSpringWithDamping: 0.7,
                       //initialSpringVelocity: 1,
                       options: .curveEaseInOut,
                       animations: {
                        self.strikethroughViewWidth.constant = self.isStriked ? 0 : self.titleLabel.frame.width + 2.0
                        self.titleLabel.transform = .identity
                        self.layoutIfNeeded()
        }, completion: nil)
    }

    func addStrikethrough() {
        guard !isStriked else { return }
        toggleStrikethrough()
        isStriked = true
    }
    
    func removeStrikethrough() {
        guard isStriked else { return }
        toggleStrikethrough()
        isStriked = false
    }
}
