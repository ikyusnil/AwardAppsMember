//
//  ViewControllerFilter.swift
//  Award Apps
//
//  Created by Rizki Yusnil on 23/12/19.
//  Copyright © 2019 Rizki Yusnil. All rights reserved.
//

import UIKit

protocol ViewControllerFilterDelegate {
    func setFilter(price: Int, type: String)
}

class ViewControllerFilter: UIViewController {

    @IBOutlet weak var btnAll: UIButton!
    @IBOutlet weak var btnVouchers: UIButton!
    @IBOutlet weak var btnProductss: UIButton!
    @IBOutlet weak var btnOthers: UIButton!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var lblCurrentPrice: UILabel!
    @IBOutlet weak var lblFilterH: UILabel!
    @IBOutlet weak var lblFilterP: UILabel!
    @IBOutlet weak var btnClear: UIButton!
    @IBOutlet weak var btnTrueFilter: UIButton!
    
    var isAllCheck = false
    var isVouCheck = false
    var isProCheck = false
    var isOtherCheck = false
    
    var price = 0
    var type = ""
    
    var delegate: ViewControllerFilterDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
        setData()
    }
    
    @IBAction func btnClearAct(_ sender: Any) {
        isAllCheck = false
        isVouCheck = false
        isProCheck = false
        isOtherCheck = false
        
        btnAll.backgroundColor = .clear
        btnVouchers.backgroundColor = .clear
        btnProductss.backgroundColor = .clear
        btnOthers.backgroundColor = .clear
        
        type = ""
        price = 0
        setData()
    }
    
    @IBAction func sliderValue(_ sender: Any) {
        let newValue = Int(slider.value/5000) * 5000
        lblCurrentPrice.text = "IDR \(newValue)"
        price = Int(newValue)
        setData()
    }
    
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnAllClik(_ sender: Any) {
        isAllCheck = !isAllCheck
        type = ",Voucher,Gift Card,Product"
        setCheck(vw: sender as! UIButton, isCheck: isAllCheck)
    }
    
    @IBAction func btnVouClik(_ sender: Any) {
        isVouCheck = !isVouCheck
        if !isVouCheck {
            type = type.replacingOccurrences(of: ",Voucher", with: "")
        } else {
            type = type + ",Voucher"
        }
        setCheck(vw: sender as! UIButton, isCheck: isVouCheck)
        
    }
    
    @IBAction func btnProClik(_ sender: Any) {
        isProCheck = !isProCheck
        if !isProCheck {
            type = type.replacingOccurrences(of: ",Product", with: "")
        } else {
            type = type + ",Product"
        }
        setCheck(vw: sender as! UIButton, isCheck: isProCheck)
    }
    
    @IBAction func btnOtherClik(_ sender: Any) {
        isOtherCheck = !isOtherCheck
        if !isOtherCheck {
            type = type.replacingOccurrences(of: ",Gift Card", with: "")
        } else {
            type = type + ",Gift Card"
        }
        setCheck(vw: sender as! UIButton, isCheck: isOtherCheck)
    }
    
    @IBAction func btnFilterAction(_ sender: Any) {
        delegate?.setFilter(price: price, type: type)
        self.dismiss(animated: true, completion: nil)
    }

}

extension ViewControllerFilter {
    func setData() {
        if type == "" {
            lblFilterH.isHidden = true
        } else {
            lblFilterH.text = "   Type : \(type)   "
            lblFilterH.isHidden = false
        }
        if price == 0 {
            lblFilterP.isHidden = true
        } else {
            lblFilterP.text = "   Point : \(price) - 500000   "
            lblFilterP.isHidden = false
        }
        lblCurrentPrice.text = "IDR \(price)"
        slider.setValue(Float(price), animated: false)
        for i in type.split(separator: ","){
            if i == "Voucher" {
                isVouCheck = true
                setCheck(vw: btnVouchers, isCheck: isVouCheck)
            } else if i == "Gift Card" {
                isOtherCheck = true
                setCheck(vw: btnOthers, isCheck: isOtherCheck)
            } else if i == "Product" {
                isProCheck = true
                setCheck(vw: btnProductss, isCheck: isProCheck)
            }
        }
        checkButtonClear()
    }
    
    func checkButtonClear() {
        if type != "" && price != 0 {
            btnClear.isHidden = false
        } else {
            btnClear.isHidden = true
        }
    }
    
    func setCheck(vw: UIButton, isCheck: Bool) {
        if isCheck {
            if vw == btnAll {
                btnAll.backgroundColor = UIColor.systemBlue
                btnVouchers.backgroundColor = UIColor.systemBlue
                btnProductss.backgroundColor = UIColor.systemBlue
                btnOthers.backgroundColor = UIColor.systemBlue
                isAllCheck = true
                isVouCheck = true
                isProCheck = true
                isOtherCheck = true
            } else {
                vw.backgroundColor = UIColor.systemBlue
            }
            lblFilterH.isHidden = false
        } else {
            if vw != btnAll {
                btnAll.backgroundColor = .clear
                isAllCheck = false
            }
            vw.backgroundColor = .clear
        }
        lblFilterH.text = "   Type : \(type)   "
        checkButtonClear()
    }
    
    func setView() {
        BView.setBorder(vw: btnAll, color: .systemBlue)
        BView.setBorder(vw: btnVouchers, color: .systemBlue)
        BView.setBorder(vw: btnProductss, color: .systemBlue)
        BView.setBorder(vw: btnOthers, color: .systemBlue)
        BView.setBorder(vw: lblFilterH, color: .systemBlue)
        BView.setBorder(vw: lblFilterP, color: .systemBlue)
        BView.setBorder(vw: btnClear, color: .systemBlue)
        
        BView.setRadius(vw: btnAll)
        BView.setRadius(vw: btnVouchers)
        BView.setRadius(vw: btnProductss)
        BView.setRadius(vw: btnOthers)
        BView.setRadius(vw: btnTrueFilter)
        BView.setRadius(vw: lblFilterH, rad: 8)
        BView.setRadius(vw: lblFilterP, rad: 8)
        BView.setRadius(vw: btnClear, rad: 8)
    }
}

