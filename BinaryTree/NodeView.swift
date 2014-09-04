//
//  NodeView.swift
//  BinaryTree
//
//  Created by Dan Hoang on 9/3/14.
//  Copyright (c) 2014 Dan Hoang. All rights reserved.
//

import UIKit

class NodeView: UIView {

    var selfNode : Node
    var textLabel = UILabel()
    
    init(node : Node, frame : CGRect) {
        self.selfNode = node
        self.textLabel.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        self.textLabel.text = "\(self.selfNode.value)"
        super.init(frame : frame)
        self.layer.cornerRadius = self.frame.width / 2
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.redColor().CGColor
        self.addSubview(self.textLabel)
    }
    
    
    
    required init(coder aDecoder: NSCoder) {
        var notNode = Node(value: 0)
        self.selfNode = notNode
        super.init(coder: aDecoder)
    }
    

}
