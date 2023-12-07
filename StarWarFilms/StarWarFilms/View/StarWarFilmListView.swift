//
//  ContentView.swift
//  StarWarFilms
//
//  Created by Khoa Nguyen on 05/12/2023.
//

import SwiftUI

struct StarWarFilmListView: View {
    @StateObject var viewModel = StarWarFilmListViewModel()
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.filteredFilms, id: \.self) { filmData in
                    FilmTitleRow(film: filmData)
                }
            }
            .searchable(text: $viewModel.searchText, suggestions: {
                ForEach(viewModel.filteredSuggestions, id: \.self) { suggestion in
                   Text(suggestion)
                     .searchCompletion(suggestion)
                 }
            })
            .environment(\.defaultMinListRowHeight, 70)
            .navigationBarTitleDisplayMode(.large)
            .navigationTitle("Starwar List")
        }
        .task {
            viewModel.loadStarWarList()
        }
    }
}

struct StarWarFilmListView_Previews: PreviewProvider {
    static var previews: some View {
        StarWarFilmListView()
    }
}
