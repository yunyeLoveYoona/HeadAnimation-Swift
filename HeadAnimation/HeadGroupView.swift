//
//  HeadGroupView.swift
//  HeadAnimation
//
//  Created by 叶云 on 16/8/17.
//  Copyright © 2016年 叶云. All rights reserved.
//

import Foundation
import UIKit

class HeadGroupView: UIView{
    let PADDING = 20
    var moveX = 0
    var centerPosition = 1
    var width , height : Int!
    var x : CGFloat!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        width = 0
        height = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func addSubview(view: UIView) {
        super.addSubview(view)
    }
    
    override func layoutSubviews() {
        move(0)
        super.layoutSubviews()
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if touches.count == 1{
            let touch = touches.first
            let previous  = touch?.locationInView(self)
            move(Int((x - (previous?.x)!) / 2))
            x = previous?.x
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if touches.count == 1{
            let touch = touches.first
            let previous  = touch?.locationInView(self)
            x = previous?.x
        }
    }
    
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let deviation = (moveX % (width / 2 - height / 6 - PADDING))
        if deviation > (width / 2 - height / 6 - PADDING) / 2{
            moveX = moveX + (width / 2 - height / 6 - PADDING - deviation)
        }else {
            moveX = moveX - deviation
        }
        move(0)
    }
    
    
    func move(x : Int){
        if width == 0{
            width = Int(frame.width)
            height = Int(frame.height)
        }
        moveX = moveX + x
        centerPosition = moveX / ((width - PADDING * 2) / 3) + 1
        var startX = PADDING - moveX
        let centerX = width / 2 - height / 6
        if startX < centerX && startX > 1 - self.subviews.count * (width / 3){
            for child in self.subviews {
                if startX > PADDING + height / 3 && startX < width - (PADDING + height / 3){
                    var sale = 0
                    if startX < centerX{
                        sale = (startX - PADDING) / 6
                    }else{
                        sale = ((width - PADDING) - startX) / 6
                    }
                    child.frame = CGRectMake(CGFloat(startX - sale), CGFloat(height / 3 - sale), CGFloat(height / 3 + sale * 2) , CGFloat(height / 3 + sale * 2))
                }else {
                    child.frame = CGRectMake(CGFloat(startX), CGFloat(height / 3), CGFloat(height / 3) , CGFloat(height / 3))
                }
                
                startX = startX + width / 2 - PADDING - height / 6
            }
        }
    }
    
}
