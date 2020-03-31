//
//  SwiftUIKitModifier.swift
//  SwiftUIKit
//
//  Created by Gualtiero Frigerio on 31/03/2020.
//  Copyright © 2020 Gualtiero Frigerio. All rights reserved.
//

import Foundation
import UIKit

struct SwiftUIFrameModifier:SwiftUIKitModifier {
    init(_ frame:CGRect) {
        self.frame = frame
    }
    
    func modify(_ view: SwiftUIKitView) -> SwiftUIKitView {
        view.uiView?.frame = frame
        return view
    }
    
    private var frame:CGRect
}

struct SwiftUIColorModifier:SwiftUIKitModifier {
    
    init(_ color:UIColor) {
        self.backgroundColor = color
    }
    
    func modify(_ view: SwiftUIKitView) -> SwiftUIKitView {
        view.uiView?.backgroundColor = backgroundColor
        return view
    }
    
    private var backgroundColor:UIColor
}
