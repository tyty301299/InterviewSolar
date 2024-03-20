//
//  Font+Ext.swift
//  InterviewSolar
//
//  Created by Titi3012 on 19/03/2024.
//
import UIKit

enum CompactDisplay {
    case medium
    case regular

    var name: String {
        switch self {
        case .medium:
            return "SFCompactDisplay-Medium"
        case .regular:
            return "SFCompactDisplay-Regular"
       
        }
    }
}

extension UIFont {
    static func systemFontCompactDisplay(_ compactDisplay: CompactDisplay, size: CGFloat = 15) -> UIFont? {
        return UIFont(name: compactDisplay.name, size: size)
    }
}
