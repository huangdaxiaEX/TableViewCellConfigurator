//
//  TableViewCell.swift
//  TableViewCellConfigurator
//
//  Created by huangdaxia on 2017/8/7.
//  Copyright © 2017年 ksyfast. All rights reserved.
//

import UIKit

struct TableViewModel {
    var title: String?
    var image: UIImage?
    
    init(title: String?, image: UIImage?) {
        self.title = title
        self.image = image
    }
}

class TableViewCell: UITableViewCell, KSYCellViewModel {
    typealias ViewModel = TableViewModel
    var viewModel: ViewModel?
    
    func config(_ viewModel: TableViewModel) {
        self.viewModel = viewModel
        textLabel?.text = viewModel.title
        imageView?.image = viewModel.image
    }
    
}

class SwitcherTableViewCell: TableViewCell {
    let switcher: UISwitch = UISwitch()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        switcher.addTarget(self, action: #selector(didChangedSwitch), for: .valueChanged)
        accessoryView = switcher
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func config(_ viewModel: TableViewModel) {
        super.config(viewModel)
    }
    
    @objc func didChangedSwitch() {
        print("didChangedSwitch")
    }
    
}
