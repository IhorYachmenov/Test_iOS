//
//  QuotesListView.swift
//  Technical-test
//
//  Created by user on 13.03.2023.
//

import UIKit

class QuotesListViewContentView: UIView, UIContentView {
    var configuration: UIContentConfiguration {
        didSet {
            initViewsData(configurator: configuration as! QuitesListViewConfigurator)
        }
    }
        
    lazy var name: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.numberOfLines = 1
        view.textColor = .black
        view.textAlignment = .left
        return view
    }()
    
    lazy var last: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.numberOfLines = 1
        view.textColor = .black
        view.textAlignment = .left
        return view
    }()
    
    lazy var currency: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.numberOfLines = 1
        view.textColor = .black
        view.textAlignment = .left
        return view
    }()
    
    lazy var percent: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.numberOfLines = 1
        view.textColor = .black
        view.textAlignment = .left
        return view
    }()
    
    lazy var image: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()


    init(configuration: UIContentConfiguration) {
        self.configuration = configuration
        super.init(frame:.zero)
        backgroundColor = .clear

        addSubview(name)
        addSubview(last)
        addSubview(currency)
        addSubview(percent)
        addSubview(image)
        
        name.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        name.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        name.trailingAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        last.topAnchor.constraint(equalTo: name.bottomAnchor).isActive = true
        last.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        last.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        last.setContentHuggingPriority(UILayoutPriority(751), for: .horizontal)
        
        currency.topAnchor.constraint(equalTo: name.bottomAnchor).isActive = true
        currency.leadingAnchor.constraint(equalTo: last.trailingAnchor, constant: 5).isActive = true
        currency.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        currency.trailingAnchor.constraint(equalTo: centerXAnchor).isActive = true

        percent.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        percent.leadingAnchor.constraint(equalTo: centerXAnchor).isActive = true
        percent.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        percent.trailingAnchor.constraint(equalTo: image.leadingAnchor, constant: -10).isActive = true

        image.heightAnchor.constraint(equalToConstant: 25).isActive = true
        image.widthAnchor.constraint(equalToConstant: 25).isActive = true
        image.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 0).isActive = true
        image.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true

        
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initViewsData(configurator: QuitesListViewConfigurator) {
        name.text = configurator.model.name
        last.text = configurator.model.last
        currency.text = configurator.model.currency
        
        percent.textColor = (configurator.model.variationColor == "red") ? .red : .green
        percent.text = configurator.model.percent
        
        let imageName = (configurator.model.isFavorite == true) ? "favorite" : "no-favorite"
        image.image = UIImage(named: imageName)
    }
}

