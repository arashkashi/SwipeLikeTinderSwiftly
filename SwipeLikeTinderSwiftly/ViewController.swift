//
//  ViewController.swift
//  SwipeLikeTinderSwiftly
//
//  Created by Arash K. on 01/05/15.
//  Copyright (c) 2015 Arash K. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        var swipablecontainer = SwipableViewContainer(frame: self.view.frame)
        self.view.addSubview(swipablecontainer)
        
        var firstcardView = UIView(frame: CGRectMake(0, 0, 100, 100))
        firstcardView.backgroundColor = UIColor.redColor()
        
        var secondCardView = UIView(frame: CGRectMake(0, 0, 100, 100))
        secondCardView.backgroundColor = UIColor.blueColor()
        
        var thirdCardView = UIView(frame: CGRectMake(0, 0, 100, 100))
        thirdCardView.backgroundColor = UIColor.orangeColor()
        
        swipablecontainer.enqueue(firstcardView)
        swipablecontainer.enqueue(secondCardView)
        swipablecontainer.enqueue(thirdCardView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

