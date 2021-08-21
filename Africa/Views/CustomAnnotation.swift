//
//  CustomAnnotation.swift
//  Africa
//
//  Created by SaiKiran Panuganti on 19/08/21.
//

import UIKit
import MapKit


class CustomPointAnnotationView: MKAnnotationView {
    var animationView: UIView = UIView()
    
    init(annotation: MKAnnotation?, reuseIdentifier: String?, image: String) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        
        addBackgroundView(image: image)
        animateBorder()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addBackgroundView(image: String) {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        self.addSubview(view)
        
        
        animationView = UIView(frame: CGRect(x: 25, y: 25, width: 50, height: 50))
        animationView.layer.borderWidth = 2.5
        animationView.layer.borderColor = Colors.shared.orangeAppColorWithAlpha.cgColor
        animationView.layer.cornerRadius = animationView.frame.width/2
        view.addSubview(animationView)
        
        let imageView = UIImageView(frame: CGRect(x: 25, y: 25, width: 50, height: 50))
        imageView.image = UIImage(named: image)
        imageView.layer.borderWidth = 2.0
        imageView.layer.borderColor = Colors.shared.orangeAppColor.cgColor
        imageView.layer.cornerRadius = imageView.frame.width/2
        imageView.clipsToBounds = true
        view.addSubview(imageView)
    }
    
    func animateBorder() {
        Timer.scheduledTimer(withTimeInterval: 1.7, repeats: true) { timer in
            self.animationView.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.animationView.layer.borderColor = Colors.shared.orangeAppColorWithAlpha.cgColor
            self.animateBorderColor(view: self.animationView, toColor: Colors.shared.clear, duration: 1.5)
            self.animateViewFrame(view: self.animationView, duration: 1.5)
        }
    }
    
    func animateBorderColor(view: UIView, toColor: UIColor, duration: Double) {
        let animation:CABasicAnimation = CABasicAnimation(keyPath: "borderColor")
        animation.fromValue = view.layer.borderColor
        animation.toValue = toColor.cgColor
        animation.duration = duration
        view.layer.add(animation, forKey: "borderColor")
        view.layer.borderColor = toColor.cgColor
    }
    
    func animateViewFrame(view: UIView, duration: Double) {
        UIView.animate(withDuration: 2.0) {
            view.transform = CGAffineTransform(scaleX: 1.6, y: 1.6)
        }
    }
}

