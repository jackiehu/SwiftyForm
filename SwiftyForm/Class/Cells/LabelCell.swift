//
//  BaseCellFormer.swift
//  SwiftyForm
//
//  Created by iOS on 2020/6/5.
//  Copyright © 2020 iOS. All rights reserved.
//

import UIKit

public class LabelRow: LabelRowFormer<LabelCell> {

}

open class LabelCell: BaseCell, LabelFormableRow {

    public private(set) weak var titleLabel: UILabel!
    public private(set) weak var subTitleLabel: UILabel!
    public private(set) weak var titleImageView: UIImageView!
    
    public func formTitleImageView() -> UIImageView? {
        return titleImageView
    }
    
    public func formTitleLabel() -> UILabel? {
        return titleLabel
    }
    
    public func formSubTitleLabel() -> UILabel? {
        return subTitleLabel
    }
    
    open override func setup() {
        super.setup()
        
        let titleImageView = UIImageView()
        titleImageView.clipsToBounds = true
        contentView.addSubview(titleImageView)
        self.titleImageView = titleImageView
        titleImageView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(20)
        }
        
        let titleLabel = UILabel()
        titleLabel.setContentHuggingPriority(.defaultHigh, for: .horizontal) 
        contentView.addSubview(titleLabel)
        self.titleLabel = titleLabel
        
        let subTitleLabel = UILabel()
        subTitleLabel.textColor = .lightGray
        subTitleLabel.textAlignment = .right
        contentView.addSubview(subTitleLabel)
        self.subTitleLabel = subTitleLabel
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(20)
        }
        
        subTitleLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            make.left.equalTo(titleLabel.snp.right)
            make.right.equalToSuperview().offset(-20)
        }
    }

    open override func updateWithRowFormer(_ rowFormer: RowFormer) {
        
        titleLabel.snp.remakeConstraints { (make) in
            make.top.bottom.equalToSuperview()
            if rowFormer.titleImage == nil{
                make.left.equalToSuperview().offset(20)
            }else{
                make.left.equalTo(titleImageView.snp.right).offset(5)
            }
        }

        subTitleLabel.snp.updateConstraints { (make) in
            make.right.equalToSuperview().offset((accessoryType == .none) ? -20 : -5)
        }
    }
}
