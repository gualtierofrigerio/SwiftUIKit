//
//  SwiftUIKitTextView.swift
//  SwiftUIKit
//
//  Created by Gualtiero Frigerio on 31/03/2020.
//  Copyright © 2020 Gualtiero Frigerio. All rights reserved.
//

import Foundation
import UIKit

struct Text: SwiftUIKitView {
    var type: SwiftUIKitViewType {
        .single(label)
    }
    
    var uiView:UIView? {
        label
    }
    
    init(_ text:String) {
        label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.text = text
    }
    
    private var label:UILabel
}

extension Text {
    func font(_ font:UIFont) -> SwiftUIKitView {
        label.font = font
        return self
    }
}
