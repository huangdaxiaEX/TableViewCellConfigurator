//
//  KSYCellSelectable.swift
//  TableViewCellConfigurator
//
//  Created by huangdaxia on 2017/8/5.
//  Copyright © 2017年 ksyfast. All rights reserved.
//

import UIKit

public protocol KSYCellSelectable {
    
    func didSelected(at indexPath: IndexPath)
}
