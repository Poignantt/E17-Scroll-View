//
//  ViewController.swift
//  E17 Scroll View
//
//  Created by Koorosh Khadembashi on 2/12/16.
//  Copyright © 2016 Atiz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    // for whatever reason scrollView.frame.size.width is working although this does not have to always be the case. The reason being that the scrollView may not initiate before it is called leaving the value as 0. It is always better to use viewDidAppear
   
    
    @IBOutlet weak var scrollView: UIScrollView!
    var images = [UIImageView]()
    var swipe = UISwipeGestureRecognizer()
    let directionArray = [UISwipeGestureRecognizerDirection.right,UISwipeGestureRecognizerDirection.left,UISwipeGestureRecognizerDirection.up,UISwipeGestureRecognizerDirection.down]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var newX: CGFloat = 0.0
        
        for x in 0...3{
            swipe = UISwipeGestureRecognizer(target: self, action: #selector(self.swiped(_:)))
            swipe.direction = directionArray[x]
            view.addGestureRecognizer(swipe)
            
            if x <= 2 {
            let image = UIImage(named: "icon\(x).png")
            let imageView = UIImageView(image: image)
            images.append(imageView)
            
            newX = scrollView.frame.size.width * CGFloat(x) + scrollView.frame.size.width / 2 - 75
            
            scrollView.addSubview(imageView)
            
            imageView.frame = CGRect(x: newX, y: scrollView.frame.size.height / 2 - 75, width: 150, height: 150)
            }
        }
        
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width * CGFloat(images.count), height: scrollView.frame.size.height)
        scrollView.clipsToBounds = false
        print(scrollView.contentOffset.x)
        
    }
    
    func swiped(_ gesture: UIGestureRecognizer) {
        
        let offsets:CGFloat = (CGFloat(images.count) - 1) * 220
        var dynamicOffset: CGFloat = scrollView.contentOffset.x
        
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            
            switch swipeGesture.direction {
                
            case UISwipeGestureRecognizerDirection.right:

                if scrollView.contentOffset.x > 0 {
                    dynamicOffset -= 220
                    scrollView.setContentOffset(CGPoint(x: dynamicOffset, y: 0), animated: true)
                }
                print("right")
                
            case UISwipeGestureRecognizerDirection.left:
                
                if scrollView.contentOffset.x < offsets {
                    dynamicOffset += 220
                    scrollView.setContentOffset(CGPoint(x: dynamicOffset, y: 0), animated: true)
                }
                print("left")
                
            case UISwipeGestureRecognizerDirection.up:
                
                print(scrollView)
                
            default:
                print("other swipe")
            }
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("shit is appearing")
    }
    
}

