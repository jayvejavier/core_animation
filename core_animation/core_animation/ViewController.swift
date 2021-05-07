//
//  ViewController.swift
//  core_animation
//
//  Created by Mospeng Research Lab Philippines on 6/20/20.
//  Copyright © 2020 Mospeng Research Lab Philippines. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Core Animation - UIImageView
    let zoomImageView = UIImageView() //UIView()
    let startingFrame = CGRect(x: 0, y: 0, width: 200, height: 250)
    var isToggle = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        zoomImageView.isUserInteractionEnabled = true
        zoomImageView.frame = startingFrame
        zoomImageView.backgroundColor = .yellow
        zoomImageView.image = UIImage(named: "Steve_Jobs_presents_iPhone")
        zoomImageView.contentMode = .scaleAspectFill
        zoomImageView.clipsToBounds = true
        
        zoomImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(animateImageView)))
        
        view.addSubview(zoomImageView)
    }
    
    @objc func animateImageView() {
        if isToggle {
            UIView.animate(withDuration: 0.75) {
                self.zoomImageView.frame = self.startingFrame
                
                self.view.backgroundColor = .white
            }
            self.isToggle = false
        }
        else {
            UIView.animate(withDuration: 0.75) {
                let newWidth = self.view.frame.width
                let newHeight = (newWidth / self.startingFrame.width) * self.startingFrame.height
                
                let centerY = self.view.frame.height / 2 - newHeight / 2
                let proportionalFrame = CGRect(x: 0, y: centerY, width: newWidth, height: newHeight)
                self.zoomImageView.frame = proportionalFrame
                
                self.view.backgroundColor = .black
            }
            self.isToggle = true
        }
        
    }
    
     // Core Animation - UIView
//    let zoomView = UIView()
//    let startingFrame = CGRect(x: 0, y: 0, width: 200, height: 100)
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        zoomView.frame = startingFrame
//        zoomView.backgroundColor = .blue
//
//        zoomView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(animateView)))
//
//        view.addSubview(zoomView)
//
//    }
//
//   @objc func animateView() {
//        UIView.animate(withDuration: 0.75) {
//            // Formula to get height proportion of rectangle startingFrame: (h2 = w2 / w1) * h1
//            let newWidth = self.view.frame.width
//            let newHeight = (newWidth / self.startingFrame.width) * self.startingFrame.height
//
//            let centerY = self.view.frame.height / 2 - newHeight / 2
//
//            let secondFrame = CGRect(x: 0, y: centerY, width: newWidth, height: newHeight)
//
//            self.zoomView.frame = secondFrame
//
//            self.view.backgroundColor = .black
//        }
//    }
}

