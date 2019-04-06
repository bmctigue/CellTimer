//
//  URLProtocolStub.swift
//  Tiguer
//
//  Created by Bruce McTigue on 1/15/19.
//  Copyright © 2019 tiguer. All rights reserved.
//

import Foundation

public class URLProtocolStub: URLProtocol {
    // this dictionary maps URLs to test data
    static public var testURLs = [URL?: Data]()
    
    // say we want to handle all types of request
    override public class func canInit(with request: URLRequest) -> Bool {
        return true
    }
    
    // ignore this method; just send back what we were given
    override public class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    
    override public func startLoading() {
        // if we have a valid URL…
        if let url = request.url {
            // …and if we have test data for that URL…
            if let data = URLProtocolStub.testURLs[url] {
                // …load it immediately.
                self.client?.urlProtocol(self, didLoad: data)
            }
        }
        
        // mark that we've finished
        self.client?.urlProtocolDidFinishLoading(self)
    }
    
    // this method is required but doesn't need to do anything
    override public func stopLoading() { }
}
