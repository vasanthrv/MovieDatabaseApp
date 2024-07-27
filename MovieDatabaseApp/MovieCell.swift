//
//  MovieCell.swift
//  MovieDatabaseApp
//
//  Created by vasanth on 27/07/24.
//

import SwiftUI

struct MovieCell: View {
    let movie: Movie
    var filter: Filter = .all
    
    var body: some View {
        HStack {
            AsyncImage(url: movie.poster) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                Color.gray
            }
            .frame(width: 50, height: 80)
            
            VStack(alignment: .leading) {
                switch filter {
                case .all:
                    Text(movie.title)
                        .font(.headline)
                        .foregroundStyle(Color.primary)
                    Text(movie.year)
                        .font(.subheadline)
                        .foregroundStyle(Color.primary)
                    Text(movie.language)
                        .font(.caption)
                        .foregroundStyle(Color.primary)
                case .year:
                    Text(movie.title)
                        .font(.headline)
                        .foregroundStyle(Color.primary)
                    Text(movie.year)
                        .font(.subheadline)
                        .foregroundStyle(Color.primary)
                case .genre:
                    Text(movie.title)
                        .font(.headline)
                        .foregroundStyle(Color.primary)
                    Text(movie.genre)
                        .font(.subheadline)
                        .foregroundStyle(Color.primary)
                case .director:
                    Text(movie.title)
                        .font(.headline)
                        .foregroundStyle(Color.primary)
                    Text(movie.director)
                        .foregroundStyle(Color.primary)
                case .actor:
                    Text(movie.title)
                        .font(.headline)
                        .foregroundStyle(Color.primary)
                    Text(movie.actors)
                        .font(.subheadline)
                        .foregroundStyle(Color.primary)
                }
            }
        }
    }
}



enum Filter: String {
    case all = "All Movies"
    case year = "Year"
    case genre = "Genre"
    case director = "Directors"
    case actor = "Actors"
}
