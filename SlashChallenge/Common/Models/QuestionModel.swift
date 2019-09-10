//
//  Game.swift
//  SlashChallenge
//
//  Created by Roberto Gómez on 04/09/2019.
//  Copyright © 2019 WembleyStudios. All rights reserved.
//

import Foundation

struct ResponseModel<T: Codable>: Codable {
    let responseCode: Int
    let results: [T]?
    
    enum CodingKeys: String, CodingKey {
        case responseCode = "response_code"
        case results = "results"
    }
}

struct QuestionModel: Codable {
    let category: String?
    let type: TypeEnum?
    let difficulty: Difficulty?
    let question: String?
    let correctAnswer: String?
    let incorrectAnswers: [String]?
    
    var shuffledAnswers: [String]? {
        guard let incorrectAnswers = incorrectAnswers else { return [] }
        let arr = incorrectAnswers + [correctAnswer]
        return arr.shuffled() as? [String]
    }
    
    enum CodingKeys: String, CodingKey {
        case category = "category"
        case type = "type"
        case difficulty = "difficulty"
        case question = "question"
        case correctAnswer = "correct_answer"
        case incorrectAnswers = "incorrect_answers"
    }
}

enum Difficulty: String, Codable {
    case easy = "easy"
    case hard = "hard"
    case medium = "medium"
}

enum TypeEnum: String, Codable {
    case multiple = "multiple"
    case boolean = "boolean"
}
