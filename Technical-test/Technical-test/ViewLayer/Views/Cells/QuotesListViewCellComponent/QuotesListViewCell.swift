//
//  QuotesListViewCell.swift
//  Technical-test
//
//  Created by user on 13.03.2023.
//

import UIKit

class QuotesListViewCell: UITableViewCell {
    static let identifier = "QuotesListViewCell"
    
    override func updateConfiguration(using state: UICellConfigurationState) {
        super.updateConfiguration(using: state)
    
        var backgroundConfig = backgroundConfiguration?.updated(for: state)
        backgroundConfig?.backgroundColor = .systemBackground
        
        
        backgroundConfiguration = backgroundConfig
    }
}
