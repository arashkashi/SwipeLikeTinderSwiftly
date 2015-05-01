//
//  SwipableViewContainer.swift
//  SwipeLikeTinderSwiftly
//
//  Created by Arash K. on 01/05/15.
//  Copyright (c) 2015 Arash K. All rights reserved.
//

import Foundation
import UIKit

class SwipableViewContainer: UIView, SwipableViewDelegate {
    
    private let CARD_WIDTH: CGFloat = 290
    private let CARD_HEIGHT: CGFloat = 386
    
    private var cardQueue: Queue<SwipableView> = Queue()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        super.layoutSubviews()
        
        setupView()
    }
    
    private func cardFrame() -> CGRect {
        return CGRectMake((self.frame.size.width - CARD_WIDTH)/2, (self.frame.size.height - CARD_HEIGHT)/2, CARD_WIDTH, CARD_HEIGHT)
    }
    
    func enqueue(card: UIView) {
        var swipableView = SwipableView(frame: cardFrame(), content: card)
        
        if cardQueue.isEmpty() {
            addSubview(swipableView)
        }
        else {
            insertSubview(swipableView, belowSubview: cardQueue.last()!)
        }
        
        swipableView.delegate = self
        cardQueue.enqueue(swipableView)
    }
    
    func viewSwipedLeft(swippableView: SwipableView) {
        swippableView.removeFromSuperview()
        
        cardQueue.dequeue()
    }
    
    func viewSwipedRight(swippableView: SwipableView) {
        swippableView.removeFromSuperview()
        
        cardQueue.dequeue()
    }
    
    private func setupView() {
        backgroundColor = UIColor.grayColor()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}