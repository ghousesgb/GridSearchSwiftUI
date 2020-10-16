//
//  SearchViewModel.swift
//  GridSearchSwiftUI
//
//  Created by Shaik Ghouse Basha on 16/10/20.
//

import Foundation

class SearchViewModel: ObservableObject {
	@Published var items = [AppResult]()
	
	init() {
		/*Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { (_) in
			self.items = 0..<8
		}*/
		guard let url = URL(string: "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-apps-we-love/all/50/explicit.json") else { return }
				
		URLSession.shared.dataTask(with: url) { [self] (data, response, error) in
			
			guard let data = data else { return }
			do {
				let rssFeed = try JSONDecoder().decode(RSSFeed.self, from: data)
				self.items = rssFeed.feed.results
			}catch {
				print("Decoding error \(error)")
			}
			
		}.resume()
	}
}
