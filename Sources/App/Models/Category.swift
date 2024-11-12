//
//  Category.swift
//  FoodDeliveryBackend
//
//  Created by Александр Николаев on 12.11.2024.
//

import Fluent
import Vapor

final class Category: Model, Content, @unchecked Sendable {
    
    nonisolated(unsafe) static var schema: String = "categories"
    
    @ID
    var id: UUID?
    @Field(key: "title") var title: String
    @Field(key: "image") var image: String
    @Field(key: "ratingsCount") var ratingsCount: Int
    @Field(key: "stars") var stars: Double
    @Field(key: "priceStartsAt") var priceStartsAt: Int
    @Field(key: "promotionalOffer") var promotionalOffer: String?
    
    init() {}
    
    init(
        id: UUID? = nil,
        title: String,
        image: String,
        ratingsCount: Int,
        stars: Double,
        priceStartsAt: Int,
        promotionalOffer: String?
    ) {
        self.id = id
        self.title = title
        self.image = image
        self.ratingsCount = ratingsCount
        self.stars = stars
        self.priceStartsAt = priceStartsAt
        self.promotionalOffer = promotionalOffer
    }
    
}

