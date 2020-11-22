//
//  ZJPopupBaseView.swift
//  DouYuLive
//
//  Created by 王武 on 2020/11/22.
//

import UIKit

class ZJPopupBaseView: UIView {
    // 定义一个无参无返回值得闭包
    typealias GusHiddenBlock = () -> ()
    var cusBlock: GusHiddenBlock?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 回调给 popupView 隐藏视图
    @objc func zj_popupViewhiddenAction() {
        if cusBlock != nil {
            cusBlock!()
        }
    }

}
