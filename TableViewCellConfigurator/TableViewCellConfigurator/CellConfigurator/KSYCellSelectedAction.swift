//
//  KSYCellSelectedAction.swift
//  TableViewCellConfigurator
//
//  Created by huangdaxia on 2017/8/5.
//  Copyright © 2017年 ksyfast. All rights reserved.
//

import UIKit

public struct KSYCellSelectedAction: KSYCellSelectable {
    
    fileprivate var selectedAction: ((IndexPath) -> Void)
    
    init(selectedAction: @escaping ((IndexPath) -> Void)) {
        self.selectedAction = selectedAction
    }
    
    public func didSelected(at indexPath: IndexPath) {
        selectedAction(indexPath)
    }
}
