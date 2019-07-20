//
//  ViewController.swift
//  viewcontrol
//
//  Created by MIN-LUN CHAN on 2019/7/20.
//  Copyright © 2019 daniel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer:Timer!
    var views=[UIView]()
    var intpoint=0
    var intcounter=0
    var blnrate=false
    var speed=1.0
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let myview=UIView()
//
//        myview.frame=CGRect(x: 0, y: 0, width: 300, height: 300)
//        myview.backgroundColor=UIColor.yellow
//        //myview.center=self.view.center
//
//        self.view.addSubview(myview)
        
//        let myview2=UIView()
//        myview2.frame=CGRect(x: 0, y: 0, width: 100, height: 100)
//        myview2.backgroundColor=UIColor.red
//        //myview2.center=self.view.center
//        self.view.addSubview(myview2)
        //self.view.bringSubviewToFront(myview2)
        
        
        //self.views=self.view.subviews
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let myview=UIView()
        
        myview.frame=CGRect(x: 0, y: 0, width: 300, height: 300)
        myview.backgroundColor=UIColor.red
        myview.center=self.view.center
        

        
        self.view.addSubview(myview)
        
        timer=Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(move2(_:)), userInfo: myview, repeats: true)
//        timer=Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true, block: {
//            (timer) in self.move(myview)
//        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    
    @objc func move2(_ targetView:UIView){
        let actionView=timer.userInfo as! UIView
        let angle = Double(self.intcounter)*speed * Double.pi / 180
        actionView.transform = CGAffineTransform(rotationAngle: CGFloat(angle))
        if blnrate==true{
            intcounter += 4
            actionView.backgroundColor=UIColor.black
        }else{
            intcounter -= 4
            actionView.backgroundColor=UIColor.blue
        }
    }
    
    func move(_ targetView:UIView){

        let angle = Double(self.intcounter)*speed * Double.pi / 180
        targetView.transform = CGAffineTransform(rotationAngle: CGFloat(angle))
        if blnrate==true{
            intcounter += 4
            targetView.backgroundColor=UIColor.black
        }else{
            intcounter -= 4
            targetView.backgroundColor=UIColor.blue
        }
        //print(speed)

    }


    @IBAction func sliderAction(_ sender: UISlider) {
        speed += Double(sender.value)
        
        
    }
    
    @IBAction func segmentAction(_ sender: UISegmentedControl) {
        switch (sender.selectedSegmentIndex) {
        case 0:
           blnrate=true
        case 1:
           blnrate=false
        case 2:
           speed=8
        case 3:
           speed=1
        default:
            blnrate=true
            speed=1
        }
//        if sender.selectedSegmentIndex==0{
//            blnrate=true
//        }
//        else{
//            blnrate=false
//        }
    }
}

