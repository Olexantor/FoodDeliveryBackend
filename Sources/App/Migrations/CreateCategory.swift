//
//  CreateCategory.swift
//  FoodDeliveryBackend
//
//  Created by Александр Николаев on 12.11.2024.
//

import Fluent
import Vapor

struct CreateCategory: Migration {
    func prepare(on database: any FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        database.schema("categories")
            .id()
            .field("title", .string, .required)
            .field("image", .string, .required)
            .field("ratingsCount", .int, .required)
            .field("stars", .double, .required)
            .field("priceStartsAt", .int, .required)
            .field("promotionalOffer", .string)
            .create()
    }
    
    func revert(on database: any FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        database.schema("categories").delete()
    }
}
