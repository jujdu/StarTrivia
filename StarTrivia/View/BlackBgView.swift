//
//  BlackBgView.swift
//  StarTrivia
//
//  Created by Michael Sidoruk on 29/07/2019.
//  Copyright © 2019 Michael Sidoruk. All rights reserved.
//

import UIKit

class BlackBgView: UIView {
    
    override func awakeFromNib() {
        layer.backgroundColor = BLACK_BG
        layer.cornerRadius = 10
    }
    
}

class BlackBgButton: UIButton {
    override func awakeFromNib() {
        layer.backgroundColor = BLACK_BG
        layer.cornerRadius = 10
    }
}
