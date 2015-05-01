//
//  SwipableView.swift
//  night.ly
//
//  Created by ArashHome on 30/04/15.
//  Copyright (c) 2015 Sunflower. All rights reserved.
//

import Foundation
import UIKit


protocol SwipableViewDelegate
{
    func viewSwipedLeft(swippableView: SwipableView)
    func viewSwipedRight(swippableView: SwipableView)
}


class SwipableView: UIView {
    
    private var xFromCenter: CGFloat!
    private var yFromCenter: CGFloat!
    
    private var originalPoint: CGPoint!
    
    private let ROTATION_ANGLE: CGFloat = 3.14 / 8.0
    private let ROTATION_STRENGTH: CGFloat = 320
    private let ROTATION_MAX: CGFloat = 1
    private let SCALE_MAX: CGFloat = 0.93
    private let SCALE_SCTRENGHT: CGFloat = 4
    private let ACTION_MARGIN: CGFloat = 120
    
    var delegate: SwipableViewDelegate!
    
    init(frame: CGRect, content: UIView) {
        super.init(frame: frame)
        
        setupViewWithContent(content)
        setupPanGestureRecognizer()
    }
    
    func setupPanGestureRecognizer() {
        var panRecognizer = UIPanGestureRecognizer()
        panRecognizer.addTarget(self, action: "beingDragged:")
        addGestureRecognizer(panRecognizer)
        
    }
    
    func beingDragged(gr:UIPanGestureRecognizer){
        xFromCenter = gr.translationInView(self).x
        yFromCenter = gr.translationInView(self).y
        
        switch gr.state {
        case .Began:
            originalPoint = center
            break
        case .Changed:
            //%%% dictates rotation (see ROTATION_MAX and ROTATION_STRENGTH for details)
            var rotationStrength = min(xFromCenter / ROTATION_STRENGTH, ROTATION_MAX)
            
            //%%% degree change in radians
            var rotationalAngel = (CGFloat)(ROTATION_ANGLE * rotationStrength)
            
            //%%% amount the height changes when you move the card up to a certain point
            var scale = max(1 - abs(rotationStrength) / SCALE_SCTRENGHT, SCALE_MAX);
            
            //%%% move the object's center by center + gesture coordinate
            center = CGPointMake(self.originalPoint.x + xFromCenter, self.originalPoint.y + yFromCenter);
            
            //%%% rotate by certain amount
            var transform = CGAffineTransformMakeRotation(rotationalAngel);
            
            //%%% scale by certain amount
            var scaleTransform = CGAffineTransformScale(transform, scale, scale);
            
            //%%% apply transformations
            transform = scaleTransform;
            //            updateOverlay:xFromCenter];
            break
        case .Ended:
            afterSwipAction()
            break
        case .Possible:break;
        case .Cancelled:break;
        case .Failed:break;
            
        }
        
    }
    
    func rightAction() {
        var finishPoint = CGPointMake(500, 2*yFromCenter + self.originalPoint.y)
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.center = finishPoint
            }) { (success: Bool) -> Void in
                self.removeFromSuperview()
        }
        
        delegate.viewSwipedRight(self)
    }
    
    func leftAction() {
        var finishPoint = CGPointMake(-500, 2*yFromCenter + self.originalPoint.y)
        
        UIView.animateWithDuration(0.3, animations: { () -> Void in
            self.center = finishPoint
            }) { (success: Bool) -> Void in
                self.removeFromSuperview()
        }
        
        delegate.viewSwipedLeft(self)
    }
    
    func afterSwipAction() {
        if xFromCenter > ACTION_MARGIN {
            rightAction()
        } else if xFromCenter < -ACTION_MARGIN {
            leftAction()
        } else {
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.center = self.originalPoint
                self.transform = CGAffineTransformMakeRotation(0)
            })
        }
    }
    
    func setupViewWithContent(content: UIView) {
        content.layer.cornerRadius = 8
        layer.cornerRadius = 4;
        layer.shadowRadius = 3;
        layer.shadowOpacity = 0.2;
        layer.shadowOffset = CGSizeMake(1, 1);
        
        content.frame = bounds
        addSubview(content)
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
