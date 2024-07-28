//
//  SubCollapsibleSection.swift
//  MovieDatabaseApp
//
//  Created by vasanth on 27/07/24.
//

import SwiftUI

struct SubCollapsibleSection: View {
    let value: String
    let movies: [Movie]
//    let onSelect: (Movie) -> Void
    let filter: Filter
    
    @State private var isExpanded: Bool = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Button {
                isExpanded.toggle()
            } label: {
                HStack {
                    Text(value)
                        .foregroundStyle(Color.primary)
                    Spacer()
                    Image(systemName: isExpanded ? "chevron.down" : "chevron.right")
                        .foregroundStyle(Color.primary)
                }
                .padding(10)
                .padding(.leading)
                .clipShape(Rectangle())
            }
            .buttonStyle(.borderless)
            
            if isExpanded {
                ForEach(movies, id: \.title) { movie in
                    NavigationLink {
//                        onSelect(movie)
                        MovieDetailView(movie: movie)
                    } label: {
                        MovieCell(movie: movie, filter: filter)
                            .padding(.leading, 10)
                            .padding(.leading)
                            .clipShape(Rectangle())
                    }
                    .buttonStyle(.borderless)
                }
            }
        }
    }
}
