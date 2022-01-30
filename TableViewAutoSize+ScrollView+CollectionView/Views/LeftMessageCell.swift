//
//  LeftMessageCell.swift
//  TableViewAutoSize+ScrollView+CollectionView
//
//  Created by Данил on 30.01.2022.
//

import UIKit

class LeftMessageCell: BaseCell {

    
    override func configureLayout() {
        super.configureLayout()
        NSLayoutConstraint.activate([
            bubbleImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            bubbleImageView.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -20),
            bubbleImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            bubbleImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            
            messageLabel.leadingAnchor.constraint(equalTo: bubbleImageView.leadingAnchor, constant: 20),
            messageLabel.topAnchor.constraint(equalTo: bubbleImageView.topAnchor, constant: 5),
            messageLabel.trailingAnchor.constraint(equalTo: bubbleImageView.trailingAnchor, constant: -10),
            messageLabel.bottomAnchor.constraint(equalTo: bubbleImageView.bottomAnchor, constant: -5)
        ])
        
        let insets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 10)
        let image = UIImage(named: blueBubbleImageName)!
          .imageFlippedForRightToLeftLayoutDirection()
        bubbleImageView.image = image.resizableImage(
          withCapInsets: insets,
          resizingMode: .stretch)
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
