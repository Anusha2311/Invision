//
//  tagsCollectionViewCell.swift
//  InvisionApp
//
//  Created by Anusha on 12/30/16.
//  Copyright © 2016 Rare Mile. All rights reserved.
//

import UIKit

class tagsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var tagView: UIView!
    @IBOutlet weak var tagsPercent: UILabel!
    @IBOutlet weak var tagsText: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        if let tagView = tagView {
//            tagView.layer.cornerRadius = tagView.frame.size.height/2 - 3
//            tagView.layer.borderColor = UIColor.blueColor().CGColor
//            tagView.layer.borderWidth = 2.0
            tagView.layer.cornerRadius = 17
            tagView.layer.borderColor = UIColor.darkGrayColor().CGColor
            tagView.layer.borderWidth = 2.0
        }
        
        // self.layer.cornerRadius = 3
        // Initialization code
    }
    
    
    static func nibName() -> String {
        return "tagsCollectionViewCell"
    }
    
    static func nib() -> UINib {
        return UINib(nibName: self.nibName(), bundle:nil)
    }
    
    static func cellIdentifier() -> String {
        return "tagsCollectionViewCell"
    }

}
