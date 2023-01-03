//
//  CustomKeyboard.swift
//  CustomKeyboard
//
//  Created by seobyeonggwan on 2022/12/31.
//

import UIKit

    //delegate - 기능이나 값을 위임해주는 것
protocol CustomKeyboardDelegate {
    func keyboardTapped(str: String)
}

class CustomKeyboard: UIView {
    
    var delegate: CustomKeyboardDelegate?
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        delegate?.keyboardTapped(str: sender.titleLabel?.text ?? "")
    }
    
    
}
