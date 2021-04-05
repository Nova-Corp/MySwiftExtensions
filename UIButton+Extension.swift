//
//  UIButton+Extension.swift
//  Zom-UI-Design
//
//  Created by ADMIN on 25/03/21.
//  Copyright © 2021 Success Resource Pte Ltd. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedButton: UIButton {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
        }
    }

    @IBInspectable var borderColor: UIColor {
        get {
            return UIColor(cgColor: layer.borderColor ?? UIColor.white.cgColor)
        }
        set {
            self.layer.borderColor = newValue.cgColor
        }
    }

    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
        }
    }
}
