//
//  ApiMovieListConverter.swift
//  CleanRxiOSCinema
//
//  Created by Cláudio Ribeiro on 11/02/2017.
//  Copyright © 2017 Cláudio Ribeiro. All rights reserved.
//

import Foundation

class ApiMovieListConverter {
    
    func map(movie: ApiMovie) -> ListMovieModel {
        
        var url = ImageUrlProvider.sharedInstance.getUrlFor(size: .w300);
        
        if url != nil {
            url = url! + movie.backdrop_path!;
        }
        
        return ListMovieModelBuilder()
                        .Init()
                        .withId(id: movie.id!)
                        .withTitle(title: movie.title!)
                        .withImagePath(path: url!)
                        .withPopularity(popularity: movie.popularity!)
                        .withVotesAvg(votesAvg: movie.vote_average!)
                        .build();
    }
    
}
