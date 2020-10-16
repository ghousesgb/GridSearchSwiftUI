//
//  SearchBar.swift
//  GridSearchSwiftUI
//
//  Created by Shaik Ghouse Basha on 16/10/20.
//

import SwiftUI

struct SearchBar: View {
	@Binding var searchText: String
	@Binding var isSearching: Bool
	
	var body: some View {
		HStack {
			HStack {
				TextField("search text", text: $searchText)
					.padding(.leading, 20)
				
			}
			.padding()
			.background(Color(.systemGray4))
			.cornerRadius(6)
			.padding(.horizontal)
			.onTapGesture(perform: {
				isSearching = true
			})
			
			.overlay(
				HStack {
					Image(systemName: "magnifyingglass")
					Spacer()
					if isSearching {
						Button(action: {
							searchText = ""
						}, label: {
							Image(systemName: "xmark.circle.fill")
								.padding(.vertical)
						})
						
					}
				}
				.padding(.horizontal, 30)
				.foregroundColor(.gray)
			)
			.transition(.move(edge: .trailing))
			.animation(.spring())
			
			
			if isSearching {
				Button(action: {
					searchText = ""
					isSearching = false
					UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
				}, label: {
					Text("Cancel")
						.padding(.trailing)
						.padding(.leading, -15)
					
				})
				.transition(.move(edge: .trailing))
				.animation(.spring())
			}
		}
	}
}
