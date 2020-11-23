//
//  ZJPageContentView.swift
//  DouYuLive
//
//  Created by 王武 on 2020/11/22.
//

import UIKit

private let kContentCellID = "kContentCellID"

class ZJPageContentView: UIView {

    // MARK:- 定义属性
    // 禁止点击的时候走代理的方法
    private var isForbidScrollDelegate: Bool = false
    // 子控制器数组
    private var childVCs: [UIViewController]
    // 父控制器 weak , 防止循环引用
    private weak var parentViewController: UIViewController?
    // 滑动偏移量
    private var startOffsetX: CGFloat = 0
    // 定义 layout
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = self.bounds.size
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        
        return layout
    }()
    // 定义 collectionView 容器
    private lazy var collectionView: UICollectionView = { [weak self] in
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true
        collectionView.bounces = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = kWhite
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: kContentCellID)
        
        return collectionView
    }()
    
    // MARK:- 自定义构造函数
    init(frame: CGRect, childVCs: [UIViewController], parentViewController: UIViewController?) {
        self.childVCs = childVCs
        self.parentViewController = parentViewController
        
        super.init(frame: frame)
        
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK:- 设置UI
extension ZJPageContentView {
    private func setUpView() {
        // 将所有的子控制器添加到父控制器中
        for childVC in childVCs {
            self.parentViewController?.addChild(childVC)
        }
        
        // 添加 UICollectionView 存放子控制器的 View
        addSubview(collectionView)
        collectionView.frame = bounds
    }
}

// MARK:- 遵守协议 UICollectionViewDataSource
extension ZJPageContentView : UICollectionViewDataSource,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return childVCs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kContentCellID, for: indexPath)
        let childVC = childVCs[indexPath.item]
        childVC.view.frame = cell.contentView.bounds
        cell.contentView.addSubview(childVC.view)
        cell.backgroundColor = kWhite
        
        return cell
    }
    
    // 开始滑动
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        // 记录是否需要禁止执行的代理方法
        isForbidScrollDelegate = false
        
        startOffsetX = scrollView.contentOffset.x
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
}
