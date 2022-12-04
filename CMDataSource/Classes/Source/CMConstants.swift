//
//  CMConstants.swift
//  CMDataSource
//
//  Created by Cloy Vserv on 04/12/22.
//

import Foundation

let coreDispatchQueue = DispatchQueue(label: "com.marvel.coredata", attributes: .concurrent)

enum CMConstants: String, CaseIterable {
    case objectModelname = "Marvel"
}

enum CMEntity: String, CaseIterable {
    case superHero = "SuperHero"
    case comic = "Comic"
    case events = "Events"
    case resources = "Resources"
    case series = "Series"
    case stories = "Stories"
}

enum CMDataSourceError: Error{
    case noDataError
    case parsingError
}
