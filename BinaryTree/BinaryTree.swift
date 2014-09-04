//
//  BinaryTree.swift
//  BinaryTree
//
//  Created by Dan Hoang on 9/3/14.
//  Copyright (c) 2014 Dan Hoang. All rights reserved.
//

import Foundation

class BinarySearchTree {
    
    var root : Node!
    var numNodes = 0
    var numRows = 0
    
    init() {
        
    }
    init(value : Int) {
        self.root = Node(value: value)
        self.numRows = 1
        self.numNodes++
    }
    
    func addValue(value : Int) {
        var newNode = Node(value: value)
        //first thing to check:
        if self.root == nil {
            self.root = newNode
            println("\(self.root.value), row: \(self.root.rowNum), parent: \(self.root.parent)")
        }
        else {
            //the root already knows to check conditions.
            self.root!.addNode(newNode)
        }
        self.numNodes++
        //new node has a row. Make sure to update numRows:
        self.numRows = newNode.rowNum + 1
        //now make sure numNodes
    }
    
    func findNodeForValue(value : Int) -> Node {
        var foundNode = self.findValue(value, forNode: self.root)
        return foundNode!
    }
    
    func findValue(value: Int, forNode node: Node?) -> Node? {
        if node != nil {
            if value == node!.value {
                return node
            }
            else {
                //check if it's less than:
                if value < node!.value {
                    return self.findValue(value, forNode: node!.leftNode)
                }
                else if value > node!.value {
                    return self.findValue(value, forNode: node!.rightNode)
                }
            }
        }
        //value does not exist.
        return nil
    }
    
    func reBalance() {
        
        //at very end of function:
        self.numRows--
    }
}

class Node {
    
    var value : Int
    var leftNode : Node?
    var rightNode : Node?
    var leftHeight = 0
    var rightHeight = 0
    var parent : Node?
    var rowNum : Int
    var isLeftChild : Bool!
    
    init(value: Int) {
        self.value = value
        self.rowNum = 0
    }
    
    func addNode(newNode : Node) {
        if newNode.value < self.value {
            if self.leftNode == nil {
                //due to recursion, this may change:
                newNode.isLeftChild = true
                //this command completes the adding:
                self.leftNode = newNode
                self.leftNode?.rowNum = self.rowNum + 1
                self.leftNode?.parent = self
            }
            else {
                leftNode?.addNode(newNode)
            }
        }
            //no else. if equal, then don't add it.
        else if newNode.value > self.value {
            //due to recursion, this may change:
            newNode.isLeftChild = false
            if self.rightNode == nil {
                //this command completes the adding:
                self.rightNode = newNode
                self.rightNode?.rowNum = self.rowNum + 1
                self.rightNode?.parent = self
            }
            else {
                rightNode?.addNode(newNode)
            }
        }
        //now adjust all the properties of the nodes:
        newNode.leftHeight = 0
        newNode.rightHeight = 0
        //use the exact same conditions as above:
        if newNode.value < self.value {
//            self.leftHeight++
        }
        else if newNode.value > self.value {
//            self.rightHeight++
        }
        //recurse up to all parents:
        println(self.value)
        self.updateParentHeight(newNode.rowNum)
    }
    
    func updateParentHeight(rowNum : Int) {
        if let theParent = self.parent {
            if self.isLeftChild == true {
                println(self.value)
                theParent.updateOwnHeight(rowNum, isLeft: true)
            }
            else {
                println(self.value)
                theParent.updateOwnHeight(rowNum, isLeft: false)
            }
            //now the continue the recursion:
            println(self.value)
            theParent.updateParentHeight(rowNum)
            println("\(self.value), increments: \(theParent.leftHeight) \(theParent.rightHeight)")
            println()
        }
        else {
            println(self.value)
            println()
        }
    }
    
    private func updateOwnHeight(rowNum: Int, isLeft : Bool) {
        println(self.value)
        if isLeft == true {
            var heightToBecome = rowNum - self.leftHeight
            if self.leftHeight < heightToBecome {
                println("\(rowNum) - \(self.leftHeight)")
                self.leftHeight = heightToBecome
            }
        }
        else {
            var heightToBecome = rowNum - self.rightHeight
            if self.rightHeight < heightToBecome {
                println("\(rowNum) - \(self.rightHeight)")
                self.rightHeight = heightToBecome
            }
        }
    }
    
    func checkNodes() {
        if self.value > rightNode?.value {
            self.parent = rightNode
            rightNode?.leftNode = self
        }
    }
    //tell each parent to increment its branch height.
}