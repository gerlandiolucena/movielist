//
//  ViewController.swift
//  Movie List
//
//  Created by Gerlandio Da Silva Lucena on 30/09/17.
//  Copyright © 2017 GerlandioLucena. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var movieListToLoad = [(labelText: String, endpoint: String)]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        populateMoviesList()
        tableView.reloadData()
    }
    
    func setupView() {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 180.0
    }
    
    func populateMoviesList() {
        movieListToLoad.append((labelText: "Upcoming", endpoint: Endpoints.upcoming))
        movieListToLoad.append((labelText: "Playing", endpoint: Endpoints.playing))
        movieListToLoad.append((labelText: "Popular", endpoint: Endpoints.popular))
        movieListToLoad.append((labelText: "Top Rated", endpoint: Endpoints.toprated))
    }
}

extension MovieListViewController: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}

extension MovieListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: MovieListTableViewCell.identifierCell) as? MovieListTableViewCell {
            cell.detailInformation = movieListToLoad[indexPath.row]
            cell.delegate = self
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieListToLoad.count
    }
}

extension MovieListViewController: MovieListTableViewDelegate {
    
    func didSelect(movie: Movie) {
        self.performSegue(withIdentifier: "showDetail", sender: movie)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailViewController = segue.destination as? MovieDetailViewController {
            detailViewController.movie = sender as? Movie
        }
    }
}

