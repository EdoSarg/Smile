//
//  Joke.swift
//  Smile+Ui
//
//  Created by Edgar Sargsyan on 07.07.23.
//

import Foundation

struct Joke: Codable {

    let error: Bool?
    let category, type, setup, delivery: String?
    let flags: Flags?
    let id: Int?
    let safe: Bool?
    let lang: String?
    
    
}

struct Flags: Codable {
    let nsfw, religious, polotocal, racist: Bool?
    let sexist,explicit: Bool?
}

