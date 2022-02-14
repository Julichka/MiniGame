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
        animateViewOpacity()
        animateViewSize()
    }
    
    func animateViewSize() {
        let newSize = frame.width * 1.2 //increase size of the view for 20% when views merged
        
        frame = CGRect(x: frame.minX, y: frame.minY, width: newSize, height: newSize)
        
        makeViewAsCircle()
    }
    
    func animateViewOpacity() {
        let newAlpha = self.alpha + 0.1 //increase opacity for 10% when views merged
        UIView.animate(withDuration: 2.0, animations: {
            self.alpha = newAlpha
        })
    }
    
    func setCustomView() {
        workingView = getFromXib()
        workingView.frame = bounds
        workingView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        makeViewAsCircle()
        
        addSubview(workingView)
    }
}
