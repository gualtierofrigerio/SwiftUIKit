//
//  SwiftUIKitVStack.swift
//  SwiftUIKit
//
//  Created by Gualtiero Frigerio on 26/03/2020.
//  Copyright © 2020 Gualtiero Frigerio. All rights reserved.
//

import Foundation
import UIKit

struct HStack:SwiftUIKitView {
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
            addViews(uiViews, toView: containerView)
        }
    }
    
    private var containerView:UIView
    
    private func addViews(_ views: [UIView], toView containerView: UIView) {
        let size = containerView.frame.size
        let width = size.width / CGFloat(views.count)
        
        var frame = CGRect(x: 0, y: 0, width: width, height: size.height)
        for view in views {
            view.frame = frame
            containerView.addSubview(view)
            frame.origin.x += width
        }
    }
}

struct VStack: SwiftUIKitView {
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
            addViews(uiViews, toView: containerView)
        }
    }
    
    private var containerView:UIView
    
    private func addViews(_ views: [UIView], toView containerView: UIView) {
        let size = containerView.frame.size
        let height = size.height / CGFloat(views.count)
        
        var frame = CGRect(x: 0, y: 0, width: size.width, height: height)
        for view in views {
            view.frame = frame
            containerView.addSubview(view)
            frame.origin.y += height
        }
    }
}

struct ZStack: SwiftUIKitView {
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
            addViews(uiViews, toView: containerView)
        }
    }
    
    private var containerView:UIView
    
    private func addViews(_ views: [UIView], toView containerView: UIView) {
        var zPosition:CGFloat = 0.0
        
        for view in views {
            containerView.addSubview(view)
            view.layer.zPosition = zPosition
            zPosition += 1
        }
    }
}
