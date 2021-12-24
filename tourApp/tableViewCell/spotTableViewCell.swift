//
//  spotTableViewCell.swift
//  tourApp
//
//  Created by 김주영 on 2021/12/23.
//

import UIKit
import Alamofire
import AlamofireImage

class spotTableViewCell: UITableViewCell {

    
    @IBOutlet weak var spotImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var telnoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView?.af_cancelImageRequest()
        imageView?.image = nil
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        spotImage.layer.cornerRadius = 10
        // Configure the view for the selected state
    }
    
    func setData(data: detail) {
        nameLabel.text = data.tourNm
        addressLabel.text = data.adres
        telnoLabel.text = data.telno
        genreLabel.text = data.tourSe
        
        let url = URL(string: data.tourImg!)
        let xurl = URL(string: "https://tour.chungbuk.go.kr/site/www/images/common/no_img.jpg")
        spotImage.load(url: url ?? xurl!)
    }
}

extension UIImageView { func load(url: URL) { DispatchQueue.global().async { [weak self] in if let data = try? Data(contentsOf: url) { if let image = UIImage(data: data) { DispatchQueue.main.async { self?.image = image } } } } } }
