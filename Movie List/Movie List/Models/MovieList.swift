//
//  MovieList.swift
//  Movie List
//
//  Created by Gerlandio Da Silva Lucena on 02/10/17.
//  Copyright © 2017 GerlandioLucena. All rights reserved.
//

import UIKit
import Mapper

class MovieList: Mappable {
    
    private struct SerializationKeys {
        static let totalPages = "total_pages"
        static let page = "page"
        static let results = "results"
        static let dates = "dates"
        static let totalResults = "total_results"
    }
    
    public var totalPages: Int?
    public var page: Int?
    public var results: [Movie]?
    public var dates: Dates?
    public var totalResults: Int?

    required init(map: Mapper) throws {
        totalPages = map.optionalFrom(SerializationKeys.totalPages)
        page = map.optionalFrom(SerializationKeys.page)
        results = map.optionalFrom(SerializationKeys.results)
        dates = map.optionalFrom(SerializationKeys.dates)
        totalResults = map.optionalFrom(SerializationKeys.totalResults)
    }
    
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = totalPages { dictionary[SerializationKeys.totalPages] = value }
        if let value = page { dictionary[SerializationKeys.page] = value }
        if let value = results { dictionary[SerializationKeys.results] = value.map { $0.dictionaryRepresentation() } }
        if let value = dates { dictionary[SerializationKeys.dates] = value.dictionaryRepresentation() }
        if let value = totalResults { dictionary[SerializationKeys.totalResults] = value }
        return dictionary
    }
}

class Dates: Mappable {
    
    private struct SerializationKeys {
        static let maximum = "maximum"
        static let minimum = "minimum"
    }
    
    public var maximum: String?
    public var minimum: String?
    
    required init(map: Mapper) throws {
        maximum = map.optionalFrom(SerializationKeys.maximum)
        minimum = map.optionalFrom(SerializationKeys.minimum)
    }
    
    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = maximum { dictionary[SerializationKeys.maximum] = value }
        if let value = minimum { dictionary[SerializationKeys.minimum] = value }
        return dictionary
    }
}
