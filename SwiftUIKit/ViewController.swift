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
        let statement = true
        
        let yellowView = SwiftUIKitColorView(backgroundColor: .yellow)
        let redView = SwiftUIKitColorView(backgroundColor: .red)
        let greenView = SwiftUIKitColorView(backgroundColor: .green)
        let magentaView = SwiftUIKitColorView(backgroundColor: .magenta)
        
        let containerView = HStack(frame: self.view.frame) {
            magentaView
            VStack(frame:self.view.frame) {
                if statement {
                    redView
                    yellowView
                }
                else {
                    greenView
                }
            }
            greenView
        }

        if let view = containerView.uiView {
            self.view.addSubview(view)
        }
    }


}

