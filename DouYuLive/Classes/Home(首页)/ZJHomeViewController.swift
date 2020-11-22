//
//  ZJHomeViewController.swift
//  DouYuLive
//
//  Created by 王武 on 2020/11/21.
//

import UIKit

private var isNavHidden: Bool = false

class ZJHomeViewController: ZJBaseViewController {
    
    // 标题数组
    private lazy var titles : [String] = ["分类","推荐","全部","LOL","绝地求生","王者荣耀","QQ飞车"]
    // 控制器数组
    

    override func viewDidLoad() {
        super.viewDidLoad()

        setUpAllView()
    }

}

// MARK:- 设置UI
extension ZJHomeViewController {
    /// 设置UI
    func setUpAllView() {
        self.navigationController?.navigationBar.shadowImage = UIImage()
        // 不需要调整 scrollView 的内边距
        automaticallyAdjustsScrollViewInsets = false
        view.addSubview(statusView)
        // 添加导航栏
        setUpNavigation()
    }
}
