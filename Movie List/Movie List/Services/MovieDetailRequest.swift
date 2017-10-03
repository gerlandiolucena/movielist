//
//  MovieDetailRequest.swift
//  Movie List
//
//  Created by Gerlandio Da Silva Lucena on 03/10/17.
//  Copyright © 2017 GerlandioLucena. All rights reserved.
//

import UIKit
import Mapper

class MovieDetailRequest: BaseRequest {
    init() {
        super.init(endpointString: Endpoints.detail)
    }
    
    override init(endpointString: String) {
        super.init(endpointString: endpointString)
    }
    
    func detail(movieId: Int, sucess: (anyObjectResponse)? = nil, failure: (defaultResponse)? = nil) {
        defaultURL = defaultURL.replacingOccurrences(of: "{movie_id}", with: "\(movieId)")
        
        get(parameters: [:]).response { response in
            if let jsonData = response.data {
                let responseDictionary = try? JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.allowFragments)
                if let jsonDictionary = responseDictionary as? NSDictionary {
                    if let movieDetail = try? MovieDetail(map: Mapper(JSON:jsonDictionary)) {
                        sucess?(movieDetail, nil)
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
