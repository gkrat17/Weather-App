//
//  ErrorPageView.swift
//  Weather
//
//  Created by Giorgi on 2/6/20.
//  Copyright © 2020 gkrat17. All rights reserved.
//

import UIKit

class ErrorPageView: ViewWithContentView {

    @IBOutlet weak var errorMessageLabel: UILabel!
    weak var delegate: ErrorPageDelegate?

    @IBOutlet weak var reloadButton: UIButton! {
        willSet {
            newValue.backgroundColor = UIColor.gold
            newValue.layer.cornerRadius = 5
        }
    }

    func configure(from model: ErrorPageModel) {
        setErrorMessage(model.errorMessage)
        
        let superView = model.superView
        resize(to: superView.bounds)
        superView.addSubview(self)
    }

    func setErrorMessage(_ errorMessage: String) {
        errorMessageLabel.text = errorMessage
    }

    func setDelegate(_ delegate: ErrorPageDelegate) {
        self.delegate = delegate
    }

    func resize(to bounds: CGRect) {
        frame = bounds
        autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }

    @IBAction func reloadTapped() {
        delegate?.reloadTapped()
    }

}
