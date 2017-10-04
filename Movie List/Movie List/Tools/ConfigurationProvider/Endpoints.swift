//
//  Endpoints.swift
//  Movie List
//
//  Created by Gerlandio Da Silva Lucena on 02/10/17.
//  Copyright © 2017 GerlandioLucena. All rights reserved.
//

import UIKit

struct Endpoints {
    static let BaseUrl = "\(ConfigurationProvider.sharedInstance().get(tag: "SCHEME") ?? "desenv").baseURL",
    ApiKey = "\(ConfigurationProvider.sharedInstance().get(tag: "SCHEME") ?? "desenv").apiKey",
    ImageUrl = "\(ConfigurationProvider.sharedInstance().get(tag: "SCHEME") ?? "desenv").imageURL",
    upcoming = "endpoints.movieListUpcoming",
    toprated = "endpoints.movieListTopRated",
    popular = "endpoints.movieListPopular",
    playing = "endpoints.movieListPlaying",
    recents = "endpoints.movieListRecents",
    similar = "endpoints.movieListSimilar",
    detail = "endpoints.movieDetail",
    search = "endpoints.movieSearch"
}

