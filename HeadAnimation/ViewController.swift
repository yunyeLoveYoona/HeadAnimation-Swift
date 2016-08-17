//
//  ViewController.swift
//  HeadAnimation
//
//  Created by 叶云 on 16/8/17.
//  Copyright © 2016年 叶云. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let headGroupView = HeadGroupView()
        headGroupView.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height * 0.3)
        for _ in 1...10 {
            let imageView = UIImageView()
            imageView.image = UIImage(named: "head.png")
            headGroupView.addSubview(imageView)
        }
        self.view.addSubview(headGroupView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

