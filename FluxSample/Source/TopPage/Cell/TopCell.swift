//
//  TopCell.swift
//  FluxSample
//
//  Created by RN-079 on 2017/05/01.
//  Copyright © 2017年 RN-079. All rights reserved.
//

import UIKit
import Kingfisher

class TopCell: UITableViewCell, Nibable {
    @IBOutlet weak var itemImageView : UIImageView!
    @IBOutlet weak var itemNameLbl : UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var expiredLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with info: TopInfo) {
        itemImageView.kf.setImage(with: URL(string: info.itemImageUrl)!)
        itemNameLbl.text = info.itemName
        priceLbl.text = info.price
        expiredLbl.text = info.expiredDateString
    }
}
