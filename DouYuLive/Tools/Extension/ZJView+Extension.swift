//
//  ZJView+Extension.swift
//  DouYuLive
//
//  Created by 王武 on 2020/11/22.
//

import UIKit
import SnapKit

extension UIView {
    /// 快速创建 View 并使用 SnapKit 布局
    ///
    /// - Parameters:
    ///   - bgClor: View 的背景颜色
    ///   - supView: 父视图
    ///   - closure: 约束
    /// - Returns:  View
    class func zj_createView(bgColor: UIColor, superView: UIView?, closure: (_ make: ConstraintMaker) -> ()) -> UIView {
        let view = UIView()
        view.backgroundColor = bgColor
        if superView != nil {
            superView?.addSubview(view)
            view.snp.makeConstraints { (make) in
                closure(make)
            }
        }
        
        return view
    }
    
    /// 快速创建一个 UIImageView,可以设置 imageName,contentMode,父视图,约束
    ///
    /// - Parameters:
    ///   - imageName: 图片名称
    ///   - contentMode: 填充模式
    ///   - supView: 父视图
    ///   - closure: 约束
    /// - Returns:  UIImageView
    class func zj_createImageView(imageName: String?, contentMode: ContentMode? = nil, superView: UIView?,
                                  closure: (_ make: ConstraintMaker) -> ()) -> UIImageView {
        let imageV = UIImageView()
        
        if imageName != nil {
            imageV.image = UIImage(named: imageName!)
        }
        
        if contentMode != nil {
            imageV.contentMode = contentMode!
        }
        
        if superView != nil {
            superView?.addSubview(imageV)
            imageV.snp.makeConstraints { (make) in
                closure(make)
            }
        }
        
        return imageV
    }
    
    /// 快速创建 UIButton,设置标题,图片,父视图,约束
    ///
    /// - Parameters:
    ///   - title: 标题
    ///   - titleStatu: 标题状态模式
    ///   - imageName: 图片名
    ///   - imageStatu: 图片状态模式
    ///   - supView: 父视图
    ///   - closure: 约束
    /// - Returns:  UIButton
    class func zj_createButton(title: String?, titleStatus: UIControl.State?, titleColor: UIColor? = nil,
                               imageName: String?, imageStatus: UIControl.State?, font: UIFont? = FontSize(14),
                               superView: UIView?, closure: (_ make: ConstraintMaker) -> ()) -> UIButton {
        let btn = UIButton()
        
        if title != nil {
            btn.setTitle(title, for: .normal)
        }
        
        if title != nil && titleStatus != nil {
            btn.setTitle(title, for: titleStatus!)
        }
        
        if imageName != nil {
            btn.setImage(UIImage(named: imageName!), for: .normal)
        }
        
        if imageName != nil && imageStatus != nil {
            btn.setImage(UIImage(named: imageName!), for: imageStatus!)
        }
        
        if titleColor != nil {
            btn.setTitleColor(titleColor, for: .normal)
        }
        btn.titleLabel?.font = font
        if superView != nil {
            superView?.addSubview(btn)
            btn.snp.makeConstraints { (make) in
                closure(make)
            }
        }
        
        return btn
    }
    
    /// 快速创建 Label,设置文本, 文本颜色,Font,文本位置,父视图,约束
    ///
    /// - Parameters:
    ///   - text: 文本
    ///   - textColor: 文本颜色
    ///   - font: 字体大小
    ///   - textAlignment: 文本位置
    ///   - supView: 父视图
    ///   - closure: 约束
    /// - Returns:  UILabel
    class func zj_createLabel(text: String?, textColor: UIColor?, font: UIFont?, textAlignment: NSTextAlignment = .left,
                              superView: UIView?, closure: (_ make: ConstraintMaker) -> ()) -> UILabel {
        let label = UILabel()
        label.text = text
        if (textColor != nil) { label.textColor = textColor }
        if (font != nil) { label.font = font }
        label.textAlignment = textAlignment
        
        if superView != nil {
            superView?.addSubview(label)
            label.snp.makeConstraints { (make) in
                closure(make)
            }
        }
        
        return label
    }
    
    /// 快速创建 UITextField,设置文本,文本颜色,placeholder,字体大小,文本位置,边框样式, 自动布局
    ///
    /// - Parameters:
    ///   - text: 文本
    ///   - textColor: 文本颜色
    ///   - placeholder: placeholder
    ///   - font: 字体大小
    ///   - textAlignment: 文本位置
    ///   - borderStyle: 边框样式
    ///   - supView: 父视图
    ///   - closure:  make
    /// - Returns: UITextField
    class func zj_createTextField(text: String?, textColor: UIColor?, placeholder: String, font: UIFont?, textAlignment: NSTextAlignment = .left,
                                  borderStyle: UITextField.BorderStyle = .none, superView: UIView?, closure: (_ make: ConstraintMaker) -> ()) -> UITextField {
        let textField = UITextField()
        textField.text = text
        textField.placeholder = placeholder
        textField.borderStyle = borderStyle
        if (textColor != nil) { textField.textColor = textColor }
        if (font != nil) { textField.font = font }
        
        textField.textAlignment = textAlignment
        
        if superView != nil {
            superView?.addSubview(textField)
            textField.snp.makeConstraints { (make) in
                closure(make)
            }
        }
        
        return textField
    }
}
