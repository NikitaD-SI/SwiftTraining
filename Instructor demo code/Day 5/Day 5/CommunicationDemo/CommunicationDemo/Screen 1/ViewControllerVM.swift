//
//  ViewControllerVM.swift
//  CommunicationDemo
//
//  Created by Instructor on 18/08/23.
//

import Foundation

class ViewControllerVM {
    var tableData : CricketMatches?
    
    let headers         : [String : String]     = [
        "X-RapidAPI-Key": "098e6d90e5msh0504e3733fa8400p1f3afajsn1b81823b7af2",
        "X-RapidAPI-Host": "cricbuzz-cricket.p.rapidapi.com"
    ]
    
    let destinationURL  : URL                   = URL(string: "https://cricbuzz-cricket.p.rapidapi.com/matches/v1/recent")!
    let method          : String                = "GET"
    
    func fetchResponse(updateUIWith uiUpdater : @escaping () -> Void) {
        
        var request : URLRequest    = URLRequest(url: self.destinationURL,
                                                 cachePolicy: URLRequest.CachePolicy.useProtocolCachePolicy,
                                                 timeoutInterval: 5)
        
        request.httpMethod              = self.method
        request.allHTTPHeaderFields     = self.headers
        
        NetworkEngine.shared.communicateWith(Request: request, andHandleTheResponseWith: {(data : Data?, resp : URLResponse?, err : Error?) -> Void in
            let jsonDecoder : JSONDecoder = JSONDecoder()
            
            if let info = data, let results = try? jsonDecoder.decode(CricketMatches.self, from: info) {
                for item in results.typeMatches {
                    print(#line, item.matchType)
                }
                
                self.tableData = results
                
                uiUpdater()
            }
        })
    }
}
