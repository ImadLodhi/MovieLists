//
//  MovieViewCell.swift
//  MovieLists
//
//  Created by intern4 on 3/12/18.
//  Copyright © 2018 kazekage. All rights reserved.
//

import UIKit

class MovieViewCell: UITableViewCell {

    var movie: Movie? {
        didSet {
            configureView()
        }
    }
    
    static let reuseIdentifier = "MovieCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureView()
    }
    
    func configureView() {
        guard let movie = movie else { return }
        
        textLabel?.text = movie.name
        detailTextLabel?.text = movie.director
    }

}
