//
//  NoNotificationView.swift
//  InstagramClone
//
//  Created by ㅇ오ㅇ on 2020/12/01.
//

import UIKit

class NoNotificationView: UIView {
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "No Notifications Yet"
        label.textColor = .secondaryLabel
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .secondaryLabel
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "bell")
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubviews()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageView.frame = CGRect(x: (width - 50) / 2, y: 0, width: 50, height: 50).integral
        label.frame = CGRect(x: 0, y: imageView.bottom, width: width, height:   height).integral
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        [label, imageView].forEach {
            addSubview($0)
        }
    }
}
