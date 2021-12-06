//
//  ASRemoteDataSource.swift
//  ASCore
//
//  Created by Andi Septiadi on 02/12/21.
//

import Foundation

public protocol ASRemoteDataSource {
    associatedtype Request
    associatedtype Response
    
    func execute(request: Request) -> Response
}
