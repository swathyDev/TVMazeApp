//
//  API Service.swift
//  TVMazeApp
//
//  Created by Dev on 09/07/21.
//

import Foundation
import Alamofire

enum Result<S, E> {
    case success(S)
    case failure(E)
    
}

enum MimeType: String {
    case image = "image/jpeg"
}

class APIService: NSObject {
    
    //    MARK: - Common Request API Call
    
    func makeRequest<T: Codable>(withType type: HTTPMethod, path: String, params: Parameters, returnType: T.Type, encoding: ParameterEncoding = URLEncoding.default, andCallBack callback: @escaping (Result<T, String>) -> Void){
        
        let url = self.generateURL(withPath: path , withParams: [])
        
        Alamofire.request(url , method: type, parameters: params,encoding: encoding)
            .validate(statusCode: 200..<300)
            .responseJSON {
                response in
                switch response.result {
                case .success(let data):
                    let resData = try! JSONSerialization.data(withJSONObject: data, options: .prettyPrinted)
                    do {
                        let object = try JSONDecoder().decode( returnType , from: resData)
                        callback(Result.success(object))
                        
                    } catch {
                        callback(Result.failure(error.localizedDescription))
                    }
                case .failure(let error):
                    print(error)
                    let errorMessage = self.generateError(data: response.data!, error: error)
                    callback(Result.failure(errorMessage))
                }
            }
        
    }
    
    func generateURL(withPath path: String, withParams params: [(String, String)]) -> URL {
        
        var urlComp = URLComponents(string: Appconstants.baseUrl)!
        for param in params {
            urlComp.queryItems?.append(URLQueryItem(name: param.0, value: param.1))
        }
        var url = urlComp.url!
        url = url.appendingPathComponent(path)
        return url
    }
    
  //      MARK: - Error Handling Make Request

    fileprivate func generateError(data: Data, error errorFromAPI: Error) -> String {
        do {
            let object = try JSONDecoder().decode( APIError.self , from: data)
            return (object.message ?? "")
        } catch {
            return errorFromAPI.localizedDescription
        }
    }
}
