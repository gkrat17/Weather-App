//
//  Spinner.swift
//  Weather
//
//  Created by Giorgi on 2/4/20.
//  Copyright © 2020 gkrat17. All rights reserved.
//

import UIKit

class Spinner {

    let superView: UIView

    let spinnerView: UIVisualEffectView
    let spinnerViewWidthConstraint: NSLayoutConstraint
    let spinnerViewHeightConstraint: NSLayoutConstraint
    let spinnerViewCenterXConstraint: NSLayoutConstraint
    let spinnerViewCenterYConstraint: NSLayoutConstraint

    let activityIndicator: UIActivityIndicatorView

    init(toShowOn superView: UIView) {

        self.superView = superView

        // Init spinnerView instances
        self.spinnerView = Spinner.getSpinnerView()


        // Init spinnerView constraints
        self.spinnerView.translatesAutoresizingMaskIntoConstraints = false

        self.spinnerViewWidthConstraint = NSLayoutConstraint(item: spinnerView, attribute: .width, relatedBy: .equal, toItem: superView, attribute: .width, multiplier: 1, constant: 0)

        self.spinnerViewHeightConstraint = NSLayoutConstraint(item: spinnerView, attribute: .height, relatedBy: .equal, toItem: superView, attribute: .height, multiplier: 1, constant: 0)

        self.spinnerViewCenterXConstraint = NSLayoutConstraint(item: spinnerView, attribute: .centerX, relatedBy: .equal, toItem: superView, attribute: .centerX, multiplier: 1, constant: 0)

        self.spinnerViewCenterYConstraint = NSLayoutConstraint(item: spinnerView, attribute: .centerY, relatedBy: .equal, toItem: superView, attribute: .centerY, multiplier: 1, constant: 0)


        // Init activityIndicator
        self.activityIndicator = Spinner.getActivityIndicator()
        initActivityIndicator()
    }

    func show() {
        activityIndicator.startAnimating()
        superView.addSubview(spinnerView)
        superView.addConstraints([spinnerViewWidthConstraint, spinnerViewHeightConstraint, spinnerViewCenterXConstraint, spinnerViewCenterYConstraint])
    }

    func remove() {
        activityIndicator.stopAnimating()
        spinnerView.removeFromSuperview()
    }

    private func initActivityIndicator() {

        let contentView = spinnerView.contentView
        contentView.addSubview(activityIndicator)

        activityIndicator.translatesAutoresizingMaskIntoConstraints = false

        let centerXConstraint = NSLayoutConstraint(item: activityIndicator, attribute: .centerX, relatedBy: .equal, toItem: contentView, attribute: .centerX, multiplier: 1, constant: 0)

        let centerYConstraint = NSLayoutConstraint(item: activityIndicator, attribute: .centerY, relatedBy: .equal, toItem: contentView, attribute: .centerY, multiplier: 1, constant: 0)

        contentView.addConstraints([centerXConstraint, centerYConstraint])
    }

    private static func getSpinnerView() -> UIVisualEffectView {
        let blurEffect = UIBlurEffect(style: .regular)
        let spinnerView = UIVisualEffectView(effect: blurEffect)
        return spinnerView
    }

    private static func getActivityIndicator() -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
        activityIndicator.color = .gray
        return activityIndicator
    }

}
