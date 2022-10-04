//
//  HomeViewController.swift
//  FacebookClone
//
//  Created by Muhammad Zikri Mohd Yunan on 19/09/2022.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var homeTableView: UITableView!
    
    var posts:Array<PostModel> = []
    
    var pictures = ["cat1", "cat2", "cat3", "cat4", "cat5", "cat6"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        posts.append(PostModel.init(profileImage: "man1", name: "Ahmad Fitri", postDate: "7d", postMessage: "Developing facebook", likes: "322", comments: "32", shares: "92"))
        posts.append(PostModel.init(profileImage: "man2", name: "Ahmad Badrul", postDate: "4d", postMessage: "Testing out facebook", likes: "432", comments: "12", shares: "45"))
        posts.append(PostModel.init(profileImage: "man1", name: "Muhammad Khairul", postDate: "1d", postMessage: "Deploying facebook", likes: "402", comments: "42", shares: "85"))

        self.homeTableView.register(UINib(nibName: "HomeTableViewHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "header")
        
        self.homeTableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        self.homeTableView.delegate = self
        self.homeTableView.dataSource = self
    }

}

//Mark: Tableview and Collectionview delegate and datasource
extension HomeViewController: UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? HomeTableViewCell {
            
            cell.postImages.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cell")
            
            cell.postImages.delegate = self
            cell.postImages.dataSource = self
            
            
            cell.profileImageButton.setImage(UIImage(named: self.posts[indexPath.row].profileImage!), for: .normal)
            cell.profileNameLabel.text = self.posts[indexPath.row].name
            cell.postDateLabel.text = self.posts[indexPath.row].postDate
            cell.postMessageLabel.text = self.posts[indexPath.row].postMessage
            cell.likeNumberLabel.text = self.posts[indexPath.row].likes
            cell.commentShareNumbersLabel.text = self.posts[indexPath.row].comments! + " comments . " + self.posts[indexPath.row].shares! + " shares"
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as! HomeTableViewHeaderView
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 120
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pictures.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCollectionViewCell
        cell.postImage.image = UIImage(named: pictures[indexPath.row])
        return cell
    }
    
    /// 1
    func collectionView(_ collectionView: UICollectionView,
                  layout collectionViewLayout: UICollectionViewLayout,
                  insetForSectionAt section: Int) -> UIEdgeInsets {
        /// 2
        return UIEdgeInsets(top: 1.0, left: 8.0, bottom: 1.0, right: 8.0)
    }

    /// 3
    func collectionView(_ collectionView: UICollectionView,
                   layout collectionViewLayout: UICollectionViewLayout,
                   sizeForItemAt indexPath: IndexPath) -> CGSize {
        /// 4
        let lay = collectionViewLayout as! UICollectionViewFlowLayout
        
        if (indexPath.row == 0) {
            let firstHeight = collectionView.frame.height - lay.minimumInteritemSpacing
            /// 6
            let firstWidth = view.frame.size.width * 2 / 3 - lay.minimumInteritemSpacing
            return CGSize(width: firstWidth, height: firstHeight)
        } else {
            /// 5
            let heightPerItem = collectionView.frame.height / 2 - lay.minimumInteritemSpacing
            /// 6
            let width = view.frame.size.width / 3 - lay.minimumInteritemSpacing
            return CGSize(width: width, height: heightPerItem)
        }
        
    }
    
}
