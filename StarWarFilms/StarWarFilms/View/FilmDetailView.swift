//
//  FilmDetailView.swift
//  StarWarFilms
//
//  Created by Khoa Nguyen on 07/12/2023.
//

import SwiftUI

struct FilmDetailView: View {
    var film: FilmData?
    var body: some View {
        VStack {
            HStack {
                Spacer()
                VStack {
                    Text(film?.title ?? "")
                        .font(.largeTitle)
                    Text("Released date: \(film?.releasedDate ?? "")")
                    Text("Director: \(film?.director ?? "")")
                }
                Spacer()
            }
            VStack {
                if ((film?.listSpcies.isEmpty) == nil) {
                    Text("No cast data")
                    Spacer()
                } else {
                    List {
                        Section {
                            ForEach(film?.listSpcies ?? [], id: \.self) { specy in
                                Text("\(specy.name ?? "")")
                            }
                        } header: {
                            Text("List of Species")
                        }
                    }
                }
            }
        }
    }
}

struct FilmDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FilmDetailView(film: FilmData(model: nil))
    }
}
