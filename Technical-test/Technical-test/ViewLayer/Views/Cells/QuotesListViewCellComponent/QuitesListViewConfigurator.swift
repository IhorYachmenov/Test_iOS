//
//  QuitesListViewConfigurator.swift
//  Technical-test
//
//  Created by user on 13.03.2023.
//

import UIKit

struct QuitesListViewConfigurator : UIContentConfiguration {
    var model: PresentationModel.Quote
    
    func makeContentView() -> UIView & UIContentView {
        return QuotesListViewContentView(configuration:self)
    }
    
    func updated(for state: UIConfigurationState) -> QuitesListViewConfigurator {
        return self
    }
}
