//
//  KSYCellConfigurator.swift
//  TableViewCellConfigurator
//
//  Created by huangdaxia on 2017/8/4.
//  Copyright © 2017年 ksyfast. All rights reserved.
//

import UIKit

public struct KSYCellConfigurator<Cell: UITableViewCell>: KSYCellConfigurable where Cell: KSYCellViewModel {
    
    public let reuseIdentifier: String = NSStringFromClass(Cell.self)
    
    public let cellClass: AnyClass = Cell.self
    
    public var selection: KSYCellSelectable?
    
    public var height: CGFloat
    
    public func config(_ cell: UITableViewCell) {
        guard let `cell` = cell as? Cell else {
            fatalError("cell is not KSYCellViewModel?! ")
        }
        
        cell.config(viewModel)
    }
    
    public let viewModel: Cell.ViewModel
    public init(viewModel: Cell.ViewModel, height: CGFloat = 44, selection: KSYCellSelectable? = nil) {
        self.viewModel = viewModel
        self.height = height
        self.selection = selection
    }
}
