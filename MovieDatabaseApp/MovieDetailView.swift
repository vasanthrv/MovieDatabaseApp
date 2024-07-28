//
//  MovieDetailView.swift
//  MovieDatabaseApp
//
//  Created by vasanth on 27/07/24.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    @State private var selectedRatingSource: String = "Internet Movie Database"

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 8) {
                AsyncImage(url: movie.poster) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    Image(systemName: "film")
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(Color.primary)
                }
                .frame(height: 200)
                
                Text(movie.title)
                    .font(.title)
                    .foregroundStyle(Color.primary)
                    .padding(.bottom, 5)
                
                Text("Released: \(movie.year)")
                    .foregroundStyle(Color.primary)
                Text("Language: \(movie.language)")
                    .foregroundStyle(Color.primary)
                Text("Plot: \(movie.plot)")
                    .foregroundStyle(Color.primary)
                Text("Cast & Crew: \(movie.actors)")
                    .foregroundStyle(Color.primary)
                Text("Genre: \(movie.genre)")
                    .foregroundStyle(Color.primary)
                Picker("Rating Source", selection: $selectedRatingSource) {
                    ForEach(movie.ratings.map { $0.source }, id: \.self) { source in
                        Text(source)
                            .foregroundStyle(Color.primary)
                            .tag(source)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.vertical, 10)
                
                if let rating = movie.ratings.first(where: { $0.source == selectedRatingSource }) {
                    RatingControl(rating: rating.value)
                }
                
            }
            .padding()
        }
        .navigationTitle("Movie Details")
    }
}
