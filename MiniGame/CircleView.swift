//
//  CircleView.swift
//  MiniGame
//
//  Created by Yuliia Khrupina on 2/5/22.
//

import UIKit

class CircleView: UIView {
    
    var xibName = "Circle"
    var workingView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setCustomView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setCustomView()
    }
    
    func getFromXib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let xib = UINib(nibName: xibName, bundle: bundle)
        let view = xib.instantiate(withOwner: self, options: nil).first as! UIView
        
        return view
    }
    
    func makeViewAsCircle() {
        workingView.layer.cornerRadius = workingView.layer.bounds.width / 2
        workingView.clipsToBounds = true
    }
    
    func updateAfterMerging() {
        animateViewColor()
        animateViewSize()
    }
    
    func animateViewSize() {
        let newSize = frame.width * 1.2 //increase size of the view for 20% when views merged
        UIView.animate(withDuration: 2.0, animations: {
            self.frame = CGRect(x: self.frame.minX, y: self.frame.minY, width: newSize, height: newSize)
            self.makeViewAsCircle()
        })
    }
    
    func animateViewColor() {
        UIView.animate(withDuration: 1.0, animations: {
            self.workingView.backgroundColor = self.getRandomColor()
        })
    }
    
    func setCustomView() {
        workingView = getFromXib()
        workingView.frame = bounds
        workingView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        workingView.backgroundColor = getRandomColor()
        
        makeViewAsCircle()
        
        addSubview(workingView)
    }
    
    func getRandomColor() -> UIColor {
        let red   = CGFloat((arc4random() % 256)) / 255.0
        let green = CGFloat((arc4random() % 256)) / 255.0
        let blue  = CGFloat((arc4random() % 256)) / 255.0
        let alpha = CGFloat(1.0)
        
        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
}
