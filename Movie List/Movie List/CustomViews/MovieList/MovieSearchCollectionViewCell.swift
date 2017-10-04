//
//  MovieSearchCollectionViewCell.swift
//  Movie List
//
//  Created by Gerlandio Da Silva Lucena on 03/10/17.
//  Copyright © 2017 GerlandioLucena. All rights reserved.
//

import UIKit

class MovieSearchCollectionViewCell: MovieCollectionViewCell {
    
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieReleaseDate: UILabel!
    
    override func loadInformation() {
        super.loadInformation()
        
        movieTitle.text = movie?.title ?? ""
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        if let dateRelease = movie?.releaseDate, let date = dateFormatter.date(from: dateRelease) {
            dateFormatter.dateFormat = "dd/MM/yyyy"
            let dateString = dateFormatter.string(from: date)
            movieReleaseDate.text = dateString
        }
    }
}
