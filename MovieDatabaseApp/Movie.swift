//
//  Movie.swift
//  MovieDatabaseApp
//
//  Created by vasanth on 27/07/24.
//

import Foundation

// MARK: - Movie
struct Movie: Codable {
    let title: String
    let year: String
    let rated: String
    let released: String
    let runtime: String
    let genre: String
    let director: String
    let writer: String
    let actors: String
    let plot: String
    let language: String
    let country: String
    let awards: String
    let poster: URL?
    let ratings: [Rating]
    let metascore: String
    let imdbRating: String
    let imdbVotes: String
    let imdbID: String
    let type: String
    let dvd: String
    let boxOffice: String
    let production: String
    let website: String
    let response: String

    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case rated = "Rated"
        case released = "Released"
        case runtime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case writer = "Writer"
        case actors = "Actors"
        case plot = "Plot"
        case language = "Language"
        case country = "Country"
        case awards = "Awards"
        case poster = "Poster"
        case ratings = "Ratings"
        case metascore = "Metascore"
        case imdbRating = "imdbRating"
        case imdbVotes = "imdbVotes"
        case imdbID = "imdbID"
        case type = "Type"
        case dvd = "DVD"
        case boxOffice = "BoxOffice"
        case production = "Production"
        case website = "Website"
        case response = "Response"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decodeIfPresent(String.self, forKey: .title) ?? "N/A"
        year = try container.decodeIfPresent(String.self, forKey: .year) ?? "N/A"
        rated = try container.decodeIfPresent(String.self, forKey: .rated) ?? "N/A"
        released = try container.decodeIfPresent(String.self, forKey: .released) ?? "N/A"
        runtime = try container.decodeIfPresent(String.self, forKey: .runtime) ?? "N/A"
        genre = try container.decodeIfPresent(String.self, forKey: .genre) ?? "N/A"
        director = try container.decodeIfPresent(String.self, forKey: .director) ?? "N/A"
        writer = try container.decodeIfPresent(String.self, forKey: .writer) ?? "N/A"
        actors = try container.decodeIfPresent(String.self, forKey: .actors) ?? "N/A"
        plot = try container.decodeIfPresent(String.self, forKey: .plot) ?? "N/A"
        language = try container.decodeIfPresent(String.self, forKey: .language) ?? "N/A"
        country = try container.decodeIfPresent(String.self, forKey: .country) ?? "N/A"
        awards = try container.decodeIfPresent(String.self, forKey: .awards) ?? "N/A"
        poster = try container.decodeIfPresent(URL.self, forKey: .poster) ?? URL( string: "N/A")
        ratings = try container.decodeIfPresent([Rating].self, forKey: .ratings) ?? []
        metascore = try container.decodeIfPresent(String.self, forKey: .metascore) ?? "N/A"
        imdbRating = try container.decodeIfPresent(String.self, forKey: .imdbRating) ?? "N/A"
        imdbVotes = try container.decodeIfPresent(String.self, forKey: .imdbVotes) ?? "N/A"
        imdbID = try container.decodeIfPresent(String.self, forKey: .imdbID) ?? "N/A"
        type = try container.decodeIfPresent(String.self, forKey: .type) ?? "N/A"
        dvd = try container.decodeIfPresent(String.self, forKey: .dvd) ?? "N/A"
        boxOffice = try container.decodeIfPresent(String.self, forKey: .boxOffice) ?? "N/A"
        production = try container.decodeIfPresent(String.self, forKey: .production) ?? "N/A"
        website = try container.decodeIfPresent(String.self, forKey: .website) ?? "N/A"
        response = try container.decodeIfPresent(String.self, forKey: .response) ?? "N/A"
    }
}

// MARK: - Rating
struct Rating: Codable {
    let source: String
    let value: String

    enum CodingKeys: String, CodingKey {
        case source = "Source"
        case value = "Value"
    }
}



func loadMovies() -> [Movie] {
    guard let url = Bundle.main.url(forResource: "movies", withExtension: "json") else { print("File Error")
        return []}
    do {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        let movies = try decoder.decode([Movie].self, from: data)
        print("Succeed")
        print(movies)
        return movies
    } catch {
        print("Error loading movies: \(error)")
        return []
    }
}
