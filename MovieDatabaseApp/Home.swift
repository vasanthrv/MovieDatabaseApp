//
//  Home.swift
//  MovieDatabaseApp
//
//  Created by vasanth on 27/07/24.
//

import SwiftUI

struct Home: View {
    let movies: [Movie] = loadMovies()
    @State private var filteredMovies = [Movie]()
    @State private var searchText = ""
    @State private var selectedOption: String? = nil
    @State private var showDetails: Bool = false
    private let sections = ["Year", "Genre", "Directors", "Actors", "All Movies"]
    
    var body: some View {
        NavigationView {
            LazyVStack {
                SearchBar(text: $searchText)
                    .onChange(of: searchText, perform: { _ in
                        filterMovies()
                    })
                List {
                    ForEach(sections, id: \.self) { section in
                        Section(header: Text(section)) {
                            if section == "All Movies" {
                                ForEach(filteredMovies, id: \.title) { movie in
                                    Button(action: {
                                        showDetails.toggle()
                                    }) {
                                        MovieCell(movie: movie)
                                    }
                                }
                            } else {
                                ForEach(filteredMovies.filter { movie in
                                    filterSection(movie: movie, section: section)
                                }, id: \.title) { movie in
                                    Button(action: {
                                        showDetails.toggle()
                                    }) {
                                        MovieCell(movie: movie)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    private func filterMovies() {
        if searchText.isEmpty {
            filteredMovies = movies
        } else {
            filteredMovies = movies.filter { movie in
                movie.title.localizedCaseInsensitiveContains(searchText) ||
                movie.genre.localizedCaseInsensitiveContains(searchText) ||
                movie.director.localizedCaseInsensitiveContains(searchText) ||
                movie.actors.localizedCaseInsensitiveContains(searchText)
            }
        }
    }

    private func filterSection(movie: Movie, section: String) -> Bool {
        switch section {
        case "Year":
            return movie.year.localizedCaseInsensitiveContains(searchText)
        case "Genre":
            return movie.genre.localizedCaseInsensitiveContains(searchText)
        case "Directors":
            return movie.director.localizedCaseInsensitiveContains(searchText)
        case "Actors":
            return movie.actors.localizedCaseInsensitiveContains(searchText)
        default:
            return true
        }
    }
}
