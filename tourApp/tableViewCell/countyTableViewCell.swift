//
//  countyTableViewCell.swift
//  tourApp
//
//  Created by 김주영 on 2021/12/23.
//

import UIKit

class countyTableViewCell: UITableViewCell {

    @IBOutlet weak var countyListimageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(data: String) {
        let imageName: String = "\(data)로고"
        countyListimageView.image = UIImage(named: imageName)
    }
    
}
