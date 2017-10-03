//
//  Genres.swift
//
//  Created by Gerlandio Da Silva Lucena on 03/10/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import Mapper

public class Genres: Mappable {

    private struct SerializationKeys {
        static let id = "id"
        static let name = "name"
    }

    public var id: Int?
    public var name: String?

    public required init(map: Mapper) throws {
        id = map.optionalFrom(SerializationKeys.id)
        name = map.optionalFrom(SerializationKeys.name)
    }

    public func dictionaryRepresentation() -> [String: Any] {
        var dictionary: [String: Any] = [:]
        if let value = id { dictionary[SerializationKeys.id] = value }
        if let value = name { dictionary[SerializationKeys.name] = value }
        return dictionary
    }
}
