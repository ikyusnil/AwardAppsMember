//
//  TableViewCellAwards.swift
//  Award Apps
//
//  Created by Rizki Yusnil on 23/12/19.
//  Copyright © 2019 Rizki Yusnil. All rights reserved.
//

import UIKit

class TableViewCellAwards: UITableViewCell {

    @IBOutlet weak var vwBody: UIView!
    @IBOutlet weak var lblPoint: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var typeCard: UIButton!
    @IBOutlet weak var img: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        BView.setRadius(vw: typeCard)
        BView.setRadius(vw: vwBody, rad: 10)
        BView.setShadow(vw: vwBody, bounds: CGRect(x: 0, y: 0, width: BView.getWidht() - 32, height: vwBody.frame.height))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setData(data: AwardsModel) {
        lblPoint.text = "\(data.point ?? "") Point"
        if data.type == "Gift Card" {
            typeCard.backgroundColor = .systemBlue
            lblPrice.text = "\(data.type) IDR \(data.price)"
        } else if data.type == "Voucher" {
            typeCard.backgroundColor = .systemTeal
            lblPrice.text = "\(data.type) IDR \(data.price)"
        } else {
            typeCard.backgroundColor = .systemPink
            lblPrice.text = "\(data.product ?? "")"
        }
        typeCard.setTitle("\(data.type)", for: .normal)
        img.image = UIImage.init(named: data.image ?? "")
    }
    
}
