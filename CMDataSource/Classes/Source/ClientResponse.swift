//
//  MarvelResponse.swift
//  Marvel
//
//  Created by Cloy Vserv on 01/12/22.
//

import Foundation

struct ClientResponse: Codable {
    var code: Int?
    var status: String?
    var data: ClientData?
}

struct ClientData: Codable {
    var offset: Int?
    var limit: Int?
    var results: [ClientSuperHero]?
}

struct ClientSuperHero: Codable {
    var id: Int?
    var name: String?
    var desc: String?
    var thumbnail: Thumbnail?
    var comics: ItemInfo?
    var series: ItemInfo?
    var stories: ItemInfo?
    var events: ItemInfo?
    var urls: [Url]?
    enum CodingKeys: String, CodingKey {
        case desc = "description"
        case id
        case name
        case thumbnail
        case comics
        case series
        case stories
        case events
        case urls
    }
}

extension ClientSuperHero {
    init(name: String){
        self.name = name
    }
}

struct Thumbnail: Codable {
    var path: String?
    var extens: String?
    enum CodingKeys: String, CodingKey {
        case path
        case extens = "extension"
    }
}

struct ItemInfo: Codable {
    var available: Int?
    var items: [Item]?
}

struct Item: Codable {
    var name: String?
    var type: String?
}

extension Item {
    init(name: String){
        self.name = name
    }
}

struct Url: Codable {
    var type: String?
    var url: String?
}

