//
//  OnboardingViewController.swift
//  PodcastApp
//
//  Created by Aleksandr Garipov on 27.09.2023.
//
import UIKit

class OnboardingViewController: UIPageViewController {
    
    //MARK: - Properties
    
    let pageControllers = [PageViewController(), ProfileViewController(), FavoritesViewController()]
    
    //MARK: - Life Cycle
    
    init() {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        settingPageViewController()
    }
    
    //MARK: - Methods
    
    private func settingPageViewController() {
        dataSource = self
        guard let firstVC = pageControllers.first else { return }
        setViewControllers([firstVC], direction: .forward, animated: true)
    }
}

//MARK: - UIPageViewControllerDataSource

extension OnboardingViewController: UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pageControllers.firstIndex(of: viewController) else { return nil }
        
        let nextIndex = currentIndex + 1
        if nextIndex < pageControllers.count {
            return pageControllers[nextIndex]
        } else {
            return pageControllers[0]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = pageControllers.firstIndex(of: viewController) else { return nil }
        let previousIndex = currentIndex - 1
        if previousIndex >= 0 {
            return pageControllers[previousIndex]
        } else {
            return pageControllers[pageControllers.count - 1]
        }
    }
}
