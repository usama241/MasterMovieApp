//
//  URLRequestExtension.swift
//  JSZindigi
//
//  Created by Anis Ur Rehman on 28/08/2023.
//

import Foundation

extension URLRequest {
    
    public func cURL(pretty: Bool = false) -> String {
        
        guard let url = url else { return "" }
        var data : String = ""
        let complement = pretty ? "\\\n" : ""
        let method = "-X \(self.httpMethod ?? "GET") \(complement)"
        let urlString = "\"" + url.absoluteString + "\""

        var header = ""

        if let httpHeaders = self.allHTTPHeaderFields, httpHeaders.keys.count > 0 {
            for (key,value) in httpHeaders {
                header += "-H \"\(key): \(value)\" \(complement)"
            }
        }

        if let bodyData = self.httpBody, let bodyString = String(data:bodyData, encoding:.utf8) {
            data = "-d \"\(bodyString)\" \(complement)"
        }

        let command = "curl -i " + complement + method + header + data + urlString

        return command
    }
}
