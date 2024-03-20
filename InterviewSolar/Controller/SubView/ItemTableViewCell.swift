//
//  ItemTableViewCell.swift
//  InterviewSolar
//
//  Created by Titi3012 on 19/03/2024.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    var upImageViewClick : (() -> (Void))!
    @IBOutlet weak var constraintHeightTitleView: NSLayoutConstraint!
    @IBOutlet weak var TitleView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var upImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        upImageView.addGestureRecognizer(tap)
        upImageView.isUserInteractionEnabled = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.addShadow(radius: 8.0, color: (UIColor(named: "backgroundShadow")?.withAlphaComponent(0.16))!, offset: .init(width: 0, height: 0), opacity: 0.5)
        
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        upImageViewClick()
    }
        
    func setFontTitle() {
        titleLabel.font = UIFont.systemFontCompactDisplay(.medium)
        descriptionLabel.font = UIFont.systemFontCompactDisplay(.regular,size: 15)
    }
    
    func setupData(_ data : Instruct) {
        upImageView.image = data.collapsed ?? false ?  UIImage(named: "ic_up") : UIImage(named: "ic_down")
        titleLabel.text = "\((data.index ?? 0) + 1). \(data.title ?? "")"
        descriptionLabel.text = data.description
        if data.collapsed ?? false {
            descriptionLabel.isHidden = false
        }
        else {
            descriptionLabel.isHidden = true
        }
    }
    
}
