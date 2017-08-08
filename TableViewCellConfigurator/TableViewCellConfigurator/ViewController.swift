//
//  ViewController.swift
//  TableViewCellConfigurator
//
//  Created by huangdaxia on 2017/8/4.
//  Copyright © 2017年 ksyfast. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var viewModel: ViewModel?
    
    let tableView: UITableView = {
        let table = UITableView(frame: CGRect.zero, style: .plain)
        table.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        return table
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        automaticallyAdjustsScrollViewInsets = true
        viewModel = ViewModel()
        viewModel?.tableView = tableView
        tableView.frame = view.bounds.insetBy(dx: 0, dy: 64)
        tableView.delegate = viewModel
        tableView.dataSource = viewModel
        view.addSubview(tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

protocol TableViewModelProtocol {
    var items: [[KSYCellConfigurable]] { get set }
}

class ViewModel: NSObject {
    weak var tableView: UITableView?
    
    lazy var items: [[KSYCellConfigurable]] = { [unowned self] in
        let item = self.setupItems()
        for section in item {
            for configure in section {
                self.tableView?.register(configure.cellClass.self, forCellReuseIdentifier: configure.reuseIdentifier)
            }
        }
        
        return item
    } ()
    
    func setupItems() -> [[KSYCellConfigurable]] {
        let cell1 = KSYCellConfigurator<TableViewCell>(
            viewModel: TableViewModel(title: "say", image: UIImage(named: "DistanceIcon.png")) ,
            height: 44,
            selection: KSYCellSelectedAction(selectedAction: { (indexPath) in
                print("did Selected indexPath section: \(indexPath.section) row: \(indexPath.row)")
        }))
        
        let cell2 = KSYCellConfigurator<TableViewCell>(
            viewModel: TableViewModel(title: "oh yeah", image: UIImage(named: "DistanceIcon.png")) ,
            height: 84,
            selection: KSYCellSelectedAction(selectedAction: { (indexPath) in
                print("did Selected indexPath section: \(indexPath.section) row: \(indexPath.row)")
            }))
        
        let cell3 = KSYCellConfigurator<SwitcherTableViewCell>(
            viewModel: TableViewModel(title: "oh yeah switch", image: UIImage(named: "DistanceIcon.png")) ,
            height: 44)
        
        return [[cell1, cell2, cell3]]
    }
    
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension ViewModel: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let configure = items[indexPath.section][indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: configure.reuseIdentifier, for: indexPath)
        configure.config(cell)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let configure = items[indexPath.section][indexPath.row]
        return configure.height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selection = items[indexPath.section][indexPath.row].selection {
            selection.didSelected(at: indexPath)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
