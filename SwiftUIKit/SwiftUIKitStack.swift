//
//  SwiftUIKitVStack.swift
//  SwiftUIKit
//
//  Created by Gualtiero Frigerio on 26/03/2020.
//  Copyright © 2020 Gualtiero Frigerio. All rights reserved.
//

import Foundation
import UIKit

struct HStack: SwiftUIKitStack {
    var type: SwiftUIKitViewType {
        .single(containerView)
    }
    var uiView: UIView? {
        containerView
    }
    
    init(frame:CGRect, @SwiftUIKitViewBuilder _ builder:()->SwiftUIKitView) {
        let uiKitView = builder()
        containerView = UIView(frame: frame)
        if let uiViews = uiKitView.type.uiViews() {
            addViews(uiViews, align: .horizontal, toView: containerView)
        }
    }
    
    private var containerView:UIView
}

struct VStack: SwiftUIKitStack {
    var type: SwiftUIKitViewType {
        .single(containerView)
    }
    var uiView: UIView? {
        containerView
    }
    
    init(frame:CGRect, @SwiftUIKitViewBuilder _ builder:()->SwiftUIKitView) {
        let uiKitView = builder()
        containerView = UIView(frame: frame)
        if let uiViews = uiKitView.type.uiViews() {
            addViews(uiViews, align: .vertical, toView: containerView)
        }
    }
    
    private var containerView:UIView
}

private enum SwiftUIKitAlignment {
    case horizontal
    case vertical
    case none
}

private protocol SwiftUIKitStack:SwiftUIKitView {
    
}

extension SwiftUIKitStack {
    func addViews(_ views:[UIView], align:SwiftUIKitAlignment, toView containerView:UIView) {
        let size = containerView.frame.size
        var height = size.height
        var width = size.width
        var xStep:CGFloat = 0.0
        var yStep:CGFloat = 0.0
        if align == .horizontal {
            width = size.width / CGFloat(views.count)
            xStep = width
        }
        else {
            height = size.height / CGFloat(views.count)
            yStep = height
        }
        var frame = CGRect(x: 0, y: 0, width: width, height: height)
        for view in views {
            view.frame = frame
            containerView.addSubview(view)
            frame.origin.x += xStep
            frame.origin.y += yStep
        }
    }
}


