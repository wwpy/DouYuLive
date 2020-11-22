//
//  ZJHomeSearchView.swift
//  DouYuLive
//
//  Created by 王武 on 2020/11/22.
//

import UIKit

class ZJHomeSearchView: UIView {

    // MARK:- 定义属性
    lazy var textField: UITextField = { () -> UITextField in
       let textField = UITextField()
        textField.backgroundColor = UIColor.clear
        textField.borderStyle = .none
        textField.font = FontSize(14)
        textField.textColor = kWhite
        let placeholserAttributes = [NSAttributedString.Key.foregroundColor: colorWithRGBA(100, 100, 100, 0.5)
                                     , NSAttributedString.Key.font: FontSize(14)]
        
        textField.attributedPlaceholder = NSAttributedString.init(string: "请输入搜索内容", attributes: placeholserAttributes)
        
        return textField
    }()
    var searchIcon: UIImageView = { () -> UIImageView in
        let searchIcon = UIImageView()
        searchIcon.image = UIImage(named: "home_newSeacrhcon")
        searchIcon.contentMode = .center
        
        return searchIcon
    }()
    var qcodeIcon: UIImageView = { () -> UIImageView in
        let qcodeIcon = UIImageView()
        qcodeIcon.image = UIImage(named: "home_newSaoicon")
        qcodeIcon.contentMode = .center
        
        return qcodeIcon
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.green
        
        setUpChildView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK:- 设置UI
extension ZJHomeSearchView {
    // 设置UI
    func setUpChildView() {
        self.addSubview(textField)
        self.addSubview(searchIcon)
        self.addSubview(qcodeIcon)
        
        textField.snp.makeConstraints { (make) in
            make.left.equalTo(self).offset(AdaptW(35))
            make.right.equalTo(self).offset(AdaptW(-35))
            make.height.equalTo(30)
            make.center.equalTo(self.snp.center)
        }
        
        searchIcon.snp.makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.left.equalTo(5)
            make.width.height.equalTo(AdaptW(30))
        }
        
        qcodeIcon.snp.makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.right.equalTo(AdaptW(-5))
            make.width.height.equalTo(AdaptW(30))
        }
    }
}
