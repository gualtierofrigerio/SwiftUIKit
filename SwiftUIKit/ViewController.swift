//
//  ViewController.swift
//  SwiftUIKit
//
//  Created by Gualtiero Frigerio on 26/03/2020.
//  Copyright © 2020 Gualtiero Frigerio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let yellowView = SwiftUIKitColorView(backgroundColor: .yellow)
        let redView = SwiftUIKitColorView(backgroundColor: .red)
        let containerView = HStack(frame: self.view.frame) {
            yellowView
            redView
        }
        if let view = containerView.uiView {
            self.view.addSubview(view)
        }
    }


}

