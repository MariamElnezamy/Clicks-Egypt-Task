//
//  DetailsVC.swift
//  Clicks Egypt Task
//
//  Created by Admin on 27/08/2021.
//

import UIKit

class DetailsVC: UIViewController {
    
    
    @IBOutlet weak var imageCard: UIImageView!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var borderView: UIView!
    @IBOutlet weak var titleCard: UILabel!
    @IBOutlet weak var descriptionCard: UILabel!
    var artical: Articles?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleCard.text = artical?.title
        descriptionCard.text = artical?.description
        imageCard.contentMode = .scaleAspectFill
        let url = Foundation.URL(string: artical?.urlToImage ?? "")
        imageCard.kf.indicatorType = .activity
        imageCard.kf.setImage(with: url)
        
        DispatchQueue.main.async {
            self.backgroundView.roundCorners(corners: [.topLeft, .topRight], radius: 30)
            self.borderView.roundCorners(corners: [.topLeft, .topRight], radius: 30)

//            self.backgroundView.addTopBorder(color: UIColor.blue.cgColor, heightBorder: 10)

        }        
    }
    



}
