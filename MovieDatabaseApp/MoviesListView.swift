//
//  MoviesListView.swift
//  MovieDatabaseApp
//
//  Created by vasanth on 27/07/24.
//

import SwiftUI

struct MoviesListView: View {
    @State private var movies = loadMovies()
    @State private var filteredMovies = [Movie]()
    @State private var searchText = ""
    @State private var showDetails: Movie? = nil
    @State private var showDetail: Bool = false
    @State private var currentFilter: Filter? = nil
    
    private let filters: [Filter] = [.year, .genre, .director, .actor, .all]
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    SearchBar(text: $searchText)
                        .onChange(of: searchText) { _ in
                            filterMovies()
                        }
                        .submitLabel(.search)
                    
                    if searchText.isEmpty {
                        ForEach(filters, id: \.self) { filter in
                            Button {
                                if currentFilter == filter {
                                    currentFilter = nil // Collapse section
                                } else {
                                    currentFilter = filter // Expand new section
                                }
                            } label: {
                                HStack {
                                    Text(filter.rawValue)
                                        .foregroundStyle(Color.primary)
                                    Spacer()
                                    Image(systemName: currentFilter == filter ? "chevron.down" : "chevron.right")
                                        .foregroundStyle(Color.primary)
                                }
                                .padding()
                                .clipShape(Rectangle())
                            }
                            .buttonStyle(.borderless)
                            
                            if currentFilter == filter {
                                CollapsibleSection(filter: filter, movies: filteredMovies, onSelect: { movie in
                                    showDetails = movie
                                    showDetail.toggle()
                                })
                            }
                            Divider()
                        }
                    }
                    else {
                        ForEach(filteredMovies, id: \.title) { movie in
                            Button(action: {
                                showDetails = movie
                                showDetail.toggle()
                            }) {
                                MovieCell(movie: movie)
                                    .clipShape(Rectangle())
                            }
                            .buttonStyle(.borderless)
                        }
                    }
                }
            }
            .navigationTitle("Movie Database")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $showDetail) {
                if let movie = showDetails {
                    MovieDetailView(movie: movie)
                }
            }
            .onAppear {
                filteredMovies = movies
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
}

