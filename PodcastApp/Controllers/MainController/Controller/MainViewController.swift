//
//  MainViewController.swift
//  PodcastApp
//
//  Created by Sergey on 25.09.2023.
//

import UIKit

class MainViewController: UIViewController {
    let mainCollectionView = MainCollection()
    let mainProfileView = MainProfileView()
    let mainSeeAllView = MainSeeAllView()
     override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
         setupCollectionViewDelegate(mainCollectionView.topHorizontalCollectionView1)
         setupCollectionViewDelegate(mainCollectionView.topHorizontalCollectionView2)
         setupCollectionViewDelegate(mainCollectionView.bottomVerticalCollectionView)
        setupMainProfileView()
        setupMainSeeAllView()
        setupMainCollectionView()
        configureSeeAllButtons()
         makeFirstCellActive()
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setupMainCollectionView() {
        view.addSubview(mainCollectionView)
        mainCollectionView.snp.makeConstraints { make in
            make.top.equalTo(mainSeeAllView.snp.bottom)
            make.leading.equalTo(view)
            make.trailing.equalTo(view)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
    }
    private func setupMainProfileView() {
        view.addSubview(mainProfileView)
        mainProfileView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(30)
            make.leading.equalTo(view).offset(32)
            make.trailing.equalTo(view).inset(32)
            make.height.equalTo(50)
        }
    }
    
    private func setupMainSeeAllView() {
        view.addSubview(mainSeeAllView)
        mainSeeAllView.snp.makeConstraints { make in
            make.top.equalTo(mainProfileView.snp.bottom).offset(35)
            make.leading.equalTo(view).offset(32)
            make.trailing.equalTo(view).inset(32)
            make.height.equalTo(44)
        }
    }
    
    @objc func seeAllButtonWasTapped() {
        let viewController = SearchViewController()
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func configureSeeAllButtons() {
        mainSeeAllView.seeAllButton.addTarget(self, action: #selector(seeAllButtonWasTapped), for: .touchUpInside)
    }

    func setupCollectionViewDelegate(_ collectionView: UICollectionView) {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
    }
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == mainCollectionView.topHorizontalCollectionView1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
            
            cell.setupCategoryCell(
                topLbl: "Name Of Categorys",
                bottomLbl: "94 podcasts")
            
            if indexPath.row % 2 == 0 {
                        cell.layer.backgroundColor = UIColor.palePink.withAlphaComponent(0.5).cgColor
                    } else {
                        cell.layer.backgroundColor = UIColor.ghostWhite.withAlphaComponent(0.5).cgColor
                    }
            return cell
        } else if collectionView == mainCollectionView.topHorizontalCollectionView2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryNameCell", for: indexPath) as! CategoryNameCell
            let categoryArray = AppCategoryModel.categoryNames
            let name = categoryArray[indexPath.row]
            cell.setupCategoryNameCell(with: name)
            return cell
        } else if collectionView == mainCollectionView.bottomVerticalCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PodcastCell", for: indexPath) as! PodcastCell
            cell.setupPodcastCell(titleLeft: "LeftTitle",
                                  titleRight: "RightTitle",
                                  descriptionLeft: "Left",
                                  descriptionRight: "Right",
                                  image: UIImage(systemName: "person.fill"),
                                  cellType: .podcast)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == mainCollectionView.topHorizontalCollectionView1 {
            return CGSize(width: 144, height: 85)
        } else if collectionView == mainCollectionView.topHorizontalCollectionView2 {
            let text = AppCategoryModel.categoryNames[indexPath.row]
            let cellWidth = text.size(withAttributes: [.font: UIFont.systemFont(ofSize: 16)]).width + 40
            return CGSize(width: cellWidth, height: 44)
        } else if collectionView == mainCollectionView.bottomVerticalCollectionView {
            return CGSize(width: collectionView.layer.frame.width, height: 72)
        }
        return CGSize(width: 144, height: 72)
    }
    
    func makeFirstCellActive() {
      let firstIndexPath = IndexPath(item: 0, section: 0)
        mainCollectionView.topHorizontalCollectionView2.selectItem(at: firstIndexPath, animated: false, scrollPosition: .centeredHorizontally)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == mainCollectionView.bottomVerticalCollectionView {
            return UIEdgeInsets(top: 0, left: 32, bottom: 0, right: 32)
        } else {
            return UIEdgeInsets(top: 0, left: 32, bottom: 0, right: 0)
        }
      }
}
