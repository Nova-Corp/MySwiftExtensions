//
//  CardView.swift
//  Cart-Page-UI-Design
//
//  Created by ADMIN on 05/03/21.
//  Copyright © 2021 Success Resource Pte Ltd. All rights reserved.
//

import UIKit

@IBDesignable
class CardView: UIView {

    @IBInspectable var shadowColor: UIColor {
        get {
            return UIColor(cgColor: self.layer.shadowColor ?? UIColor.black.cgColor)
        }
        set {
            self.layer.shadowColor = newValue.cgColor
            self.layer.shadowOpacity = 0.5
            self.layer.shadowOffset = .init(width: 0, height: 1)
        }
    }

    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
            self.layer.masksToBounds = false
            self.clipsToBounds = false
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

@IBDesignable
class CustomCardViewCornerRadius: UIView {
    @IBInspectable public var topLeft: Bool = false { didSet { setNeedsLayout() } }
    @IBInspectable public var topRight: Bool = false { didSet { setNeedsLayout() } }
    @IBInspectable public var bottomLeft: Bool = false { didSet { setNeedsLayout() } }
    @IBInspectable public var bottomRight: Bool = false { didSet { setNeedsLayout() } }
    @IBInspectable public var cornerRadius: CGFloat = 0 { didSet { setNeedsLayout() } }

    public override func layoutSubviews() {
        super.layoutSubviews()

        var options = UIRectCorner()

        if topLeft { options.formUnion(.topLeft) }
        if topRight { options.formUnion(.topRight) }
        if bottomLeft { options.formUnion(.bottomLeft) }
        if bottomRight { options.formUnion(.bottomRight) }

        let path = UIBezierPath(roundedRect: bounds,
                                byRoundingCorners: options,
                                cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))

        let maskLayer = CAShapeLayer()

        maskLayer.path = path.cgPath
        layer.mask = maskLayer
    }

}
