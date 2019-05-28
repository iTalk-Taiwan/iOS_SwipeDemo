//
//  SwipePageViewController.swift
//  SwipeDemo
//
//  Created by Jamie Chen on 2019/5/26.
//  Copyright © 2019 Jamie Chen. All rights reserved.
//

import UIKit

class SwipePageViewController: UIPageViewController {
    let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
    let vcNames: [String] = ["redVC", "blueVC", "greenVC"]
    lazy var vcList: [UIViewController] = {
        self.vcNames.map({
            mainStoryboard.instantiateViewController(withIdentifier: $0)
        })
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        
        if let firstVC = vcList.first {
            self.setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    }
}

extension SwipePageViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = vcList.firstIndex(of: viewController) else { return nil }
        let previousIndex = index - 1
        guard previousIndex >= 0 else {
            return vcList.last
        }
        
        guard vcList.count > previousIndex else { return nil }
        
        return vcList[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = vcList.firstIndex(of: viewController) else { return nil }
        let nextIndex = index + 1
        
        guard nextIndex < vcList.count else {
            return vcList.first
        }
        
        guard vcList.count > nextIndex else { return nil }
        
        return vcList[nextIndex]
    }
    
    
}
