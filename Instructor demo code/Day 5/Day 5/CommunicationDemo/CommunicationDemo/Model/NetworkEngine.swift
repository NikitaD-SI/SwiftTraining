//
//  NetworkEngine.swift
//  NetworkingDemo
//
//  Created by Instructor on 10/03/22.
//

import Foundation

final class NetworkEngine {
    //MARK: - Singleton
    private static var reference : NetworkEngine?
    
    static var shared : NetworkEngine {
        if nil == reference {
            reference = NetworkEngine()
        }
        return reference!
    }
    
    private init() { }
    
    //MARK: - Variables, constants, and types
    typealias NetworkResponseHandler = (Data?, URLResponse?, Error?) -> Void
    
    func communicateWtih(Server url : URL, andHandleResponseWith completionHandler : @escaping NetworkResponseHandler) {
        let task = URLSession.shared.dataTask(with: url,
                                              completionHandler: completionHandler)
        task.resume()
    }
    
    func communicateWith(Request req : URLRequest, andHandleTheResponseWith completionHandler : @escaping NetworkResponseHandler) {
        let task : URLSessionDataTask   = URLSession.shared.dataTask(with: req,
                                                                     completionHandler: completionHandler)
        task.resume()
        
    }
}
