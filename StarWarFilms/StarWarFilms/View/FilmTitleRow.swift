//
//  FilmTitleRow.swift
//  StarWarFilms
//
//  Created by Khoa Nguyen on 07/12/2023.
//

import SwiftUI

struct FilmTitleRow: View {
    var film: FilmData?
    var body: some View {
        NavigationLink(destination: FilmDetailView(film: film)) {
            Text(film?.title ?? "").font(.headline)
            Spacer()
        }
    }
}

struct FilmTitleRow_Previews: PreviewProvider {
    static var previews: some View {
        FilmTitleRow(film: FilmData(model: nil))
    }
}
