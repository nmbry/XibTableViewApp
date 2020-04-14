//
//  TestTable.swift
//  XibTableViewApp
//
//  Created by 南部竜太郎 on 2020/04/14.
//  Copyright © 2020 nmbry. All rights reserved.
//

import UIKit

class TestTable: UIView {

    // MARK: UI部品
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var testTableView: UITableView!
    
    override func awakeFromNib() {
        // nibファイルから読み込まれた時に呼ばれる
        Bundle.main.loadNibNamed("TestTable", owner: self, options: nil)
        // サイズ調整
        self.contentView.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        self.contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.contentView.translatesAutoresizingMaskIntoConstraints = true
        addSubview(self.contentView)
        
        // セルを追加
        self.testTableView.register(UINib(nibName: "TestTableCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
}
