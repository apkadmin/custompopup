//
//  CustomAlert.swift
//  LearnSnapKit
//
//  Created by annguyen on 8/24/20.
//  Copyright © 2020 Taof. All rights reserved.
//

import UIKit
class CustomAlert: UIView {
    
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var colView: UICollectionView!
    static let instance = CustomAlert()
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet var parentView: UIView!
    @IBOutlet weak var body: UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("CustomAlert", owner: self, options: nil)
        commonInit()
        alertView.layer.cornerRadius = 20
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
     private func commonInit() {
 

         parentView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
         parentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
     }
    enum AlertType {
           case success
           case failure
       }
    
    func showAlert(title: String, message: String, alertType: AlertType) {
        self.lblTitle.text = title
        self.body.text = message
        
        switch alertType {
        case .success:
           print("hoang thanh")
          
        case .failure:
           print("error")
        }
        
        UIApplication.shared.keyWindow?.addSubview(parentView)
    }
}
