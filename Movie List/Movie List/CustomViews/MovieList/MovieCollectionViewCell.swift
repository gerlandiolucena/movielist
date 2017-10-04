//
//  MovieCollectionViewCell.swift
//  Movie List
//
//  Created by Gerlandio Da Silva Lucena on 02/10/17.
//  Copyright © 2017 GerlandioLucena. All rights reserved.
//

import UIKit
import SDWebImage

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    static let identifierCell = "movieCollectionViewCell"
    
    var movie: Movie? {
        didSet{
            loadInformation()
        }
    }
    
    func loadInformation() {
        if let imageUrl:String = ConfigurationProvider.sharedInstance().get(tag: Endpoints.ImageUrl) {
            let finalImageUrl = "\(imageUrl)\(movie?.posterPath ?? "")"
            if let urlImage = URL(string:finalImageUrl) {
                image.sd_setImage(with: urlImage)
            }
        }
    }
}
