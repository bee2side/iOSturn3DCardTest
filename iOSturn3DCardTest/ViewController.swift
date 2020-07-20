//
//  ViewController.swift
//  iOSturn3DCardTest
//
//  Created by Doris on 2020/07/20.
//  Copyright © 2020 kakao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var isOpen = false
    var cardImage = UIImage(named: "kakaounit_front")
    
    @IBOutlet weak var btnCard: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let rotation = CATransform3DMakeRotation(CGFloat(30.0 * Double.pi / 180.0), 0, 0, 0)
        self.btnCard.layer.transform = CATransform3DTranslate(rotation, 0, 20, -30)
        //self.btnCard.layer.anchorPoint = CGPointMake(0.5, 0)
    }

    @IBAction func btnFlip(_ sender: Any) {
        
        if isOpen {
            isOpen = false
            let cardImage = UIImage(named: "kakaounit_front")
            btnCard.setImage(cardImage, for: .normal)
            UIView.animateKeyframes(withDuration: 0.5, delay: 0, options: .calculationModeCubic, animations: {
//                self.btnCard.layer.transform = CATransform3DTranslate(rotation, 0, 0, 0)
            }, completion: nil)
        } else {
            isOpen = true
            let cardImage = UIImage(named: "kakaounit_back")
            btnCard.setImage(cardImage, for: .normal)
            UIView.transition(with: btnCard, duration: 0.3, options: .transitionFlipFromRight, animations: nil, completion: nil)
        }
    }
    
}

