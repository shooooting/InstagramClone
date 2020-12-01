//
//  IGFeedPostActionTableViewCell.swift
//  InstagramClone
//
//  Created by ㅇ오ㅇ on 2020/11/24.
//

import UIKit

class IGFeedPostActionTableViewCell: UITableViewCell {

    static let identifier = "IGFeedPostActionTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .systemGreen
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure() {
        // configure the cell
        
    }

}
