//
//  MovieListTableViewCell.swift
//  Movie List
//
//  Created by Gerlandio Da Silva Lucena on 02/10/17.
//  Copyright © 2017 GerlandioLucena. All rights reserved.
//

import UIKit

protocol MovieListTableViewDelegate {
    func didSelect(movie: Movie)
}

class MovieListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var labelInformation: UILabel!
    static let identifierCell = "movieListTableViewCell"
    var delegate: MovieListTableViewDelegate?
    
    var movieList: MovieList? {
        didSet{
            self.collectionView.reloadData()
        }
    }
    
    var detailInformation: (labelText: String, endpoint: String)? {
        didSet {
            loadData()
        }
    }
    
    func loadData() {
        if let detail = detailInformation {
            labelInformation.text = detail.labelText
            
            MovieRequest(endpointString: detail.endpoint).list(parameters: [:], sucess: { (response, message) in
                if let movies = response as? MovieList, movies.results?.count ?? 0 > 0 {
                    self.movieList = movies
                }
            })
        }
    }
}

extension MovieListTableViewCell: UICollectionViewDelegate {
 
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let movie = self.movieList?.results?[indexPath.item] {
            self.delegate?.didSelect(movie: movie)
        }
    }
}

extension MovieListTableViewCell: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieList?.results?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionViewCell.identifierCell, for: indexPath) as? MovieCollectionViewCell {
            cell.movie = self.movieList?.results?[indexPath.item]
            return cell
        }
        return UICollectionViewCell()
    }
}

extension MovieListTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.size.width / 3) - 10, height: 180.0)
    }
}
