//
//  BVIew.swift
//  Award Apps
//
//  Created by Rizki Yusnil on 23/12/19.
//  Copyright © 2019 Rizki Yusnil. All rights reserved.
//

import UIKit

class BView: NSObject {
    
    static func setRadius(vw:UIView, rad:CGFloat?=5){
        vw.layer.masksToBounds = true
        vw.layer.cornerRadius  = rad!
    }
    
    static func setShadow(vw:UIView, bounds: CGRect, scale: Bool = true, rad: CGFloat = 3){
        vw.layer.masksToBounds      = false
        vw.layer.shadowColor        = UIColor.darkGray.cgColor
        vw.layer.shadowOpacity      = 0.5
        vw.layer.shadowOffset       = CGSize(width: 2, height: 2)
        vw.layer.shadowRadius       = rad
        
        vw.layer.shadowPath         = UIBezierPath(rect: bounds).cgPath
        vw.layer.shouldRasterize    = true
        vw.layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    static func setBorder(vw: UIView, color: UIColor? = .darkGray, width: CGFloat? = 1){
        vw.layer.borderWidth = width ?? 1
        vw.layer.borderColor = color?.cgColor
    }
    
    static func bounds()->CGRect{
        return UIScreen.main.bounds
    }
    
    static func getHeight()->CGFloat{
        return bounds().height
    }
    
    static func getWidht()->CGFloat{
        return bounds().width
    }
    
    static var hasTopNotch: Bool {
        if #available(iOS 11.0,  *) {
            return UIApplication.shared.delegate?.window??.safeAreaInsets.top ?? 0 > 20
        }
        
        return false
    }
    
    static func createGradientLayer(vw: UIView, colors: [CGColor]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = vw.bounds
        gradientLayer.colors = colors
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        vw.layer.addSublayer(gradientLayer)
    }
}

extension UIButton
{
    func applyGradient(colors: [CGColor])
    {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = colors
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}

