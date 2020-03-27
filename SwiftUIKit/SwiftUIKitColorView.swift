//
//  SwiftUIKitColorView.swift
//  SwiftUIKit
//
//  Created by Gualtiero Frigerio on 27/03/2020.
//  Copyright © 2020 Gualtiero Frigerio. All rights reserved.
//

import Foundation
import UIKit

struct SwiftUIKitColorView: SwiftUIKitView {
    var type: SwiftUIKitViewType {
        .single(internalView)
    }
    
    var uiView: UIView? {
        internalView
    }
    
    init(backgroundColor:UIColor) {
        internalView = UIView()
        internalView.backgroundColor = backgroundColor
    }
    
    private var internalView:UIView
}
