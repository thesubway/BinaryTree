//
//  ViewController.swift
//  BinaryTree
//
//  Created by Dan Hoang on 9/3/14.
//  Copyright (c) 2014 Dan Hoang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var BST = BinarySearchTree()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        BST.addValue(34)
        BST.addValue(12)
        BST.addValue(74)
        BST.addValue(100)
        BST.addValue(5)
        BST.addValue(10)
        BST.addValue(20)
        
        var searchNode = BST.findNodeForValue(34)
        println("\(searchNode.value),row: \(searchNode.rowNum) left: \(searchNode.leftHeight) right: \(searchNode.rightHeight)");
        println("Num rows: \(BST.numRows)")
        self.drawRoot(BST.root)
    }
    
    func drawRoot(rootNode : Node) {
        var rootFrame = CGRect(x: self.view.frame.width / 2, y: 60, width: 40, height: 40)
        var rootNode = NodeView(node: self.BST.root, frame: rootFrame)
        self.view.addSubview(rootNode)
        self.drawChildren(rootNode, length: CGFloat(self.view.frame.width / 4))
    }
    func drawChildren(rootNodeView : NodeView, length: CGFloat) {
        //start with left child:
        if rootNodeView.selfNode.leftNode != nil {
            //draw the line from self to it:
            var newX = (rootNodeView.frame.origin.x - length)
            var newY = (rootNodeView.frame.origin.y + 40)
            var newFrame = CGRect(x: rootNodeView.frame.origin.x - length, y: rootNodeView.frame.origin.y + 40, width:rootNodeView.frame.width, height: rootNodeView.frame.height)
            
            var newNode = NodeView(node: rootNodeView.selfNode.leftNode!, frame: newFrame)
            self.view.addSubview(newNode)
            self.drawChildren(newNode, length: length / 2)
        }
        if rootNodeView.selfNode.rightNode != nil {
            var newX = (rootNodeView.frame.origin.x + length)
            var newY = (rootNodeView.frame.origin.y + 40)
            var newFrame = CGRect(x: rootNodeView.frame.origin.x + length, y: rootNodeView.frame.origin.y + 40, width:rootNodeView.frame.width, height: rootNodeView.frame.height)
            
            var newNode = NodeView(node: rootNodeView.selfNode.rightNode!, frame: newFrame)
            self.view.addSubview(newNode)
            self.drawChildren(newNode, length: length / 2)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

