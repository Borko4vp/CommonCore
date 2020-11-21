//
//  Router.swift
//  CommonCore
//
//  Created by Borko Tomic on 01/06/2020.
//

import Foundation

protocol NetworkRouter {
    var path: URL { get }
    var method: Core.Networking.HttpMethod { get }
    var parameters: Codable { get}
}
