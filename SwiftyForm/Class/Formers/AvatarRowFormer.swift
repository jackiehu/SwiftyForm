//
//  AvatarRowFormer.swift
//  SwiftyForm
//
//  Created by iOS on 2020/6/5.
//  Copyright © 2020 iOS. All rights reserved.
//

import UIKit

public protocol AvatarFormableRow: FormableRow {
    
    func formTextLabel() -> UILabel?
    func formLeftImageView() -> UIImageView?
    func formAvatarView() -> UIImageView?
}

open class AvatarRowFormer<T: UITableViewCell> : BaseRowFormer<T>, Formable where T: AvatarFormableRow {
 
    open var title: String?
    open var leftImage: UIImage?
    open var avatarImage: UIImage?
    open var textDisabledColor: UIColor? = .lightGray
    
    private final var textColor: UIColor?
    
    open override func initialized() {
        super.initialized()
        rowHeight = 60
    }
    
    open override func cellInitialized(_ cell: T) {
        super.cellInitialized(cell)
        let leftImageView = cell.formLeftImageView()
        leftImageView?.image = leftImage
    }
    
    open override func update() {
        super.update()
        
        let textLabel = cell.formTextLabel()
        let avatarView = cell.formAvatarView()
        textLabel?.text = title
        avatarView?.image = avatarImage
        
        if enabled {
            _ = textColor.map { textLabel?.textColor = $0 }
            textColor = nil
        } else {
            if textColor == nil { textColor = textLabel?.textColor ?? .black }
            textLabel?.textColor = textDisabledColor
        }
    }
}
