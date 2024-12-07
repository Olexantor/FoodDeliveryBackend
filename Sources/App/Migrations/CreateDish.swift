//
//  CreateDish.swift
//  FoodDeliveryBackend
//
//  Created by Александр Николаев on 04.12.2024.
//

import Fluent
import Vapor

struct CreateDish: Migration {
    func prepare(on database: any FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        database.schema("dishes")
            .id()
            .field("categoryId", .string, .required)
            .field("title", .string, .required)
            .field("dishImageURL", .string, .required)
            .field("promotionalOffer", .string)
            .field("rating", .double, .required)
            .field("description", .string, .required)
            .field("latestReviewers", .array(of: .json), .required)
            .field("ingredientsImageURLs", .array(of: .string), .required)
            .field("additions", .array(of: .json), .required)
            .field("isFavorite", .bool, .required)
            .field("price", .int, .required)
            .create()
    }
    
    func revert(on database: any FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        database.schema("dishes").delete()
    }
}
