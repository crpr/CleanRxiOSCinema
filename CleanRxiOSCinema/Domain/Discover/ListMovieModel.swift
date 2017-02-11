//
//  ListMovieModel.swift
//  CleanRxiOSCinema
//
//  Created by Cláudio Ribeiro on 10/02/2017.
//  Copyright © 2017 Cláudio Ribeiro. All rights reserved.
//

import Foundation

struct ListMovieModel {
    var id: Int
    var title: String
    var image_path: String
    var popularity: Double
    var votes_avg: Double
    
    init() {
        self.id = 0;
        self.title = "";
        self.image_path = "";
        self.popularity = 0.0;
        self.votes_avg = 0.0;
    }
}

class ListMovieModelBuilder {
    var model = ListMovieModel();
    
    func Init() -> ListMovieModelBuilder {
        model = ListMovieModel();
        return self;
    }
    
    func withId(id: Int) -> ListMovieModelBuilder {
        model.id = id;
        return self;
    }
    
    func withTitle(title: String) -> ListMovieModelBuilder {
        model.title = title;
        return self;
    }
    
    func withImagePath(path: String) -> ListMovieModelBuilder {
        model.image_path = path;
        return self;
    }
    
    func withPopularity(popularity: Double) -> ListMovieModelBuilder {
        model.popularity = popularity;
        return self;
    }
    
    func withVotesAvg(votesAvg: Double) -> ListMovieModelBuilder {
        model.votes_avg = votesAvg;
        return self;
    }
    
    func build() -> ListMovieModel {
        return model;
    }
}
