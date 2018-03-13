//
//  Movie.swift
//  MovieLists
//
//  Created by intern4 on 3/12/18.
//  Copyright © 2018 kazekage. All rights reserved.
//

import Foundation


class Movie {
    var name = ""
    var director = ""
    var imageURL = ""
    
    static func fetchMovies(completionHandler: ([Movie]) -> ()) {

        let movie1 = Movie()
        movie1.name = "Movie1"
        movie1.director = "Director1"

        let movie2 = Movie()
        movie2.name = "Movie2"
        movie2.director = "Director2"

        let movie3 = Movie()
        movie3.name = "Movie3"
        movie3.director = "Director3"

        completionHandler([movie1, movie2, movie3])
    }
}
