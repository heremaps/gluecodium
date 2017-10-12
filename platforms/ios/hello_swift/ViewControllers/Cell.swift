//
//  ButtonCellTableViewCell.swift
//  hello_swift
//
//  Created by Palmero, Antonio on 11.10.17.
//  Copyright © 2017 HERE. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {

    @IBOutlet weak var buttonTitle: UIButton!
    var title: String = ""

    func configure(title: String) {
        self.selectionStyle = .none
        buttonTitle.setTitle(title, for: .normal)
        buttonTitle.isUserInteractionEnabled = false
    }

}
