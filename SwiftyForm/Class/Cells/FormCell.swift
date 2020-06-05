//
//  FormCell.swift
//  SwiftyForm
//
//  Created by iOS on 2020/6/5.
//  Copyright © 2020 iOS. All rights reserved.
//

import Foundation
import UIKit
import SnapKit
open class FormCell: UITableViewCell, FormableRow {
    open func updateWithRowFormer(_ rowFormer: RowFormer) {
        
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }

    
    open func setup() {
        textLabel?.backgroundColor = .clear
    }
}
