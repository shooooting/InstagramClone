//
//  ProfileTabsCollectionReusableView.swift
//  InstagramClone
//
//  Created by ㅇ오ㅇ on 2020/11/26.
//

import UIKit

class ProfileTabsCollectionReusableView: UICollectionReusableView {
        static let identifier = "ProfileTabsCollectionReusableView"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemBackground
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
