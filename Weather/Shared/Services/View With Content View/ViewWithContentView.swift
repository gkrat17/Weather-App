//
//  ViewWithContentView.swift
//  Weather
//
//  Created by Giorgi on 2/3/20.
//  Copyright © 2020 gkrat17. All rights reserved.
//

import UIKit

class ViewWithContentView: UIView {

    @IBOutlet weak var contentView: UIView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initialize()
    }

    private func initialize() {

        let className = String(describing: type(of: self))
        Bundle.main.loadNibNamed(className, owner: self, options: nil)

        guard let content = contentView else {
            fatalError("contentView not set")
        }

        content.frame = self.bounds
        content.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        addSubview(content)
    }

}
