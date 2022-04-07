//
//  UILabel+Attributes.swift
//  Utility
//
//  Created by Zhang, Wanming on 4/6/22.
//

import UIKit

extension UILabel {
    func underline() {
        if let textString = self.text {
            let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(.underlineStyle,
                                          value: NSUnderlineStyle.single.rawValue,
                                          range: NSRange(location: 0, length: attributedString.length))
            self.attributedText = attributedString
        }
    }
    
    func underline(_ range : NSRange) {
        if let textString = self.text {
            let attributedString = NSMutableAttributedString(string: textString)
            attributedString.addAttribute(.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: range)
            self.attributedText = attributedString
        }
    }

    // Add kerning to existing attributedText
    func addKern(_ kernValue: Double) {
        guard let attributedString = self.attributedText, attributedString.length > 0 else { return }
        let mutableAttributedString = NSMutableAttributedString(attributedString: attributedString)
        mutableAttributedString.addAttribute(.kern,
                                             value: kernValue,
                                             range: NSRange(location: 0, length: attributedString.length))
        self.attributedText = mutableAttributedString
    }
}
