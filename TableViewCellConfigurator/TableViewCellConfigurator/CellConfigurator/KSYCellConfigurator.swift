//
//  KSYCellConfigurator.swift
//  TableViewCellConfigurator
//
//  Created by huangdaxia on 2017/8/4.
//  Copyright © 2017年 ksyfast. All rights reserved.
//

import UIKit

struct KSYCellConfigurator<Cell: UITableViewCell>: KSYCellConfigurable where Cell: KSYCellViewModel {

    let reuseIdentifier: String = NSStringFromClass(Cell.self)
    
    let cellClass: AnyClass = Cell.self
    
    var selection: KSYCellSelectable?
    
    var height: CGFloat
    
    func config(_ cell: UITableViewCell) {
        guard let `cell` = cell as? Cell else {
            fatalError("cell is not KSYCellViewModel?! ")
        }
        
        cell.config(viewModel)
    }
    
    let viewModel: Cell.ViewModel
    init(viewModel: Cell.ViewModel, height: CGFloat = 44, selection: KSYCellSelectable? = nil) {
        self.viewModel = viewModel
        self.height = height
        self.selection = selection
    }
}
