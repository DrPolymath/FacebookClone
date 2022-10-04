//
//  HomeTableViewCell.swift
//  FacebookClone
//
//  Created by Muhammad Zikri Mohd Yunan on 19/09/2022.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageButton: UIButton!
    
    @IBOutlet weak var profileNameLabel: UILabel!
    
    @IBOutlet weak var postDateLabel: UILabel!
    
    @IBOutlet weak var postMessageLabel: UILabel!
    
    @IBOutlet weak var likeNumberLabel: UILabel!
    
    @IBOutlet weak var commentShareNumbersLabel: UILabel!
    
    @IBOutlet weak var postImages: UICollectionView!
    
    @IBOutlet weak var likeButton: UIButton!
    
    @IBOutlet weak var commentButton: UIButton!
    
    @IBOutlet weak var shareButton: UIButton!
}
