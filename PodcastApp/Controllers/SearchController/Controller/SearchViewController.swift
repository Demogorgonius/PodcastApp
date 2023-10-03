//
//  SearchViewController.swift
//  PodcastApp
//
//  Created by Sergey on 25.09.2023.
//
import UIKit
import SnapKit
import PodcastIndexKit

class SearchViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    let podcastIndexKit = PodcastIndexKit()
    let searchView = SearchView()
    var categoriesArray: CategoriesResponse? {
        didSet {
            searchView.categoriesCollectionView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        fetchData()
        
        
        let gradientLayer = CAGradientLayer()
        let colors = [UIColor.redSearch, UIColor.hexadecimal]
           gradientLayer.colors = colors.map { $0.cgColor }
           gradientLayer.frame = view.bounds
        gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
           view.layer.insertSublayer(gradientLayer, at: 0)
        
        
        view.addSubview(searchView)
        searchView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalTo(view)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        setupCollectionViewDelegate(searchView.genresCollectionView)
        setupCollectionViewDelegate(searchView.categoriesCollectionView)
        
        searchView.seeAllButton.addTarget(self, action: #selector(seeAllAction), for: .touchUpInside)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    @objc func seeAllAction() {
        let vc = TopGenresViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    private func setupCollectionViewDelegate(_ collectionView: UICollectionView) {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    private func fetchData() {
        Task {
            do {
                let categories = try await podcastIndexKit.categoriesService.list()
                categoriesArray = categories
            } catch {
                print("Произошла ошибка: \(error)")
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == searchView.genresCollectionView {
            return 10
        } else {
            return categoriesArray?.count ?? 2
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCell.identifier, for: indexPath) as! SearchCell
        
        if collectionView == searchView.genresCollectionView {
            cell.configure(with: TopGenresModel.topGenres[indexPath.row])
        } else {
            cell.configure(with: categoriesArray?.feeds?[indexPath.row].name ?? "")
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 64 - 10)/2
        let height = 0.57 * width
        return CGSize(width: width, height: height)
    }
    
}
