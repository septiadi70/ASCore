//
//  ASMapper.swift
//  ASCore
//
//  Created by Andi Septiadi on 04/12/21.
//

import Foundation

public protocol ASMapper {
    associatedtype Response
    associatedtype Entity
    associatedtype Domain
    
    func transformResponseToEntity(response: Response) -> Entity
    func transformEntityToDomain(entity: Entity) -> Domain
    func transformDomainToEntity(domain: Domain) -> Entity
}
