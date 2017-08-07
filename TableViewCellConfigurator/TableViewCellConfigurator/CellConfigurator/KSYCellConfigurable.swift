//
//  KSYCellConfigurable.swift
//  TableViewCellConfigurator
//
//  Created by huangdaxia on 2017/8/4.
//  Copyright © 2017年 ksyfast. All rights reserved.
//

import UIKit

protocol KSYCellConfigurable {
    var reuseIdentifier: String { get }
    var cellClass: AnyClass { get }
    var selection: KSYCellSelectable? { get }
    var height: CGFloat { get }
    
    func config(_ cell: UITableViewCell)
}
