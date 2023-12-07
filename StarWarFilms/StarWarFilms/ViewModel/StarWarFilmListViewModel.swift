//
//  StarWarFilmListViewModel.swift
//  StarWarFilms
//
//  Created by Khoa Nguyen on 05/12/2023.
//

import Foundation
import Apollo


@MainActor
final class StarWarFilmListViewModel: ObservableObject {
    @Published var starWarList: [FilmData] = []
    @Published var searchText = ""
    @Published var suggestions = ["Hope", "Jedi", "Phantom", "Clones", "Sith"]
    var filteredFilms: [FilmData] {
        guard !searchText.isEmpty else { return starWarList }
        return starWarList.filter { film in
            film.title.orStringEmpty.lowercased().contains(searchText.lowercased())
        }
    }
    
    var filteredSuggestions: [String] {
        guard !searchText.isEmpty else { return [] }
        return suggestions.sorted().filter { $0.lowercased().contains(searchText.lowercased()) }
    }
    
    func loadStarWarList() {
        ApolloNetwork.shared.apollo.fetch(query: StarWarsApi.StarWarListQuery()) { [weak self] result in
            guard let self = self else {
                return
            }
            
            switch result {
                
            case .success(let graphQLResult):
                // check the `data` property
                print("Result : \(graphQLResult)")
                if let stationConnection = graphQLResult.data?.allFilms?.films {
                    self.starWarList = stationConnection.compactMap { FilmData(model: $0) }
                }
                
                if let errors = graphQLResult.errors {
                    print(errors)
                }
                
            case .failure(let error):
                print(error)
            }
            
        }
    }
    
    func releaseDate(of film: StarWarsApi.StarWarListQuery.Data.AllFilms.Film) -> String {
        return film.releaseDate ?? "Unknown"
    }
    
    func titleName(of film: StarWarsApi.StarWarListQuery.Data.AllFilms.Film) -> String {
        film.title ?? "Unknowed Title Film"
    }
}
