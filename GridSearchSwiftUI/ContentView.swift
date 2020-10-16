//
//  ContentView.swift
//  GridSearchSwiftUI
//
//  Created by Shaik Ghouse Basha on 16/10/20.
//

import SwiftUI
import KingfisherSwiftUI

struct ContentView: View {
	@ObservedObject var searchVM = SearchViewModel()
	@State var searchText = ""
	@State var isSearching = false
	
    var body: some View {
		NavigationView{
			ScrollView{
				SearchBar(searchText: $searchText, isSearching: $isSearching)
				LazyVGrid(columns: [
					GridItem(.flexible(minimum: 50, maximum: 200), spacing: 8, alignment: .top),
					GridItem(.flexible(minimum: 50, maximum: 200), spacing: 8, alignment: .top),
					GridItem(.flexible(minimum: 50, maximum: 200), alignment: .top)
				], alignment: .leading, spacing: 8, content:{
					ForEach(searchVM.items.filter({$0.name.contains(searchText) || searchText.isEmpty}), id: \.self) { appDetail in
						AppDetailsView(appDetail: appDetail)
					}
				})
				.padding(.horizontal, 6)
			}
			.navigationTitle("App Grid Search")
		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct AppDetailsView: View {
	var appDetail: AppResult
	var body: some View {
		VStack(alignment: .leading, spacing: 4) {
			KFImage(URL(string: appDetail.artworkUrl100))
				.resizable()
				.scaledToFit()
				.cornerRadius(22)
			Text(appDetail.name)
				.font(.system(size: 10, weight: .semibold))
				.padding(.top, 4)
			Text(appDetail.releaseDate)
				.font(.system(size: 9, weight: .regular))
			Text(appDetail.copyright)
				.font(.system(size: 9, weight: .regular))
				.foregroundColor(.gray)
		}
	}
}
