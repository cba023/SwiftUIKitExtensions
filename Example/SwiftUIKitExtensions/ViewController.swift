//
//  ViewController.swift
//  SwiftUIKitExtensions
//
//  Created by Chen Bo on 01/28/2022.
//  Copyright (c) 2022 Chen Bo. All rights reserved.
//

import UIKit
import SwiftUIKitExtensions
import SwiftUI

class ViewController: UIViewController {
    
    var redView = UIView()
        .ex.backgroundColor(.red)
        .ex.isHidden(false)

    override func viewDidLoad() {
        super.viewDidLoad()
//        view.addSubview(redView)
//        stackViewSetting()
        dsl()
    }

    func frameSetting() {
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
    
    func stackViewSetting() {
        
        let v1 = UIView()
            .ex.backgroundColor(.red)

        let v2 = UIView()
            .ex.backgroundColor(.green)
      
        let v3 = UIView()
            .ex.backgroundColor(.blue)
        
        v1.heightAnchor.constraint(equalToConstant: 100).isActive = true
        v2.heightAnchor.constraint(equalToConstant: 50).isActive = true
        v3.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        view.stack(axis: .vertical, distribution: .fillProportionally, alignment: .fill) { items in
            items.append(.init(view: v1, backSpacing: 0))
            items.append(.init(view: v2, backSpacing: 0))
            items.append(.init(view: v3, backSpacing: 0))
        }
        
        
    }
    
    func dsl() {
        let aView = UIView()
        aView.backgroundColor = .blue

        let bView = UIView()
        bView.backgroundColor = .red

        let cView = UIView()
        cView.backgroundColor = .yellow

        view.dsl.addSubviews {
            aView.dsl
                .align(.top, to: view, 100)
                .align(.left, to: view, 100)
                .align(.right, to: view, -100)
                .ratio()
                .addSubviews {
                    cView.dsl
                        .align(.top, to: aView, 10)
                        .align(.left, to: aView, 10)
                        .align(.bottom, to: aView, -10)
                        .align(.right, to: aView, -10)
                }
            bView.dsl
                .margin(.top, to: aView, other: .bottom, 20)
                .align(.left, to: aView)
                .align(.right, to: aView)
                .height(100)
        }

    }

}


