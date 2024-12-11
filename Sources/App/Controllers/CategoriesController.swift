//
//  CategoriesController.swift
//  FoodDeliveryBackend
//
//  Created by Александр Николаев on 12.11.2024.
//

import Fluent
import Vapor

struct CategoriesController: RouteCollection {
    func boot(routes: any Vapor.RoutesBuilder) throws {
        let categoriesGroup = routes.grouped("api","categories")
        categoriesGroup.post(use: createHandler)
        categoriesGroup.get(use: getAllHandler)
    }
    
    @Sendable
    func createHandler(_ request: Request) async throws -> Category {
        guard let category = try? request.content.decode(Category.self) else {
            throw Abort(.custom(
                code: 001, reasonPhrase: "Не получилось декодировать контент в модель Category"
            ))
        }
        
        try await category.save(on: request.db)
        return category
    }
    
    @Sendable
    func getAllHandler(_ request: Request) async throws -> [Category] {
        let categories = try await Category.query(on: request.db).all()
        return categories
    }
}
