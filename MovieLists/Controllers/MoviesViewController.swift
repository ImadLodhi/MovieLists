//
//  MoviesViewController.swift
//  MovieLists
//
//  Created by intern4 on 3/12/18.
//  Copyright © 2018 kazekage. All rights reserved.
//

import UIKit

class MoviesViewController: UITableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    var movies = [Movie]()
    var filteredMovies = [Movie]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        Movie.fetchMovies { [weak self] (movies) in
            self?.movies  = movies
        }
        
        filteredMovies = movies
        
    }
    
}

extension MoviesViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredMovies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let movieCell = tableView.dequeueReusableCell(withIdentifier: MovieViewCell.reuseIdentifier) as? MovieViewCell else {
            return UITableViewCell()
        }
        
        movieCell.movie = filteredMovies[indexPath.row]
        
        return movieCell
    }
}

extension MoviesViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            filteredMovies = movies
            tableView?.reloadData()
            return
        }
        
        filteredMovies = movies.filter({ movie -> Bool in
            movie.name.lowercased().contains(searchText.lowercased())
        })
        tableView?.reloadData()
    }
}









