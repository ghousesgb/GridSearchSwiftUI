//
//  RSSModel.swift
//  GridSearchSwiftUI
//
//  Created by Shaik Ghouse Basha on 16/10/20.
//

import Foundation

struct RSSFeed: Decodable {
	var feed: Feed
}

struct Feed: Decodable {
	var results: [AppResult]
}

struct AppResult: Decodable, Hashable {
	var name, copyright, artworkUrl100, releaseDate: String
}
