//
//  ApiManager.swift
//  SuperHeroes
//
//  Created by Òscar Muntal on 22/01/2018.
//  Copyright © 2018 Muntalapps. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftHash

class ApiManager: NSObject {
    
    static let sharedInstance = ApiManager()
    var apiManager: SessionManager?
    let session = URLSession.shared
    
    override init() {
        super.init()
        apiManager = SessionManager.default
    }
    
    let baseURL = "http://gateway.marvel.com"
    let API_VERSION_V1 = "/v1/public"
    let API_VERSION_V2 = "/v2/public"
    let API_VERSION_V3 = "/v3/public"
    
    enum kAPI_ENDPOINT: String {
        case kAPI_ENDPOINT_GET_SUPERHEROES
        case kAPI_ENDPOINT_GET_COMICS
        case kAPI_ENDPOINT_GET_EVENTS
        case kAPI_ENDPOINT_GET_SERIES
        case kAPI_ENDPOINT_GET_STORIES
    }
    
    let ts = "1"
    let publicApiKey = "d7aa70ce1dafa625e85010064ff06c78"
    let privateApiKey = "b1cabc35422b25384da7358beedfbdf3d4d4f000"
    var md5Hash: String {
        return MD5(ts + privateApiKey + publicApiKey).lowercased()
    }
    var parameters: Dictionary<String, String> {
        return [
                "ts"        : self.ts,
                "apikey"    : self.publicApiKey,
                "hash"      : self.md5Hash
        ]
    }
    
    //MARK: - Request Methods
    func get(path: kAPI_ENDPOINT, successBlock: @escaping RequestSuccessBlock, errorBlock: @escaping RequestErrorBlock) {
        let path = getApiEndpointPath(type: path)
        let url = baseURL + path
        
        apiManager?.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: [:]).responseJSON(completionHandler: { response in
            
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                successBlock(json)
            case .failure(let error):
                guard let err = error as? APIError else { break }
                errorBlock(err)
                break
            }
        })
    }
    
    func getApiEndpointPath(type: kAPI_ENDPOINT) -> String {
        var path = baseURL
        switch type {
        case .kAPI_ENDPOINT_GET_SUPERHEROES:
            path =  API_VERSION_V1 + "/characters"
            break
        case .kAPI_ENDPOINT_GET_COMICS:
            path =  API_VERSION_V1 + "/comics"
            break
        case .kAPI_ENDPOINT_GET_EVENTS:
            path =  API_VERSION_V1 + "/events"
            break
        case .kAPI_ENDPOINT_GET_SERIES:
            path =  API_VERSION_V1 + "/series"
            break
        case .kAPI_ENDPOINT_GET_STORIES:
            path =  API_VERSION_V1 + "/stories"
            break
        }
        return path
    }

    
}
