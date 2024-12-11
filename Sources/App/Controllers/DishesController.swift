//
//  DishesController.swift
//  FoodDeliveryBackend
//
//  Created by Александр Николаев on 04.12.2024.
//

import Fluent
import Vapor

struct DishesController: RouteCollection {
    func boot(routes: any Vapor.RoutesBuilder) throws {
        let dishesGroup = routes.grouped("api", "dishes")
        
        dishesGroup.post(use: createHandler)
        dishesGroup.get(use: getAllHandler)
        dishesGroup.get(":categoryID", use: getDishesByCategoryHandler)
    }
    
    @Sendable
    func createHandler(_ request: Request) async throws -> Dish {
        guard let category = try? request.content.decode(Dish.self) else {
            throw Abort(.custom(
                code: 001, reasonPhrase: "Не получилось декодировать контент в модель Dish"
            ))
        }
        
        try await category.save(on: request.db)
        return category
    }
    
    @Sendable
    func getAllHandler(_ request: Request) async throws -> [Dish] {
        let categories = try await Dish.query(on: request.db).all()
        return categories
    }
    
    @Sendable
    func getDishesByCategoryHandler(_ request: Request) async throws -> [Dish] {
        guard let categoryId = request.parameters.get("categoryID") else {
            throw Abort(.badRequest, reason: "Missing 'categoryID' parameter in the path")
        }
        let dishes = try await Dish.query(on: request.db)
            .filter(\.$categoryId == categoryId)
            .all()
        
        return dishes
    }
}
