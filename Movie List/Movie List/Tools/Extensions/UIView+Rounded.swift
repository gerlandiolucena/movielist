//
//  UIView+Rounded.swift
//  Movie List
//
//  Created by Gerlandio da Silva Lucena on 12/7/16.
//  Copyright © 2016 Gerlandio da Silva Lucena. All rights reserved.
//

import UIKit

@IBDesignable extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var semiCircleBottom: Bool {
        get{
            return self.semiCircleBottom
        }
        set {
            if newValue {
                
                let circlePath = UIBezierPath.init(arcCenter: CGPoint(x: bounds.size.width*0.25, y: 0.0), radius: bounds.size.width*0.3, startAngle: 0.0, endAngle: CGFloat(2.0 * Double.pi), clockwise: true)
                circlePath.lineWidth = 2
                circlePath.stroke()
                let circleShape = CAShapeLayer()
                circleShape.path = circlePath.cgPath
                layer.mask = circleShape
            } else {
                layer.mask = nil
            }
        }
    }
    
    @IBInspectable var fullCircleBottom: Bool {
        get{
            return self.fullCircleBottom
        }
        set {
            if newValue {
                cornerRadius = bounds.size.width/2
            } else {
                cornerRadius = 0
            }
        }
    }
    
    @IBInspectable var borderWidth: CGFloat{
        get {
            return layer.borderWidth
        }
        set{
            layer.borderWidth = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderColor: UIColor?{
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set{
            layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable var shadowOffset: CGSize{
        get {
            return layer.shadowOffset
        }
        set{
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable var dashedBorder: Bool{
        get {
            return self.dashedBorder
        } set(newValue) {
            if newValue {
                addDashedBorder()
            } else {
                self.layer.sublayers?.forEach({$0.removeFromSuperlayer()})
            }
        }
    }
    
    @IBInspectable var backgroundBorder: BackgroundPattern {
        get {
            return self.backgroundBorder
        } set(newValue) {
            if newValue  == BackgroundPattern.Gray{
                addGrayDotRepead()
            } else {
                addWhiteDotRepead()
            }
        }
    }
    
    @IBInspectable var shadowOpacity: Float{
        get {
            return layer.shadowOpacity
        }
        set{
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable var shadowColor: UIColor?{
        get {
            return  UIColor(cgColor: layer.shadowColor!)
        }
        set{
            layer.shadowColor = newValue?.cgColor
        }
    }
}

import UIKit

extension UIView {
    
    func round(corners: UIRectCorner, radius: CGFloat) {
        let _ = newRound(corners: corners, radius: radius)
    }
    
    func round(corners: UIRectCorner, radius: CGFloat, borderColor: UIColor, borderWidth: CGFloat) {
        let mask = newRound(corners: corners, radius: radius)
        addBorder(mask: mask, borderColor: borderColor, borderWidth: borderWidth)
    }
    
    func fullyRound(diameter: CGFloat, borderColor: UIColor, borderWidth: CGFloat) {
        layer.masksToBounds = true
        layer.cornerRadius = diameter / 2
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor;
    }
    
}

extension UIView {
    
    func addDashedBorder() {
        let color = UIColor.white.cgColor
        
        let shapeLayer:CAShapeLayer = CAShapeLayer()
        let frameSize = self.frame.size
        let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)
        
        shapeLayer.bounds = shapeRect
        shapeLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height/2)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = color
        shapeLayer.lineWidth = 2
        shapeLayer.lineJoin = kCALineJoinRound
        shapeLayer.lineDashPattern = [1,2]
        shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: 5).cgPath
        
        self.layer.addSublayer(shapeLayer)
    }
    
    func addWhiteDotRepead() {
        self.backgroundColor = UIColor(patternImage: UIImage(named: "ponto_branco") ?? UIImage())
    }
    
    func addGrayDotRepead() {
        self.backgroundColor = UIColor(patternImage: UIImage(named: "ponto_cinza") ?? UIImage())
    }
}

private extension UIView {
    
    func newRound(corners: UIRectCorner, radius: CGFloat) -> CAShapeLayer {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
        return mask
    }
    
    func addBorder(mask: CAShapeLayer, borderColor: UIColor, borderWidth: CGFloat) {
        let borderLayer = CAShapeLayer()
        borderLayer.path = mask.path
        borderLayer.fillColor = UIColor.clear.cgColor
        borderLayer.strokeColor = borderColor.cgColor
        borderLayer.lineWidth = borderWidth
        borderLayer.frame = bounds
        layer.addSublayer(borderLayer)
    }
    
}
