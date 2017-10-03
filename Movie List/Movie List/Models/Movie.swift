//
//  Movie.swift
//  Movie List
//
//  Created by Gerlandio Da Silva Lucena on 02/10/17.
//  Copyright © 2017 GerlandioLucena. All rights reserved.
//

import Foundation
import Mapper

public class Movie: Mappable {
    
    private struct SerializationKeys {
        static let posterPath = "poster_path"
        static let backdropPath = "backdrop_path"
        static let genreIds = "genre_ids"
        static let voteCount = "vote_count"
        static let overview = "overview"
        static let originalTitle = "original_title"
        static let popularity = "popularity"
        static let releaseDate = "release_date"
        static let id = "id"
        static let video = "video"
        static let originalLanguage = "original_language"
        static let voteAverage = "vote_average"
        static let title = "title"
        static let adult = "adult"
    }
    
    public var posterPath: String?
    public var backdropPath: String?
    public var genreIds: [Int]?
    public var voteCount: Int?
    public var overview: String?
    public var originalTitle: String?
    public var popularity: Float?
    public var releaseDate: String?
    public var id: Int?
    public var video: Bool? = false
    public var originalLanguage: String?
    public var voteAverage: Int?
    public var title: String?
    public var adult: Bool? = false

    public required init(map: Mapper) throws {
        posterPath = map.optionalFrom(SerializationKeys.posterPath)
        backdropPath = map.optionalFrom(SerializationKeys.backdropPath)
        genreIds = map.optionalFrom(SerializationKeys.genreIds)
        voteCount = map.optionalFrom(SerializationKeys.voteCount)
        overview = map.optionalFrom(SerializationKeys.overview)
        originalTitle = map.optionalFrom(SerializationKeys.originalTitle)
        popularity = map.optionalFrom(SerializationKeys.popularity)
        releaseDate = map.optionalFrom(SerializationKeys.releaseDate)
        id = map.optionalFrom(SerializationKeys.id)
        video = map.optionalFrom(SerializationKeys.video)
        originalLanguage = map.optionalFrom(SerializationKeys.originalLanguage)
        voteAverage = map.optionalFrom(SerializationKeys.voteAverage)
        title = map.optionalFrom(SerializationKeys.title)
        adult = map.optionalFrom(SerializationKeys.adult)
    }
    
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = posterPath { dictionary[SerializationKeys.posterPath] = value }
        if let value = backdropPath { dictionary[SerializationKeys.backdropPath] = value }
        if let value = genreIds { dictionary[SerializationKeys.genreIds] = value }
        if let value = voteCount { dictionary[SerializationKeys.voteCount] = value }
        if let value = overview { dictionary[SerializationKeys.overview] = value }
        if let value = originalTitle { dictionary[SerializationKeys.originalTitle] = value }
        if let value = popularity { dictionary[SerializationKeys.popularity] = value }
        if let value = releaseDate { dictionary[SerializationKeys.releaseDate] = value }
        if let value = id { dictionary[SerializationKeys.id] = value }
        dictionary[SerializationKeys.video] = video
        if let value = originalLanguage { dictionary[SerializationKeys.originalLanguage] = value }
        if let value = voteAverage { dictionary[SerializationKeys.voteAverage] = value }
        if let value = title { dictionary[SerializationKeys.title] = value }
        dictionary[SerializationKeys.adult] = adult
        return dictionary
    }
}

