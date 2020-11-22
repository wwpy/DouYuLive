//
//  ZJFont.swift
//  DouYuLive
//
//  Created by 王武 on 2020/11/21.
//

import UIKit

/// 常规字体
func FontSize(_ size: CGFloat) -> UIFont {
    
    return UIFont.systemFont(ofSize: AdaptW(size))
}

/// 加粗字体
func BoldFontSize(_ size: CGFloat) -> UIFont {
    
    return UIFont.boldSystemFont(ofSize: AdaptW(size))
}
