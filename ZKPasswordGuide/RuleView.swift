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
    private var isStriked = false
    
    private func toggleStrikethrough() {
        
    }

    func addStrikethrough() {
        guard !isStriked else { return }
        isStriked = true
        toggleStrikethrough()
    }
    
    func removeStrikethrough() {
        guard isStriked else { return }
        isStriked = false
        toggleStrikethrough()
    }
}
