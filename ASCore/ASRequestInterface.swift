//
//  ASRequestInterface.swift
//  ASCore
//
//  Created by Andi Septiadi on 29/11/21.
//

import Foundation

public protocol ASRequestInterface {
    var baseURL: String { get }
    var path: String { get }
}

public extension ASRequestInterface {
    func url() -> String {
        baseURL + path
    }
}
