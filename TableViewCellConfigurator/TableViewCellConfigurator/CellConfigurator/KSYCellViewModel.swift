//
//  KSYCellViewModel.swift
//  TableViewCellConfigurator
//
//  Created by huangdaxia on 2017/8/5.
//  Copyright © 2017年 ksyfast. All rights reserved.
//

import UIKit

public protocol KSYCellViewModel {
    associatedtype ViewModel
    var viewModel: ViewModel? { get }
    
    func config(_ viewModel: ViewModel)
}
