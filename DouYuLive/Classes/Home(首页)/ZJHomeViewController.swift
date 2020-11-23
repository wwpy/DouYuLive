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
    private lazy var controllers: [UIViewController] = {
        var controllers = [] as [UIViewController]
        for vc in 0..<7 {
            let vv = UIViewController()
            vv.view.backgroundColor = kGreen
            controllers.append(vv)
        }
        
        return controllers
    }()
    
    // 标题 View
    private lazy var pageTitleView: ZJPageTitleView = { [weak self] in
        let frame = CGRect(x: 0, y: 0, width: kScreenH, height: kCateTitleH)
        let option = ZJPageOptions()
        option.kGradColors = kGradientColors
        option.kBotLineColor = kWhite
        option.kNormalColor = (220,220,220)
        option.kSelectColor = (250,250,250)
        option.kTitleSelectFontSize = 14
        option.isShowBottomLine = false
        option.kIsShowBottomBorderLine = false
        let pageTitleView = ZJPageTitleView(frame: frame, titles: titles, options: option)
        
        return pageTitleView
    }()
    // 内容 View
    private lazy var pageContentView: ZJPageContentView = { [weak self] in
        let height: CGFloat = kScreenH - kStatusHeight - kNavigationBarHeight - kCateTitleH - kTabBarHeight
        let frame = CGRect(x: 0, y: kCateTitleH, width: kScreenW, height: height)
        
        let contentView = ZJPageContentView(frame: frame, childVCs: controllers, parentViewController: self!)
//        contentView.delegate = self
        
        return contentView
    }()

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
        // 添加标题栏
        setUpPageTitleAndContentView()
    }
    
    func setUpPageTitleAndContentView() {
        // 添加 TitleView
        view.addSubview(pageTitleView)
        // 添加 ContentView
        view.addSubview(pageContentView)
    }
}
