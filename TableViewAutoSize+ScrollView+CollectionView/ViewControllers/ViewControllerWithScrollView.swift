//
//  ViewControllerWithScrollView.swift
//  TableViewAutoSize+ScrollView+CollectionView
//
//  Created by Данил on 30.01.2022.
//

import UIKit

class ViewControllerWithScrollView: UIViewController {

    let scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .lightGray
        return scrollView
    }()
    //MARK: frameLayoutGuide для расположения scrollView относительно superView
    //MARK: contentLayoutguide для раположения элементов внутри scroll
    private func setupScrollView() {
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.frameLayoutGuide.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.frameLayoutGuide.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.frameLayoutGuide.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.frameLayoutGuide.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
    }
}

