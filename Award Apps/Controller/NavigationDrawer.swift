//
//  NavigayionDrawer.swift
//  Award Apps
//
//  Created by Rizki Yusnil on 23/12/19.
//  Copyright © 2019 Rizki Yusnil. All rights reserved.
//

import UIKit

protocol NavigationDrawerDelegate {
    func tapHome()
    func tapCards()
    func tapProfile()
    func tapLogout()
}

class NavigationDrawer: UIView {

    @IBOutlet weak var btnOverlay: UIButton!
    
    var delegate: NavigationDrawerDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let bundle = Bundle(for: type(of: self))
        let view = bundle.loadNibNamed("NavigationDrawer", owner: self, options: nil)?.first as! UIView
            view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            view.frame = bounds
            addSubview(view)
    }
    
    @IBAction func btnOverlayAction(_ sender: Any) {
        fadeOut()
    }
    
    @IBAction func homeTap(_ sender: Any) {
        fadeOut()
    }
    
    @IBAction func cardsTap(_ sender: Any) {
    }
    
    @IBAction func profileTap(_ sender: Any) {
    }
    
    @IBAction func logoutTap(_ sender: Any) {
        delegate?.tapLogout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fadeIn(duration: TimeInterval = 0.2) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 1.0
        })
    }
    
    func fadeOut(duration: TimeInterval = 0.2) {
        UIView.animate(withDuration: duration, animations: {
            self.alpha = 0.0
        })
    }

}
