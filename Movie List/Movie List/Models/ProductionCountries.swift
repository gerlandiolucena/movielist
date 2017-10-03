//
//  ProductionCountries.swift
//
//  Created by Gerlandio Da Silva Lucena on 03/10/17
//  Copyright (c) . All rights reserved.
//

import Foundation

public class ProductionCountries: Mappable {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let name = "name"
    static let iso31661 = "iso_3166_1"
  }

  // MARK: Properties
  public var name: String?
  public var iso31661: String?

  // MARK: ObjectMapper Initializers
  /// Map a JSON object to this class using ObjectMapper.
  ///
  /// - parameter map: A mapping from ObjectMapper.
  public required init?(map: Map){

  }

  /// Map a JSON object to this class using ObjectMapper.
  ///
  /// - parameter map: A mapping from ObjectMapper.
  public func mapping(map: Map) {
    name <- map[SerializationKeys.name]
    iso31661 <- map[SerializationKeys.iso31661]
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = name { dictionary[SerializationKeys.name] = value }
    if let value = iso31661 { dictionary[SerializationKeys.iso31661] = value }
    return dictionary
  }

}
