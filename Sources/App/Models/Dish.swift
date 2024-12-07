//
//  Dish.swift
//  FoodDeliveryBackend
//
//  Created by Александр Николаев on 04.12.2024.
//

import Fluent
import Vapor

final class Dish: Model, Content, @unchecked Sendable {

    nonisolated(unsafe) static var schema: String = "dishes"
    
    @ID
    var id: UUID?
    @Field(key: "categoryId") var categoryId: String
    @Field(key: "title") var title: String
    @Field(key: "dishImageURL") var dishImageURL: String
    @Field(key: "promotionalOffer") var promotionalOffer: String?
    @Field(key: "rating") var rating: Double
    @Field(key: "description") var description: String
    @Field(key: "latestReviewers") var latestReviewers: [Reviewer]
    @Field(key: "ingredientsImageURLs") var ingredientsImageURLs: [String]
    @Field(key: "additions") var additions: [Addition]
    @Field(key: "isFavorite") var isFavorite: Bool
    @Field(key: "price") var price: Int
    
    init() {}
    
    init(
        id: UUID? = nil,
        categoryId: String,
        title: String,
        dishImageURL: String,
        promotionalOffer: String? = nil,
        rating: Double,
        description: String,
        latestReviewers: [Reviewer],
        ingredientsImageURLs: [String],
        additions: [Addition],
        isFavorite: Bool,
        price: Int
    ) {
        self.id = id
        self.categoryId = categoryId
        self.title = title
        self.dishImageURL = dishImageURL
        self.promotionalOffer = promotionalOffer
        self.rating = rating
        self.description = description
        self.latestReviewers = latestReviewers
        self.ingredientsImageURLs = ingredientsImageURLs
        self.additions = additions
        self.isFavorite = isFavorite
        self.price = price
    }
}

struct Reviewer: Content, Codable, @unchecked Sendable {
    let id: String
    let firstName: String
    let lastName: String
    let rating: Int
    let text: String
    let avatarImageURL: String
    let timeStamp: String
}

struct Addition: Content, Codable,  @unchecked Sendable {
    let id: String
    let title: String
    let price: Int
}
