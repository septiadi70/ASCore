//
//  ASLocalDataSource.swift
//  ASCore
//
//  Created by Andi Septiadi on 02/12/21.
//

import Foundation

public protocol ASLocalDataSource {
    associatedtype Request
    associatedtype Response
    
    func list(request: Request?, completionHandler: @escaping (Result<[Response], Error>) -> Void)
    func add(entities: [Response], completionHandler: @escaping (Result<Bool, Error>) -> Void)
    func get(id: String, completionHandler: @escaping (Result<Response, Error>) -> Void)
    func update(id: Int, entity: Response, completionHandler: @escaping (Result<Bool, Error>) -> Void)
}
