//
//  CollapsibleSection.swift
//  MovieDatabaseApp
//
//  Created by vasanth on 27/07/24.
//

import SwiftUI

struct CollapsibleSection: View {
    let filter: Filter
    let movies: [Movie]
    let onSelect: (Movie) -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            if filter == .all {
                ForEach(movies, id: \.title) { movie in
                    NavigationLink {
//                        onSelect(movie)
                        MovieDetailView(movie: movie)
                    } label: {
                        MovieCell(movie: movie, filter: .all)
                            .clipShape(Rectangle())
                    }
                    .buttonStyle(.borderless)
                }
            } else {
                let uniqueValues = getUniqueValues(for: filter)
                ForEach(uniqueValues, id: \.self) { value in
                    SubCollapsibleSection(value: value, movies: movies.filter { filterSection(movie: $0, filter: filter, option: value) }, onSelect: onSelect, filter: filter)
                }
            }
        }
    }
    
    private func getUniqueValues(for filter: Filter) -> [String] {
        switch filter {
        case .year:
                return Array(Set(movies.flatMap { extractYear(from: $0.year) }))
        case .genre:
            return Array(Set(movies.flatMap { $0.genre.split(separator: ",").map { $0.trimmingCharacters(in: .whitespaces) } }))
        case .director:
            return Array(Set(movies.flatMap { $0.director.split(separator: ",").map { $0.trimmingCharacters(in: .whitespaces) } }))
        case .actor:
            return Array(Set(movies.flatMap { $0.actors.split(separator: ",").map { $0.trimmingCharacters(in: .whitespaces) } }))
        case .all:
            return []
        }
    }
    
    private func extractYear(from yearString: String) -> [String] {
        let components = yearString.split(separator: "-").map { $0.trimmingCharacters(in: .whitespaces) }
        guard let startYear = components.first else { return [] }
        return [startYear] // Use only the start year for ranges or partial ranges
    }
    
    private func filterSection(movie: Movie, filter: Filter, option: String) -> Bool {
        switch filter {
        case .year:
            return movie.year.localizedCaseInsensitiveContains(option)
        case .genre:
            return movie.genre.localizedCaseInsensitiveContains(option)
        case .director:
            return movie.director.localizedCaseInsensitiveContains(option)
        case .actor:
            return movie.actors.localizedCaseInsensitiveContains(option)
        case .all:
            return true
        }
    }
}
