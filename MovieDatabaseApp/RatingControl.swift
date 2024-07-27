//
//  RatingControl.swift
//  MovieDatabaseApp
//
//  Created by vasanth on 27/07/24.
//

import SwiftUI

struct RatingControl: View {
    var rating: String

    var body: some View {
        HStack {
            Text("Rating:")
                .foregroundStyle(Color.primary)
            Text(rating)
                .font(.headline)
                .foregroundStyle(Color.primary)
        }
    }
}
