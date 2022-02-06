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
    }
    
    func calculateDistanceAndUpdateViews(staticView: UIView, draggableView: UIView) {
        if (distanceBetweenViews(view1: staticView, view2: draggableView) < 50.0) {
            if (staticView != draggableView) {
                print(distanceBetweenViews(view1: staticView, view2: draggableView))
                draggableView.isHidden = true
                
                let currentAlpha = staticView.alpha
                let newAlpha = currentAlpha + 0.15
                
                staticView.alpha = newAlpha
            }
        }
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
        
        //print("x=\(gestureTranslation.x), y=\(gestureTranslation.y)")
        
        gesture.setTranslation(.zero, in: view)
        
        guard gesture.state == .ended else {
            return
        }
        
        calculateDistanceAndUpdateViews(staticView: view1, draggableView: gestureView)
        calculateDistanceAndUpdateViews(staticView: view2, draggableView: gestureView)
        calculateDistanceAndUpdateViews(staticView: view3, draggableView: gestureView)
        calculateDistanceAndUpdateViews(staticView: view4, draggableView: gestureView)
        calculateDistanceAndUpdateViews(staticView: view5, draggableView: gestureView)
    }
    
    func distanceBetweenViews(view1: UIView, view2: UIView) -> CGFloat {
        let center1 = view1.center
        let center2 = view2.center
        
        let deltaX = center1.x - center2.x
        let deltaY = center1.y - center2.y
        
        return (deltaX * deltaX + deltaY * deltaY).squareRoot()
    }
    
    
    @IBAction func onPanGestureView1(_ gesture: UIPanGestureRecognizer) {
        handleGestureAction(gesture: gesture)
    }
    
    @IBAction func onPanGestureView2(_ gesture: UIPanGestureRecognizer) {
        handleGestureAction(gesture: gesture)
    }
    
    @IBAction func onPanGestureView3(_ gesture: UIPanGestureRecognizer) {
        handleGestureAction(gesture: gesture)
    }
    
    @IBAction func onPanGestureView4(_ gesture: UIPanGestureRecognizer) {
        handleGestureAction(gesture: gesture)
    }
    
    @IBAction func onPanGestureView5(_ gesture: UIPanGestureRecognizer) {
        handleGestureAction(gesture: gesture)
    }
}

