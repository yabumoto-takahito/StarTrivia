//
//  FadeEnabledBtn.swift
//  StarTrivia
//
//  Created by 薮本崇仁 on 2019/10/21.
//  Copyright © 2019 薮本崇仁. All rights reserved.
//

import UIKit

class FadeEnableBtn: UIButton {
    override var isEnabled: Bool {
        didSet {
            if isEnabled {
                UIView.animate(withDuration: 0.2) {
                    self.alpha = 1.0
                }
            } else {
                UIView.animate(withDuration: 0.2) {
                    self.alpha = 0.5
                }
            }
        }
    }
}
