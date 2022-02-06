//
//  ViewController.swift
//  MiniGame
//
//  Created by Yuliia Khrupina on 2/5/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view5: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func handleGestureAction(gesture: UIPanGestureRecognizer) {
        let gestureTranslation = gesture.translation(in: view)
        
        guard let gestureView = gesture.view else {
            return
        }
        
        gestureView.center = CGPoint(
            x: gestureView.center.x + gestureTranslation.x,
            y: gestureView.center.y + gestureTranslation.y
        )
        
        gesture.setTranslation(.zero, in: view)
        
        guard gesture.state == .ended else {
            return
        }
    }
    
    
    @IBAction func onPanGestureView1(_ gesture: UIPanGestureRecognizer) {
        handleGestureAction(gesture: gesture)
    }
    
    
    @IBAction func onPanGestureView2(_ gesture: UIPanGestureRecognizer) {
        handleGestureAction(gesture: gesture)
    }
}

