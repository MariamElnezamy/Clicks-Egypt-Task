//
//  Extenstions.swift
//  Clicks Egypt Task
//
//  Created by Admin on 26/08/2021.
//

import UIKit

extension UIView {
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        
        layer.mask = mask
        self.clipsToBounds = true
    }
    func getShadow(yourView: UIView) {
        yourView.layer.shadowColor = UIColor.black.cgColor
        yourView.layer.shadowOpacity = 1
        yourView.layer.shadowOffset = .zero
        yourView.layer.shadowRadius = 10
        yourView.layer.shadowPath = UIBezierPath(rect: yourView.bounds).cgPath
    }
    func addTopBorder(color: CGColor, heightBorder: Float) {
       let topBorder = CALayer()
        topBorder.frame = CGRect(x: 0.0, y: 0.0, width: self.frame.size.width, height: CGFloat(heightBorder))
       topBorder.backgroundColor = color
       self.layer.addSublayer(topBorder)
    }
}

extension UIViewController {
    func Alert(_ title:String ,_ message:String){
      let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
      alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
      self.present(alert, animated: true)
    }
}

extension UITextField {
    
    //MARK:- Set Image on the right of text fields
    
    func setupRightImage(imageName:String){
        let imageView = UIImageView(frame: CGRect(x: self.frame.width - 25, y: 10, width: 20, height: 20))
        imageView.image = UIImage(named: imageName)
        rightViewMode = .always
        tintColor = .lightGray
        addSubview(imageView)

    }
}
