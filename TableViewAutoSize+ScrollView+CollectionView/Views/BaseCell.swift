//
//  BaseCell.swift
//  TableViewAutoSize+ScrollView+CollectionView
//
//  Created by Данил on 30.01.2022.
//

import UIKit

class BaseCell: UITableViewCell {
    
    let greenBubbleImageName = "green-bubble"
    let blueBubbleImageName = "blue-bubble"
    
    lazy var messageLabel: UILabel = {
        let messageLabel = UILabel(frame: .zero)
        messageLabel.textColor = .white
        messageLabel.font = UIFont.systemFont(ofSize: 13)
        messageLabel.numberOfLines = 0
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        return messageLabel
    }()
    
    internal var bubbleImageView: UIImageView = {
        let bubbleImageView = UIImageView()
        bubbleImageView.contentMode = .scaleToFill
        bubbleImageView.translatesAutoresizingMaskIntoConstraints = false
        return bubbleImageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureLayout()
    }
    
    func configureBubbleImage(imageName: String, insets: UIEdgeInsets) {
        let image = UIImage(named: imageName)!
        bubbleImageView.image = image.resizableImage(withCapInsets: insets, resizingMode: .stretch)
    }
    
    func configureLayout() {
//        backgroundColor = .lightGray
        contentView.addSubview(bubbleImageView)
        contentView.addSubview(messageLabel)
        
      
        NSLayoutConstraint.activate([
            
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) not implemented")
    }
}
