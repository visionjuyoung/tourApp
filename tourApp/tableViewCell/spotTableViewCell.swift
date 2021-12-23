//
//  spotTableViewCell.swift
//  tourApp
//
//  Created by 김주영 on 2021/12/23.
//

import UIKit

class spotTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var telnoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(data: (TourInfoResponse), index: Int) {
        nameLabel.text = data.result[index].tourNm
        addressLabel.text = data.result[index].adres
        telnoLabel.text = data.result[index].telno
        genreLabel.text = data.result[index].tourSe
    }
    
}
