//
//  Collection+TableViewController.swift
//  SwipeDemo
//
//  Created by Jamie Chen on 2019/5/26.
//  Copyright © 2019 Jamie Chen. All rights reserved.
//

import UIKit

class Collection_TableViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    typealias Datas = (name: String, image: UIImage)
    
    let source: [Datas] = [("喵", #imageLiteral(resourceName: "cat")), ("狗狗狗", #imageLiteral(resourceName: "cogi")), ("咖波", #imageLiteral(resourceName: "carpo"))]
    private var currentIndex: Int = 0 {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = 0
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: 240)
        
        collectionView.collectionViewLayout = flowLayout
        
//        self.collectionView.register(SwipeCell.self, forCellWithReuseIdentifier: "SwipeCell")
    }
}

extension Collection_TableViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return source.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SwipeCell", for: indexPath) as! SwipeCell
        cell.imageView.image = source[indexPath.item].image
        return cell
    }
}

extension Collection_TableViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        print("didEndDisplaying", indexPath.item)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        print("willDisplay", indexPath.item)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let frame = CGRect(origin: collectionView.contentOffset, size: collectionView.bounds.size)
        
        let visiblePoint = CGPoint(x: frame.midX, y: frame.midY)
        
        guard let index = collectionView.indexPathForItem(at: visiblePoint)?.item else { return }
        
        self.currentIndex = index
        
    }
}

extension Collection_TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if currentIndex == 0 {
            return 15
        } else if currentIndex == 1 {
            return 12
        }
        
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        
        cell.textLabel?.text = source[currentIndex].name + String(indexPath.row + 1)
        return cell
    }
    
    
}
