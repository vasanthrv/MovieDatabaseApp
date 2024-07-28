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
        HStack(alignment: .top) {
            AsyncImage(url: movie.poster) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
            } placeholder: {
                Color.gray
            }
            .frame(width: 50, height: 80)
            
            VStack(alignment: .leading, spacing: 8) {
                Text(movie.title)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(Color.primary)
                switch filter {
                case .all:
                    HStack(alignment: .top, spacing: 4) {
                        Text("Language:")
                            .font(.caption)
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(Color.primary)
                        Text(movie.language)
                            .font(.caption)
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(Color.primary)
                    }
                    HStack(alignment: .top, spacing: 4) {
                        Text("Year:")
                            .font(.caption)
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(Color.primary)
                        Text(movie.year)
                            .font(.subheadline)
                            .foregroundStyle(Color.primary)
                    }
                case .year:
                    HStack(alignment: .top, spacing: 4) {
                        Text("Year:")
                            .font(.caption)
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(Color.primary)
                        Text(movie.year)
                            .font(.subheadline)
                            .foregroundStyle(Color.primary)
                    }
                case .genre:
                    HStack(alignment: .top, spacing: 4) {
                        Text("Genre:")
                            .font(.caption)
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(Color.primary)
                        Text(movie.genre)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(Color.primary)
                    }
                case .director:
                    HStack(alignment: .top, spacing: 4) {
                        Text("Directors:")
                            .font(.caption)
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(Color.primary)
                        
                        Text(movie.director)
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(Color.primary)
                    }
                case .actor:
                    HStack(alignment: .top, spacing: 4) {
                        Text("Actors:")
                            .font(.caption)
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(Color.primary)
                        Text(movie.actors)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                            .foregroundStyle(Color.primary)
                    }
                }
            }
        }
        .padding(.horizontal, 8)
    }
}



enum Filter: String {
    case all = "All Movies"
    case year = "Year"
    case genre = "Genre"
    case director = "Directors"
    case actor = "Actors"
}
