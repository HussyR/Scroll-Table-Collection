//
//  ViewControllerWithScrollView.swift
//  TableViewAutoSize+ScrollView+CollectionView
//
//  Created by Данил on 30.01.2022.
//

import UIKit

class ViewControllerWithScrollView: UIViewController {

    //MARK: ScrollView должна знать свои размеры ширины и длины, чтобы производить скролл
    
    let contentView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .yellow
        return view
    }()
    
    let view1 : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .red
        return view
    }()
    
    let view2 : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green
        return view
    }()
    
    let view3 : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    
    let scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .lightGray
        return scrollView
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "image")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let label1: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Long texts (longreads), where big size combines with in-depth reporting, are becoming increasingly popular in print and online media, because these texts enable the publication to stand out against the information noise. The aims of this research are to identify the popularity of longreads in the Russian media and their content and compositional particularities. The research includes the monitoring of Russian federal publications and subsequent content analysis of 10 articles issued in 10 print and online publications. The key findings of the research indicate that longreads can be found in publications of different types from daily newspapers to niche news sites. As a rule, the texts are devoted to a description of a new phenomenon, their normal size being 2−4 thousand words. The usual longread composition scheme is an alternation of examples and generalizations."
        return label
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
    
    private func setupViewsInScroll() {
        scrollView.addSubview(contentView)
        contentView.addSubview(view1)
        contentView.addSubview(view2)
        contentView.addSubview(view3)
        contentView.addSubview(label1)
        contentView.addSubview(imageView)
        
        //MARK: Указываю height у view, так как у них нету intristic Content Size
        
        NSLayoutConstraint.activate([
            //MARK: ОБЯЗательная строка, чтобы contentView смог вычислить размер
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            //MARK: ОБЯЗательная строка, чтобы contentView смог вычислить размер
            contentView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor),
            
            view1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            view1.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 100),
            view1.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            view1.heightAnchor.constraint(equalToConstant: 300),
            
            view2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            view2.topAnchor.constraint(equalTo: view1.bottomAnchor, constant: 100),
            view2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            view2.heightAnchor.constraint(equalToConstant: 300),
            
            view3.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            view3.topAnchor.constraint(equalTo: view2.bottomAnchor, constant: 100),
            view3.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            view3.heightAnchor.constraint(equalToConstant: 300),

//            view3.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -100)
            
            label1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            label1.topAnchor.constraint(equalTo: view3.bottomAnchor, constant: 100),
            label1.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
//            label1.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -100),
            
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            imageView.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 100),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            //MARK: ОБЯЗательная строка, чтобы contentView смог вычислить размер
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -100),
        ])
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
        setupViewsInScroll()
    }
}

