//
//  FilterMoviesViewController.swift
//  Movie List
//
//  Created by Gerlandio Da Silva Lucena on 03/10/17.
//  Copyright © 2017 GerlandioLucena. All rights reserved.
//

import UIKit

class FilterMoviesViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var movieList: MovieList? {
        didSet {
            collectionView.reloadData()
        }
    }
    var searchController: UISearchController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

extension FilterMoviesViewController {
    
    func filter(with: String = "") {
        MovieSearchRequest().search(parameters: ["query": with], sucess: { (responseMovies, message) in
            if let movieListResponse = responseMovies as? MovieList {
                self.movieList = movieListResponse
            }
        })
    }
    
    func setupView() {
        setupSearchBar()
        showSearchField()
        filter()
    }
    
    func setupSearchBar() {
        searchController = UISearchController(searchResultsController: nil)
        searchController?.delegate = self
        searchController?.hidesNavigationBarDuringPresentation = true
        searchController?.dimsBackgroundDuringPresentation = true
        searchController?.searchBar.delegate = self
        searchController?.searchBar.tintColor = UIColor.white
        searchController?.searchBar.barTintColor = UIColor.darkGray
        self.definesPresentationContext = true
    }
    
    @IBAction func showSearchField() {
        if let searchController = searchController {
            self.present(searchController, animated: true, completion: nil)
        }
    }
    
    @IBAction func dismisssView() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension FilterMoviesViewController: UISearchControllerDelegate, UISearchBarDelegate {
    
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        filter(with: searchBar.text ?? "")
        self.searchController?.dismiss(animated: true, completion: nil)
    }
    
    func didDismissSearchController(_ searchController: UISearchController) {
        self.navigationItem.titleView = nil
    }
}

extension FilterMoviesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.size.width / 3) - 10, height: 200.0)
    }
}

extension FilterMoviesViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let movie = self.movieList?.results?[indexPath.item] {
            didSelect(movie: movie)
        }
    }
}

extension FilterMoviesViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieList?.results?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieSearchCollectionViewCell.identifierCell, for: indexPath) as? MovieSearchCollectionViewCell {
            cell.movie = self.movieList?.results?[indexPath.item]
            return cell
        }
        return UICollectionViewCell()
    }
}

extension FilterMoviesViewController {
    
    func didSelect(movie: Movie) {
        self.performSegue(withIdentifier: "showDetail", sender: movie)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailViewController = segue.destination as? MovieDetailViewController {
            detailViewController.movie = sender as? Movie
        }
    }
}
