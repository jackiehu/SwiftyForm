//
//  FormLabelFooterView.swift
//  SwiftyForm
//
//  Created by iOS on 2020/6/5.
//  Copyright © 2020 iOS. All rights reserved.
//

import UIKit

public class LabelFooter: LabelHeaderFooterFormer<LabelFooterView> {

}

public class LabelFooterView: BaseHeaderFooterView, LabelFormableView {

    public private(set) weak var titleLabel: UILabel!
    
    public func formTitleLabel() -> UILabel {
        return titleLabel
    }
    
    override public func setup() {
        super.setup()
        
        let titleLabel = UILabel()
        titleLabel.textColor = .lightGray
        titleLabel.font = .systemFont(ofSize: 14)
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.insertSubview(titleLabel, at: 0)
        titleLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(15)
            make.right.equalToSuperview().offset(-15)
        }
        self.titleLabel = titleLabel

    }
}
