//
//  View.swift
//  SwiftUIKit
//
//  Created by Gualtiero Frigerio on 26/03/2020.
//  Copyright © 2020 Gualtiero Frigerio. All rights reserved.
//

import Foundation
import UIKit

enum SwiftUIKitViewType {
    case empty
    case multiple([UIView])
    case single(UIView)
    
    func uiView() -> UIView? {
        switch self {
        case .empty:
            return nil
        case .single(let view):
            return view
        case .multiple(let views):
            let container = UIView()
            for view in views {
                container.addSubview(view)
            }
            return container
        }
    }
    
    func uiViews() -> [UIView]? {
        switch self {
        case .empty:
            return nil
        case .multiple(let views):
            return views
        case .single(let view):
            return [view]
        }
    }
}

protocol SwiftUIKitView {
    var type: SwiftUIKitViewType { get }
    var uiView:UIView? { get }
}

struct SwiftUIKitContainer: SwiftUIKitView {
    var type: SwiftUIKitViewType {
        internalViewType
    }
    var uiView:UIView? {
        internalViewType.uiView()
    }
    
    init(withViews views:[SwiftUIKitView]) {
        var uiViews:[UIView] = []
        for view in views {
            switch view.type {
            case .multiple(let multipleViews):
                uiViews.append(contentsOf: multipleViews)
            case .single(let singleView):
                uiViews.append(singleView)
            default:
                ()
            }
        }
        if uiViews.count == 0 {
            internalViewType = .empty
        }
        else if uiViews.count == 1 {
            internalViewType = .single(uiViews[0])
        }
        else {
            internalViewType = .multiple(uiViews)
        }
    }
    
    private var internalViewType:SwiftUIKitViewType
}

struct SwiftUIKitViewEmpty: SwiftUIKitView {
    var type: SwiftUIKitViewType {
        .empty
    }
    var uiView: UIView? {
        nil
    }
}

@_functionBuilder
struct SwiftUIKitViewBuilder {
    static func buildBlock(_ views:SwiftUIKitView...) -> SwiftUIKitView {
        return SwiftUIKitContainer(withViews: views)
    }
    
    static func buildEither(first: SwiftUIKitView) -> SwiftUIKitView {
        return first
    }

    static func buildEither(second: SwiftUIKitView) -> SwiftUIKitView {
        return second
    }
    
    static func buildIf(_ view:SwiftUIKitView?) -> SwiftUIKitView {
        view ?? SwiftUIKitViewEmpty()
    }
}
