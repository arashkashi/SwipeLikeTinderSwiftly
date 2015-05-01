//
//  Queue.swift
//  night.ly
//
//  Created by ArashHome on 30/04/15.
//  Copyright (c) 2015 Sunflower. All rights reserved.
//

import Foundation

class QNode<T>
{
    var item: T?
    var next: QNode?
}

class Queue<T> {
    
    private var top: QNode<T>!
    
    func enqueue(item: T) {
        
        if  top == nil {
            top = QNode()
            top.item = item
            return
        }
        
        var currentNode: QNode<T> = top
        
        while currentNode.next != nil {
            currentNode = currentNode.next!
        }
        
        var childNode = QNode<T>()
        childNode.item = item
        currentNode.next = childNode
    }
    
    func dequeue() -> T? {
        
        if top == nil {
            return nil
        }
        
        var item = top.item!
        
        if let nextItem = top.next {
            top = nextItem
        } else {
            top = nil
        }
        
        return item
    }
    
    func isEmpty() -> Bool {
        return top == nil
    }
    
    func first() -> T? {
        return top?.item
    }
    
    func last() -> T? {
        if isEmpty() { return nil}
        
        var currentNode: QNode<T> = top
        
        while currentNode.next != nil {
            currentNode = currentNode.next!
        }
        
        return currentNode.item
    }
    
}
