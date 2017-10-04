//
//  MovieDetailViewController.swift
//  Movie List
//
//  Created by Gerlandio Da Silva Lucena on 03/10/17.
//  Copyright © 2017 GerlandioLucena. All rights reserved.
//

import UIKit
import SDWebImage

class MovieDetailViewController: UIViewController {

    @IBOutlet weak var imagePoster: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieReleaseDate: UILabel!
    @IBOutlet weak var movieDuration: UILabel!
    @IBOutlet weak var movieRelease: UILabel!
    @IBOutlet weak var movieGenre: UILabel!
    
    var movieDetail: MovieDetail? {
        didSet {
            reloadData()
        }
    }
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reloadData()
        loadMoviewDetail()
    }
    
    func reloadData() {
        if let imageUrl:String = ConfigurationProvider.sharedInstance().get(tag: Endpoints.ImageUrl) {
            let posterPath = movieDetail?.posterPath ?? movie?.posterPath
            let finalImageUrl = "\(imageUrl)\(posterPath ?? "")"
            if let urlImage = URL(string:finalImageUrl) {
                imagePoster.sd_setImage(with: urlImage)
            }
        }
        
        movieTitle.text = movieDetail?.title ?? movie?.title
        self.navigationItem.title = movieDetail?.title ?? movie?.title
        if let dateRelease = movieDetail?.releaseDate ?? movie?.releaseDate {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            if let date = dateFormatter.date(from: dateRelease) {
                dateFormatter.dateFormat = "dd/MM/yyyy"
                movieReleaseDate.text = dateFormatter.string(from: date)
            }
        }
        movieDuration.text = "\(movieDetail?.runtime ?? 0) min."
        movieRelease.text = movieDetail?.overview ?? ""
        if let genreList: [String] = movieDetail?.genres?.map({ $0.name ?? "" }) {
            movieGenre.text = genreList.joined(separator: ",")
        }
    }
}

extension MovieDetailViewController {
    
    func loadMoviewDetail() {
        MovieDetailRequest().detail(movieId: movie?.id ?? 0, sucess: { (responseMovie, message) in
            if let response = responseMovie as? MovieDetail {
                self.movieDetail = response
            }
        })
    }
}
