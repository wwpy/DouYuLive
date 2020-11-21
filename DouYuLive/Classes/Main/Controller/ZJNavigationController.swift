//
//  ZJNavigationController.swift
//  DouYuLive
//
//  Created by 王武 on 2020/11/21.
//

import UIKit

class ZJNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationBar.isTranslucent = false
        
        // 自定义导航栏背景颜色
        let navView = self.navigationBar.subviews.first
        guard navView != nil else { return }
    }
    
    // MARK:- 重写跳转
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true // 跳转之后隐藏
        }
        
        super.pushViewController(viewController, animated: true)
    }

}
