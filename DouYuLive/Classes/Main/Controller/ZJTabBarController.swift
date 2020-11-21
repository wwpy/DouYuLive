//
//  ZJTabBarController.swift
//  DouYuLive
//
//  Created by 王武 on 2020/11/21.
//

import UIKit

class ZJTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpAllViewController()

        // tabBar 底部工具栏背景颜色
//        self.tabBar.barTintColor = UIColor.orange
//        self.tabBar.backgroundColor = UIColor.white
        // 设置图片和文字选中时的颜色 （系统默认选中蓝色）
        self.tabBar.tintColor = UIColor.orange
    }
    
    fileprivate func setUpAllViewController() -> Void {
        setUpChildController(ZJHomeViewController(), "推荐", "tabLive", "tabLiveHL")
        setUpChildController(ZJRecreationViewController(), "娱乐", "tabYule", "tabYuleHL")
        setUpChildController(ZJFollowViewController(), "关注", "tabFocus", "tabFocusHL")
        setUpChildController(ZJFishBarViewController(), "鱼吧", "tabYuba", "tabYubaHL")
        setUpChildController(ZJDiscoverViewController(), "发现", "tabDiscovery", "tabDiscoveryHL")
    }
    
    // 设置子控制器属性
    fileprivate func setUpChildController(_ controller: UIViewController, _ title: String, _ normalImage: String, _ selecedImage: String) {
        
        controller.tabBarItem.title = title
        
        // 设置未选中&选中图片
        controller.tabBarItem.image = UIImage(named: normalImage)
        controller.tabBarItem.selectedImage = UIImage(named: selecedImage)
        // 设置 NavigationController
        let nav = ZJNavigationController(rootViewController: controller)
        controller.title = title
        
        self.addChild(nav)
    }
}
