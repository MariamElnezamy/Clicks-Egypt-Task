//
//  CardTableViewCell.swift
//  Clicks Egypt Task
//
//  Created by Admin on 26/08/2021.
//

import UIKit
import Kingfisher

class CardTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageCard: UIImageView!
    @IBOutlet weak var titleCard: UILabel!
    @IBOutlet weak var sourceName: UILabel!
    @IBOutlet weak var backgroudCardView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageCard.contentMode = .scaleAspectFill
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bind (artical: Articles?) {
        titleCard.text = artical?.title
        sourceName.text = artical?.source?.name
        let url = Foundation.URL(string: artical?.urlToImage ?? "")
        imageCard.kf.indicatorType = .activity
        imageCard.kf.setImage(with: url)
        DispatchQueue.main.async {
            self.backgroudCardView.roundCorners(corners: [.bottomRight, .bottomLeft], radius: 15)
            self.getShadow(yourView: self.backgroudCardView)

        }

    }
}
