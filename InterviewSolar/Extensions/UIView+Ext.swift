//
//  UIView+Ext.swift
//  InterviewSolar
//
//  Created by Titi3012 on 20/03/2024.
//

import UIKit

extension UIView {
    func addShadow(radius: CGFloat, color: UIColor, offset: CGSize, opacity: Float) {
        layer.cornerRadius = radius
        layer.shadowRadius = radius
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowOpacity = opacity
        layer.masksToBounds = false
    }
}
