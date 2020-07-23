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
    var transform = CATransform3DIdentity
    var transDegree: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        transform.m34 = 1.0 / 500.0
        transDegree = 180
        transform = CATransform3DRotate(transform, CGFloat(transDegree * Double.pi / 180), 0, 1, 0)
        UIView.animateKeyframes(withDuration: 0.5, delay: 0.5, options: .calculationModeCubic, animations: {
            self.btnCard.layer.transform = self.transform
//            self.cardImage = UIImage(named: "kakaounit_back")
//            self.btnCard.setImage(self.cardImage, for: .normal)
        }, completion: nil)
    }

    @IBAction func btnFlip(_ sender: Any) {
        
        if isOpen {
            isOpen = false
            let cardImage = UIImage(named: "kakaounit_front")
            btnCard.setImage(cardImage, for: .normal)
            transDegree = 90
            self.transform = CATransform3DRotate(self.transform, CGFloat(self.transDegree * Double.pi / 180), 0, 1, 0)
            UIView.animateKeyframes(withDuration: 0.5, delay: 0, options: .calculationModeCubic, animations: {
                self.btnCard.layer.transform = self.transform
            }, completion: nil)
        } else {
            isOpen = true
            let cardImage = UIImage(named: "kakaounit_back")
            btnCard.setImage(cardImage, for: .normal)
            transDegree = 180
            self.transform = CATransform3DRotate(self.transform, CGFloat(self.transDegree * Double.pi / 180), 0, 1, 0)
            UIView.animateKeyframes(withDuration: 0.5, delay: 0, options: .calculationModeCubic, animations: {
                self.btnCard.layer.transform = self.transform
            }, completion: nil)
        }
    }
    
}

