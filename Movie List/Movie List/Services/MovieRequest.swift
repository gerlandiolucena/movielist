//
//  MovieRequest.swift
//  Movie List
//
//  Created by Gerlandio Da Silva Lucena on 02/10/17.
//  Copyright © 2017 GerlandioLucena. All rights reserved.
//

import UIKit
import Mapper

class MovieRequest: BaseRequest {
    init() {
        super.init(endpointString: Endpoints.upcoming)
    }
    
    override init(endpointString: String) {
        super.init(endpointString: endpointString)
    }
    
    func list(parameters: [String: Any], sucess: (anyObjectResponse)? = nil, failure: (defaultResponse)? = nil) {
        get(parameters: parameters).response { response in
            if let jsonData = response.data {
                let responseDictionary = try? JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.allowFragments)
                if let jsonDictionary = responseDictionary as? NSDictionary {
                    if let movieList = try? MovieList(map: Mapper(JSON:jsonDictionary)) {
                        sucess?(movieList, nil)
                    } else {
                        failure?("Não foi possível realizar a comunicação com o servidor.", "Servidor indisponível")
                    }
                }
            } else {
                failure?("Não foi possível realizar a comunicação com o servidor.", "Servidor indisponível")
            }
        }
    }
}
