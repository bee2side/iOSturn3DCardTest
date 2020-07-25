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
    var isOn = false
    var cardImage = UIImage(named: "kakaounit_front")
    var nameOne: String = "kakaounit_front"
    var nameTwo: String = "kakaounit_back"

    @IBOutlet weak var btnCard: UIButton!
    var transform = CATransform3DIdentity
    var transDegree: Double = 0
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btnCard.layer.transform = self.transform
        cardFlip()
    }
    
    func cardFlip() {
        transform.m34 = 1.0 / 500.0
        if isOn {
            nameTwo = "kakaounit_front"
            nameOne = "kakaounit_back"
        } else {
            nameOne = "kakaounit_front"
            nameTwo = "kakaounit_back"
        }
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
            self.transDegree = 90
            self.transform = CATransform3DRotate(self.transform, CGFloat(self.transDegree * Double.pi / 180), 0, 1, 0)
            self.btnCard.layer.transform = self.transform
            self.cardImage = UIImage(named: self.nameOne)
            self.btnCard.setImage(self.cardImage, for: .normal)
        }, completion: { (_) in
            UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
                self.transDegree = 90
                self.transform = CATransform3DRotate(self.transform, CGFloat(self.transDegree * Double.pi / 180), 0, 1, 0)
                self.btnCard.layer.transform = self.transform
                self.cardImage = UIImage(named: self.nameTwo)
                self.btnCard.setImage(self.cardImage, for: .normal)
            }, completion: { (_) in
                UIView.animate(withDuration: 0.15, delay: 0, options: .curveLinear, animations: {
                    self.transDegree = 10
                    self.transform = CATransform3DRotate(self.transform, CGFloat(self.transDegree * Double.pi / 180), 0, 1, 0)
                    self.btnCard.layer.transform = self.transform
                    }, completion: { (_) in
                    UIView.animate(withDuration: 0.15, delay: 0, options: .curveLinear, animations: {
                        self.transDegree = -10
                        self.transform = CATransform3DRotate(self.transform, CGFloat(self.transDegree * Double.pi / 180), 0, 1, 0)
                        self.btnCard.layer.transform = self.transform
                    })
                })
            })
        })
        /*
        UIView.animateKeyframes(withDuration: 1.5, delay: 0, animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.5, animations: {
                self.transDegree = 90
                self.transform = CATransform3DRotate(self.transform, CGFloat(self.transDegree * Double.pi / 180), 0, 1, 0)
                self.btnCard.layer.transform = self.transform
                self.cardImage = UIImage(named: "kakaounit_front")
                self.btnCard.setImage(self.cardImage, for: .normal)
            })
            UIView.addKeyframe(withRelativeStartTime: 1/3, relativeDuration: 0.5, animations: {
                self.transDegree = 90
                self.transform = CATransform3DRotate(self.transform, CGFloat(self.transDegree * Double.pi / 180), 0, 1, 0)
                self.btnCard.layer.transform = self.transform
            })
            UIView.addKeyframe(withRelativeStartTime: 2/3, relativeDuration: 0.25, animations: {
                self.transDegree = 5
                self.transform = CATransform3DRotate(self.transform, CGFloat(self.transDegree * Double.pi / 180), 0, 1, 0)
                self.btnCard.layer.transform = self.transform
            })
            UIView.addKeyframe(withRelativeStartTime: 2.5/3, relativeDuration: 0.25, animations: {
                self.transDegree = -5
                self.transform = CATransform3DRotate(self.transform, CGFloat(self.transDegree * Double.pi / 180), 0, 1, 0)
                self.btnCard.layer.transform = self.transform
                self.cardImage = UIImage(named: "kakaounit_back")
                self.btnCard.setImage(self.cardImage, for: .normal)
            })
        }, completion: nil)
         */
        /*
        UIView.animateKeyframes(withDuration: 0.5, delay: 0.5, options: .calculationModeCubic, animations: {
            self.btnCard.layer.transform = self.transform
            self.cardImage = UIImage(named: "kakaounit_back")
            self.btnCard.setImage(self.cardImage, for: .normal)
        }, completion: nil)
        */
    }


    @IBAction func btnFlip(_ sender: Any) {
        if isOn {
            isOn = false
            cardFlip()
        } else {
            isOn = true
            cardFlip()
        }
        
        /*
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
 */
    }
    
}

