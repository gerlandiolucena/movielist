//
//  BaseRequest.swift
//  Movie List
//
//  Created by Gerlandio Da Silva Lucena on 02/10/17.
//  Copyright © 2017 GerlandioLucena. All rights reserved.
//

import UIKit
import Alamofire
import Mapper

class BaseRequest: NSObject {
    
    var defaultURL: String = ""
    var headers: HTTPHeaders?
    typealias defaultResponse = (String, String?) -> Void
    typealias anyObjectResponse = (Any?, String?) -> Void
    
    init(baseEndpoint: String) {
        let urlString: String = ConfigurationProvider.sharedInstance().get(tag: baseEndpoint) ?? ""
        defaultURL = urlString
    }
    
    init(endpointString: String) {
        let urlString: String = ConfigurationProvider.sharedInstance().get(tag: Endpoints.BaseUrl) ?? ""
        let url: String = ConfigurationProvider.sharedInstance().get(tag: endpointString) ?? ""
        defaultURL = "\(urlString)\(url)"
    }
    
    func get(parameters: [String: Any]?) -> DataRequest  {
        let defaultParameters = defaultRequestParams(parameters: parameters)
        return Alamofire.request(defaultURL, method: .get, parameters: defaultParameters, encoding: URLEncoding.default, headers: headers)
    }
    
    func post(parameters: [String: Any]) ->  DataRequest {
        return Alamofire.request(defaultURL, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: headers)
    }
    
    func delete(parameters: [String: Any]) ->  DataRequest {
        return Alamofire.request(defaultURL, method: .delete, parameters: parameters, encoding: URLEncoding.default, headers: headers)
    }
    
    func put(parameters: [String: Any]) ->  DataRequest {
        return Alamofire.request(defaultURL, method: .put, parameters: parameters, encoding: URLEncoding.default, headers: headers)
    }
    
    func postRaw(parameters: [String: Any]) ->  DataRequest {
        return Alamofire.request(defaultURL, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: headers)
    }
    
    func defaultRequestParams(parameters: [String: Any]?) -> [String: Any] {
        let apiKey = ConfigurationProvider.sharedInstance().get(tag: Endpoints.ApiKey) ?? ""
        var defaultParams: [String: Any] = ["api_key": apiKey]
        if let parameters = parameters {
            for (key, element) in parameters {
                defaultParams[key] = element
            }
        }
        
        return defaultParams
    }
    
    func setHeaderRequest() {
        headers = HTTPHeaders()
    }
}

