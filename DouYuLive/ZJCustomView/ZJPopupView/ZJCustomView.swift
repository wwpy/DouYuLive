//
//  ZJCustomView.swift
//  DouYuLive
//
//  Created by 王武 on 2020/11/22.
//

import UIKit

class ZJCustomView: ZJPopupBaseView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.orange
        self.layer.cornerRadius = 5
        let btn = UIButton.zj_createButton(title: "这是一个自定义弹框视图,点击关闭", titleStatus: .normal, imageName: nil, imageStatus: nil, superView: self) { (make) in
            make.center.equalTo(self.snp.center)
        }
        // 添加zj_popupViewhiddenAction 事件，点击隐藏视图
        btn.addTarget(self, action: #selector(zj_popupViewhiddenAction), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
