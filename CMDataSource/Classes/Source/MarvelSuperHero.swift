//
//  MarvelSuperHero.swift
//  Marvels
//
//  Created by Cloy Vserv on 01/12/22.
//

import Foundation

public struct MarvelSuperHero {
    public var index: Int?
    public var id: Int?
    public var name: String?
    public var descripton: String?
    public var thumbnail: String?
    public var image: UIImage?
    public var isBookmarked = false
}

public struct MarvelSuperHeroDetails {
    public var hero: MarvelSuperHero?
    public var comics: [String]?
    public var series: [String]?
    public var events: [String]?
    public var urls: [MarvelUrls]?
    public var stories: [MarvelStories]?
}

public struct MarvelStories {
    public var name: String?
    public var type: String?
}

public struct MarvelUrls {
    public var url: String?
    public var type: String?
}

extension MarvelSuperHero: CustomStringConvertible {
    public var description: String {
        //return "index: \(index) id:\(id) name:\(name) descripton:\(descripton) thumbnail:\(thumbnail) comics:\(comics) stories:\(stories) events:\(events) urls:\(urls)"
        return "index: \(index) id:\(id) name:\(name) descripton:\(descripton) thumbnail:\(thumbnail) isBookmarked\(isBookmarked)"
    }
}
