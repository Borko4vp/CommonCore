//
//  NetworkRequest.swift
//  CommonCore
//
//  Created by Borko Tomic on 03/06/2020.
//

import Foundation

public protocol NetworkRequest {
    var path: URL? { get }
    var parameters: [String: Any]? { get }
    var headers: [String: String]? { get }
    var method: Core.Networking.HttpMethod {  get }
    var encoding: Core.Networking.Encoding? { get }
}

