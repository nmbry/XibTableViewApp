# XibTableViewApp
## XibでTableViewを作成する

1. `command+N`->`User Interface`->`View`で.xibを作成する
2. `command+N`->`Coaoa Touch Class`->`UIView`で.xibに対応する.swiftを作成する
3. **`File's Owner`->`Show the Identity inspector`から2.で作成した.swiftを指定する**
4. `Table View`を配置する
~~~swift
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
~~~
5. `command+N`->`User Interface`->`Empty`を作成する
6. `command+N`->`Cocoa Touch Class`->`UITableViewCell`で.xibに対応する.swiftを作成する
7. **UITableViewをクリックして`Custom Class`を2.で作成した.swiftを指定する**
8. `Table View Cell`を配置する
~~~swift
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
~~~
9. `ViewController`からrxでtableViewを呼び出す
~~~swift
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
~~~