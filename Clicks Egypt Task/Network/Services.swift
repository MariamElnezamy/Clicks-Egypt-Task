//
//  Services.swift
//  Clicks Egypt Task
//
//  Created by Admin on 27/08/2021.
//

import Foundation
import Alamofire


class Services{
    
    static let shared = Services()
    
    func GetData<T: Decodable>(url: String,parameters:[String:Any]?,headers:[String:String]?,completion: @escaping(T?, Error?)->()) {
        print(">>>>>\(parameters)")
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers).responseJSON { (response) in
            switch response.result {
            case .success:
                do {
                    print(response)
                    print(T.self)
                    guard let data = response.data else { return }
                    print(data)
                    let dataModel = try JSONDecoder().decode(T.self, from: data)
                    completion(dataModel, nil)
                } catch let jsonError {
                    print("url:\(url)  , \(jsonError as NSError)")
                    completion(nil, jsonError)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
