//
//  MovieDetail.swift
//  Movie List
//
//  Created by Gerlandio Da Silva Lucena on 03/10/17.
//  Copyright © 2017 GerlandioLucena. All rights reserved.
//

import UIKit
import Mapper

class MovieDetail: Mappable {
    
    private struct SerializationKeys {
        static let budget = "budget"
        static let backdropPath = "backdrop_path"
        static let revenue = "revenue"
        static let voteCount = "vote_count"
        static let overview = "overview"
        static let voteAverage = "vote_average"
        static let video = "video"
        static let imdbId = "imdb_id"
        static let id = "id"
        static let title = "title"
        static let homepage = "homepage"
        static let productionCompanies = "production_companies"
        static let posterPath = "poster_path"
        static let adult = "adult"
        static let genres = "genres"
        static let spokenLanguages = "spoken_languages"
        static let status = "status"
        static let runtime = "runtime"
        static let originalTitle = "original_title"
        static let releaseDate = "release_date"
        static let originalLanguage = "original_language"
        static let popularity = "popularity"
        static let tagline = "tagline"
        static let productionCountries = "production_countries"
    }
    
    public var budget: Int?
    public var backdropPath: String?
    public var revenue: Int?
    public var voteCount: Int?
    public var overview: String?
    public var voteAverage: Float?
    public var video: Bool? = false
    public var imdbId: String?
    public var id: Int?
    public var title: String?
    public var homepage: String?
    public var productionCompanies: [ProductionCompanies]?
    public var posterPath: String?
    public var adult: Bool? = false
    public var genres: [Genres]?
    public var spokenLanguages: [SpokenLanguages]?
    public var status: String?
    public var runtime: Int?
    public var originalTitle: String?
    public var releaseDate: String?
    public var originalLanguage: String?
    public var popularity: Float?
    public var tagline: String?
    public var productionCountries: [ProductionCountries]?
    
    required init(map: Mapper) throws {
        budget = map.optionalFrom(SerializationKeys.budget)
        backdropPath = map.optionalFrom(SerializationKeys.backdropPath)
        revenue = map.optionalFrom(SerializationKeys.revenue)
        voteCount = map.optionalFrom(SerializationKeys.voteCount)
        overview = map.optionalFrom(SerializationKeys.overview)
        voteAverage = map.optionalFrom(SerializationKeys.voteAverage)
        video = map.optionalFrom(SerializationKeys.video)
        imdbId = map.optionalFrom(SerializationKeys.imdbId)
        id = map.optionalFrom(SerializationKeys.id)
        title = map.optionalFrom(SerializationKeys.title)
        homepage = map.optionalFrom(SerializationKeys.homepage)
        productionCompanies = map.optionalFrom(SerializationKeys.productionCompanies)
        posterPath = map.optionalFrom(SerializationKeys.posterPath)
        adult = map.optionalFrom(SerializationKeys.adult)
        genres = map.optionalFrom(SerializationKeys.genres)
        spokenLanguages = map.optionalFrom(SerializationKeys.spokenLanguages)
        status = map.optionalFrom(SerializationKeys.status)
        runtime = map.optionalFrom(SerializationKeys.runtime)
        originalTitle = map.optionalFrom(SerializationKeys.originalTitle)
        releaseDate = map.optionalFrom(SerializationKeys.releaseDate)
        originalLanguage = map.optionalFrom(SerializationKeys.originalLanguage)
        popularity = map.optionalFrom(SerializationKeys.popularity)
        tagline = map.optionalFrom(SerializationKeys.tagline)
        productionCountries = map.optionalFrom(SerializationKeys.productionCountries)
    }
    
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = budget { dictionary[SerializationKeys.budget] = value }
        if let value = backdropPath { dictionary[SerializationKeys.backdropPath] = value }
        if let value = revenue { dictionary[SerializationKeys.revenue] = value }
        if let value = voteCount { dictionary[SerializationKeys.voteCount] = value }
        if let value = overview { dictionary[SerializationKeys.overview] = value }
        if let value = voteAverage { dictionary[SerializationKeys.voteAverage] = value }
        dictionary[SerializationKeys.video] = video
        if let value = imdbId { dictionary[SerializationKeys.imdbId] = value }
        if let value = id { dictionary[SerializationKeys.id] = value }
        if let value = title { dictionary[SerializationKeys.title] = value }
        if let value = homepage { dictionary[SerializationKeys.homepage] = value }
        if let value = productionCompanies { dictionary[SerializationKeys.productionCompanies] = value.map { $0.dictionaryRepresentation() } }
        if let value = posterPath { dictionary[SerializationKeys.posterPath] = value }
        dictionary[SerializationKeys.adult] = adult
        if let value = genres { dictionary[SerializationKeys.genres] = value.map { $0.dictionaryRepresentation() } }
        if let value = spokenLanguages { dictionary[SerializationKeys.spokenLanguages] = value.map { $0.dictionaryRepresentation() } }
        if let value = status { dictionary[SerializationKeys.status] = value }
        if let value = runtime { dictionary[SerializationKeys.runtime] = value }
        if let value = originalTitle { dictionary[SerializationKeys.originalTitle] = value }
        if let value = releaseDate { dictionary[SerializationKeys.releaseDate] = value }
        if let value = originalLanguage { dictionary[SerializationKeys.originalLanguage] = value }
        if let value = popularity { dictionary[SerializationKeys.popularity] = value }
        if let value = tagline { dictionary[SerializationKeys.tagline] = value }
        if let value = productionCountries { dictionary[SerializationKeys.productionCountries] = value.map { $0.dictionaryRepresentation() } }
        return dictionary
    }

}
