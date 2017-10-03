//
//  SpokenLanguages.swift
//
//  Created by Gerlandio Da Silva Lucena on 03/10/17
//  Copyright (c) . All rights reserved.
//

import Foundation
import Mapper

public class SpokenLanguages: Mappable {

    private struct SerializationKeys {
    static let iso6391 = "iso_639_1"
    static let name = "name"
    }

    public var iso6391: String?
    public var name: String?

    public required init(map: Mapper) throws {
        iso6391 = map.optionalFrom(SerializationKeys.iso6391)
        name = map.optionalFrom(SerializationKeys.name)
    }

    public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = iso6391 { dictionary[SerializationKeys.iso6391] = value }
    if let value = name { dictionary[SerializationKeys.name] = value }
    return dictionary
    }

}
