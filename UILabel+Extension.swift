//
//  UILabel+Extension.swift
//  Zom-UI-Design
//
//  Created by ADMIN on 25/03/21.
//  Copyright © 2021 Success Resource Pte Ltd. All rights reserved.
//

import UIKit

extension UILabel {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = true
        }
    }

    func addTrailing(image: UIImage, text: String) {
        let attachment = NSTextAttachment()
        let iconsSize = CGRect(x: 0, y: -2, width: 12, height: 12)

        attachment.image = image.withRenderingMode(.alwaysTemplate)
        attachment.bounds = iconsSize

        let attachmentString = NSAttributedString(attachment: attachment)
        let string = NSMutableAttributedString(string: text + " ", attributes: [:])

        string.append(attachmentString)
        attributedText = string
    }

    func addLeading(image: UIImage, text: String) {
        let attachment = NSTextAttachment()
        let iconsSize = CGRect(x: 0, y: -2, width: 12, height: 12)
        attachment.image = image.withRenderingMode(.alwaysTemplate)
        attachment.bounds = iconsSize

        let attachmentString = NSAttributedString(attachment: attachment)
        let mutableAttributedString = NSMutableAttributedString()
        mutableAttributedString.append(attachmentString)

        let string = NSMutableAttributedString(string: " " + text, attributes: [:])
        mutableAttributedString.append(string)
        attributedText = mutableAttributedString
    }

    func addDashedUnderLine(color: CGColor = UIColor.black.cgColor, thickness: CGFloat = 1) {
        backgroundColor = .clear

        let shapeLayer = CAShapeLayer()

        let shapeRect = CGRect(x: 0, y: frame.height - 1, width: frame.width, height: 1)

        shapeLayer.name = "DashedTopLine"
        shapeLayer.bounds = shapeRect
        shapeLayer.position = CGPoint(x: frame.width / 2, y: frame.height)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = color
        shapeLayer.lineWidth = thickness
        shapeLayer.lineJoin = CAShapeLayerLineJoin.round
        shapeLayer.lineDashPattern = [3, 3.5]

        let path = CGMutablePath()
        path.move(to: CGPoint(x: 0, y: frame.height))
        path.addLine(to: CGPoint(x: frame.width, y: frame.height))
        shapeLayer.path = path

        layer.addSublayer(shapeLayer)
    }
}
