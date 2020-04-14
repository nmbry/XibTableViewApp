//
//  TestTableCell.swift
//  XibTableViewApp
//
//  Created by 南部竜太郎 on 2020/04/14.
//  Copyright © 2020 nmbry. All rights reserved.
//

import UIKit

class TestTableCell: UITableViewCell {

    // MARK: UI部品
    @IBOutlet weak var testLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
