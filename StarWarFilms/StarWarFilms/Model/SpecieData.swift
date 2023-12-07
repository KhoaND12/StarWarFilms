//
//  SpecieData.swift
//  StarWarFilms
//
//  Created by Khoa Nguyen on 07/12/2023.
//

import Foundation

struct SpecieData: Hashable, Equatable {
    var name: String?
    var classification: String?
    
    init(model: StarWarsApi.StarWarListQuery.Data.AllFilms.Film.SpeciesConnection.Specy?) {
        guard let modelData = model else { return }
        self.name = modelData.name.orStringEmpty
        self.classification = modelData.classification.orStringEmpty
    }
    
    static func == (lhs: SpecieData, rhs: SpecieData) -> Bool {
        return lhs.name == rhs.name
    }
}
