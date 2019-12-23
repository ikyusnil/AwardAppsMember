//
//  ViewControllerHome.swift
//  Award Apps
//
//  Created by Rizki Yusnil on 23/12/19.
//  Copyright © 2019 Rizki Yusnil. All rights reserved.
//

import UIKit

class ViewControllerHome: UIViewController {
    
    @IBOutlet weak var tblView: UITableView!
    
    var VLS: NavigationDrawer = NavigationDrawer()
    var arrAward = [AwardsModel]()
    
    var priceHome = 0
    var typeHome = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingTrans()
        setDrawer()
        setTableView()
    }
    
    @IBAction func drawer(_ sender: Any) {
        VLS.fadeIn()
    }
    
    @IBAction func filter(_ sender: Any) {
        toFilter()
    }

}

extension ViewControllerHome: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrAward.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellAwards") as? TableViewCellAwards
        cell?.setData(data: arrAward[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175
    }
    
}

extension ViewControllerHome: NavigationDrawerDelegate {
    func tapHome() {
        
    }
    
    func tapCards() {
        
    }
    
    func tapProfile() {
        
    }
    
    func tapLogout() {
        self.navigationController?.popToRootViewController(animated: true)
    }
}

extension ViewControllerHome: ViewControllerFilterDelegate{
    func setFilter(price: Int, type: String) {
        priceHome = price
        typeHome = type
        arrAward = getDataFilter(price: price, type: type)
        self.tblView.reloadData()
    }
}

extension ViewControllerHome{
    
    func setTableView() {
        arrAward = getAll()
        tblView.delegate = self
        tblView.dataSource = self
        tblView.separatorStyle = .none
        tblView.register(UINib(nibName: "TableViewCellAwards", bundle: nil), forCellReuseIdentifier: "TableViewCellAwards")
    }
    
    func setDrawer() {
        VLS = NavigationDrawer(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        VLS.delegate = self
        view.addSubview(VLS)
        VLS.fadeOut()
    }
    
    func toFilter()  {
        let vc = ViewControllerFilter.init(nibName: "ViewControllerFilter", bundle: nil)
        vc.delegate = self
        vc.price = priceHome
        vc.type = typeHome
        self.present(vc, animated: true, completion: nil)
    }
    
    func getAll() -> [AwardsModel] {
        let temp = [
            AwardsModel(type: "Voucher", price: 20000, point: "25000", image: "other1"     , product: ""),
            AwardsModel(type: "Gift Card", price: 25000, point: "30000", image: "giftCard"   , product: ""),
            AwardsModel(type: "Voucher", price: 40000, point: "45000", image: "other"     , product: ""),
            AwardsModel(type: "Voucher", price: 45000, point: "50000", image: "vous"     , product: ""),
            AwardsModel(type: "Product", price: 80000, point: "85000", image: "other"     , product: "Makanan Kucing Kampung"),
            AwardsModel(type: "Product", price: 85000, point: "90000", image: "vous"     , product: "Handuk Lionel Messi"),
            AwardsModel(type: "Gift Card", price: 100000, point: "150000", image: "giftCard" , product: ""),
            AwardsModel(type: "Gift Card", price: 150000, point: "200000", image: "giftCard" , product: ""),
            AwardsModel(type: "Voucher", price: 200000, point: "250000", image: "other1"   , product: ""),
            AwardsModel(type: "Voucher", price: 250000, point: "300000", image: "vous"   , product: ""),
            AwardsModel(type: "Gift Card", price: 280000, point: "330000", image: "other1" , product: ""),
            AwardsModel(type: "Gift Card", price: 380000, point: "420000", image: "other" , product: ""),
            AwardsModel(type: "Product", price: 400000, point: "450000", image: "giftCard"   , product: "Toren Pinguin Orange"),
            AwardsModel(type: "Voucher", price: 400000, point: "450000", image: "other1"   , product: ""),
            AwardsModel(type: "Gift Card", price: 420000, point: "470000", image: "vous" , product: ""),
            AwardsModel(type: "Product", price: 450000, point: "500000", image: "other"   , product: "Selang Karbu Suzuki Smash"),
            AwardsModel(type: "Voucher", price: 480000, point: "530000", image: "other1"   , product: ""),
            AwardsModel(type: "Product", price: 500000, point: "550000", image: "giftCard"   , product: "Obat Mencret Oralit")
                   ]
        
        return temp
    }
    
    func getDataFilter(price: Int, type: String) -> [AwardsModel] {
        let temp = getAll()
        let tip = type.split(separator: ",")
        var tempApp = [AwardsModel]()
        if tip.count > 0 {
            for i in tip{
                for data in temp {
                    if i == data.type && data.price >= price {
                        tempApp.append(data)
                    }
                }
            }
        } else {
            for data in temp {
                if data.price >= price {
                    tempApp.append(data)
                }
            }
        }
        return tempApp
    }
    
    func settingTrans() {
        if #available(iOS 13.0, *) {
            if self.responds(to: #selector(getter: UIView.overrideUserInterfaceStyle)) {
                self.setValue(UIUserInterfaceStyle.light.rawValue, forKey: "overrideUserInterfaceStyle")
            }
        }
    }
}
