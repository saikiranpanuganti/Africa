//
//  View+Extension.swift
//  ChromeCastProject
//
//  Created by SaiKiran Panuganti on 05/06/21.
//

import UIKit

extension UIView {
    func addGradient(colors: [CGColor]) {
        if layer.sublayers?.first?.isKind(of: CAGradientLayer.self) ?? false {
            layer.sublayers?.first?.removeFromSuperlayer()
        }
        
        let gradient: CAGradientLayer = CAGradientLayer()

        gradient.colors = colors
        gradient.locations = [0.0 , 0.8]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.frame = bounds
        layer.insertSublayer(gradient, at: 0)
    }
    
    func animateAppearance() {
        let scale:CGFloat = 0.001
        self.transform = CGAffineTransform(a: scale, b: 0.0, c: 0.0, d: scale, tx: 0, ty: -50)
        
        UIView.animate(withDuration: 0.15, delay: 0, options: UIView.AnimationOptions(), animations: { () -> Void in
            let scale:CGFloat = 1.25
            self.transform = CGAffineTransform(a: scale, b: 0.0, c: 0.0, d: scale, tx: 0, ty: 2)
        }, completion: { (finished: Bool) -> Void in
            UIView.animate(withDuration: 0.2, delay: 0, options: UIView.AnimationOptions(), animations: { () -> Void in
                let scale:CGFloat = 0.75
                self.transform = CGAffineTransform(a: scale, b: 0.0, c: 0.0, d: scale, tx: 0, ty: -2)
            }, completion: { (finished: Bool) -> Void in
                UIView.animate(withDuration: 0.1, delay: 0, options: UIView.AnimationOptions(), animations: { () -> Void in
                    let scale:CGFloat = 1.0
                    self.transform = CGAffineTransform(a: scale, b: 0.0, c: 0.0, d: scale, tx: 0, ty: 0)
                }, completion: { (finished: Bool) -> Void in
                })
            })
        })
    }
    
    func addShadow(to edges: [UIRectEdge], radius: CGFloat = 3.0, opacity: Float = 0.6, color: CGColor = UIColor.black.cgColor) {
        removeAllShadows()
        
        let fromColor = color
        let toColor = UIColor.clear.cgColor
        let viewFrame = self.frame
        for edge in edges {
            let gradientLayer = CAGradientLayer()
            gradientLayer.colors = [fromColor, toColor]
            gradientLayer.opacity = opacity

            switch edge {
            case .top:
                gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
                gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)
                gradientLayer.frame = CGRect(x: 0.0, y: 0.0, width: viewFrame.width, height: radius)
            case .bottom:
                gradientLayer.startPoint = CGPoint(x: 0.5, y: 1.0)
                gradientLayer.endPoint = CGPoint(x: 0.5, y: 0.0)
                gradientLayer.frame = CGRect(x: 0.0, y: viewFrame.height - radius, width: viewFrame.width, height: radius)
            case .left:
                gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
                gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
                gradientLayer.frame = CGRect(x: 0.0, y: 0.0, width: radius, height: viewFrame.height)
            case .right:
                gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.5)
                gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.5)
                gradientLayer.frame = CGRect(x: viewFrame.width - radius, y: 0.0, width: radius, height: viewFrame.height)
            default:
                break
            }
            self.layer.addSublayer(gradientLayer)
        }
    }

    func removeAllShadows() {
        if let sublayers = self.layer.sublayers, !sublayers.isEmpty {
            for sublayer in sublayers {
                sublayer.removeFromSuperlayer()
            }
        }
    }
}
