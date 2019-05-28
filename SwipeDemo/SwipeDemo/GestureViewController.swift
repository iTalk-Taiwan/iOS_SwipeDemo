//
//  GestureViewController.swift
//  SwipeDemo
//
//  Created by Jamie Chen on 2019/5/26.
//  Copyright © 2019 Jamie Chen. All rights reserved.
//

import UIKit

class GestureViewController: UIViewController {
    @IBOutlet weak var colorView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let directions: [UISwipeGestureRecognizer.Direction] = [.right, .left, .up, .down]
        
        for direction in directions {
            let swipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(sender:)))
            swipe.direction = direction
            self.view.addGestureRecognizer(swipe)
        }
        
    }
    
    @objc func handleSwipe(sender: UISwipeGestureRecognizer) {
        if sender.state == .ended {
            switch sender.direction {
            case .left:
                colorView.backgroundColor = .darkGray
            case .right:
                colorView.backgroundColor = .red
            case .up:
                colorView.backgroundColor = .green
            case .down:
                colorView.backgroundColor = .yellow
            default:
                break
            }
        }
    }
}
