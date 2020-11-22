//
//  ZJPageTitleView.swift
//  DouYuLive
//
//  Created by 王武 on 2020/11/22.
//

import UIKit

class ZJPageTitleView: UIView {

    // 懒加载属性
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        scrollView.bounces = false
        
        return scrollView
    }()
    // 底部滚动条
    private lazy var scrollLine: UIView = {
        let scrollLine = UIView()
        scrollLine.backgroundColor = option.kBotLineColor
        
        return scrollLine
    }()
    // 底部的分割线
    private lazy var bottomLine: UIView = {
        let botLine = UIView()
        let botH: CGFloat = 0.5
        botLine.backgroundColor = option.kBottomLineColor
        botLine.frame = CGRect(x: 0, y: frame.height - botH, width: frame.width, height: botH)
        
        return botLine
    }()
    
    private lazy var option: ZJPageOptions = {
        let option = ZJPageOptions()
        
        return option
    }()
    // 创建一个 label 数组
    private lazy var titleLabs: [UILabel] = [UILabel]()
    // 标题
    private var titles: [String]
    // 索引
    private var currentIndex: Int = 0
    
    // MARK:- 自定义构造函数
    init(frame: CGRect, titles: [String], options: ZJPageOptions? = nil) {
        self.titles = titles
        super.init(frame: frame)
        
        if options != nil {
            self.option = options!
        }

        setUpAllView()
    }
    
    required init?(coder: NSCoder) {
        self.titles = [String]()
        super.init(coder: coder)
        self.option = ZJPageOptions()
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK:- 系统函数
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setUpLabelsLayout()
    }
    
}

// MARK:- 设置UI
extension ZJPageTitleView {
    private func setUpAllView() {
        // 添加 scrollView
        addSubview(scrollView)
        scrollView.frame = bounds
        // 添加对应的title
        setUpTitleLabel()
    }
    
    private func setUpTitleLabel() {
        print(self.titles)
        for (index, title) in titles.enumerated() {
            // 创建 label
            let label = UILabel()
            label.text = title
            label.tag = index
            
            label.font = option.kIsNormalFontBold ? BoldFontSize(option.kTitleFontSize) : FontSize(option.kTitleFontSize)
            label.textColor = colorWithRGBA(option.kNormalColor.0, option.kNormalColor.1, option.kNormalColor.2, 1.0)
            label.textAlignment = .center
            
            // 添加 label
            scrollView.addSubview(label)
            titleLabs.append(label)
            // 添加点击事件
            label.isUserInteractionEnabled = true
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.titleLabelClick(tapGesture:)))
            label.addGestureRecognizer(tap)
        }
    }
}

// MARK:- layout
extension ZJPageTitleView {
    private func setUpLabelsLayout() {
        let labelH = frame.size.height
        let labelY: CGFloat = 0
        var labelW: CGFloat = 0
        var labelX: CGFloat = 0
        
        let count = titleLabs.count
        for (index, titleLabel) in titleLabs.enumerated() {
            if option.isTitleScrollEnable {
                labelW = (titles[index] as NSString).boundingRect(with: CGSize(width: CGFloat.greatestFiniteMagnitude, height: 0), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: titleLabel.font], context: nil).width
                labelX = index == 0 ? option.kMarginW * 0.5 : (titleLabs[index - 1].frame.maxX + option.kMarginW)
            } else if option.kItemWidth != 0 {
                labelW = option.kItemWidth
                labelX = labelW * CGFloat(index)
            } else {
                labelW = bounds.width / CGFloat(count)
                labelX = labelX * CGFloat(index)
            }
            
            titleLabel.frame = CGRect(x: labelX, y: labelY, width: labelW + Adapt(10), height: labelH)
        }
        if option.isTitleScrollEnable {
            guard let titleLabel = titleLabs.last else { return }
            scrollView.contentSize.width = titleLabel.frame.maxX + option.kMarginW * 0.5
        }
    }
    
    private func setUpBottomLineLayout() {
        guard titleLabs.count - 1 >= currentIndex else { return }
        let label = titleLabs[currentIndex]
        
        scrollLine.frame.origin.x = label.frame.origin.x
        scrollLine.frame.origin.y = self.bounds.height - option.kBotLineHeight
        scrollLine.frame.size.width = label.frame.width
        scrollLine.frame.size.height = option.kBotLineHeight
    }
    
    private func adjustLabelPosition(_ targetLabel: UILabel) {
        guard option.isTitleScrollEnable else { return }
        
        var offsetX = targetLabel.center.x - bounds.width * 0.5
        
        if offsetX < 0 {
            offsetX = 0
        }
        if offsetX > scrollView.contentSize.width - scrollView.bounds.width {
            offsetX = scrollView.contentSize.width - scrollView.bounds.width
        }
        
        scrollView.setContentOffset(CGPoint(x: offsetX, y: 0), animated: true)
    }
}

// MARK:- 监听Label的点击
extension ZJPageTitleView {
    @objc fileprivate func titleLabelClick(tapGesture: UITapGestureRecognizer) {
        print("点击")
    }
}














