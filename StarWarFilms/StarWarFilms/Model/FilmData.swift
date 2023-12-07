//
//  FilmData.swift
//  StarWarFilms
//
//  Created by Khoa Nguyen on 07/12/2023.
//

import Foundation

struct FilmData: Hashable, Equatable {
    var title: String?
    var releasedDate: String?
    var director: String?
    var listSpcies: [SpecieData] = []
    
    init(model: StarWarsApi.StarWarListQuery.Data.AllFilms.Film?) {
        guard let modelData = model else { return }
        self.title = modelData.title.orStringEmpty
        self.releasedDate = modelData.releaseDate.orStringEmpty
        self.director = modelData.director.orStringEmpty
        guard let listSpcie = modelData.speciesConnection?.species else {
            return
        }
        self.listSpcies = listSpcie.compactMap { SpecieData(model: $0) }
    }
    
    static func == (lhs: FilmData, rhs: FilmData) -> Bool {
        return lhs.title == rhs.title
    }
}
