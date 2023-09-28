//
//  PageViewController.swift
//  PodcastApp
//
//  Created by Aleksandr Garipov on 27.09.2023.
//

class PageViewController: CustomViewController<PageView> {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewDelegate()
    }
    
    //MARK: - Methods
    
    private func setupViewDelegate() {
        guard let pageView = self.view as? PageView else { return }
        pageView.delegate = self
    }
}

extension PageViewController: PageViewDelegate {
    func skipButtonPressed() {
        print("skipButton pressed")
    }
    
    func nextButtonPressed() {
        print("nextButton pressed")
    }
}
