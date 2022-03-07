//
//  ViewController.swift
//  SwiftUIKitExtensions
//
//  Created by Chen Bo on 01/28/2022.
//  Copyright (c) 2022 Chen Bo. All rights reserved.
//

import UIKit
import SwiftUIKitExtensions

class ViewController: UIViewController {
    
    var redView = UIView()
        .ex.backgroundColor(.red)
        .ex.isHidden(false)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(redView)
        let a = UIColor.ex.hex(0x000000)
        redView.frame = CGRect(anchorPoint: .center, point: .point(self.view.ex.center), size: .sideLenth(120))
        UIView.animate(withDuration: 1) {
            self.redView.ex.size(CGSize(width: 150, height: 160))
        } completion: { finished in
            UIView.animate(withDuration: 1) {
                self.redView
                    .ex.size(.init(width: 30, height: 300))
                    .ex.width(120)
                    .ex.height(213)
                self.redView.backgroundColor = a
            }
        }

        print(size)
        UIButton().ex.action { b in
            print(b)
        }
    }


}

