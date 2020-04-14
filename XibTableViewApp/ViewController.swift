//
//  ViewController.swift
//  XibTableViewApp
//
//  Created by 南部竜太郎 on 2020/04/14.
//  Copyright © 2020 nmbry. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    @IBOutlet weak var testTable: TestTable!
    
    private var disposeBag: DisposeBag?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.disposeBag = DisposeBag()
        bind()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.disposeBag = nil
    }
    
    private func bind() {
        let items = Observable.just([
            "First",
            "Second",
            "Third",
        ])
        
        items.bind(to: self.testTable.testTableView.rx.items) { (tableView, row, element) in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TestTableCell
            cell.testLabel.text = "\(row): \(element)"
            return cell
        }.disposed(by: disposeBag!)
    }
}
