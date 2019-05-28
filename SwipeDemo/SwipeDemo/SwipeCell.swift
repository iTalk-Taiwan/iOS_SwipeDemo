//
//  SwipeCell.swift
//  SwipeDemo
//
//  Created by Jamie Chen on 2019/5/26.
//  Copyright © 2019 Jamie Chen. All rights reserved.
//

import UIKit

class SwipeCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}
