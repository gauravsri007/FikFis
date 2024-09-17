//
//  StarRatingView.swift
//  FikFis
//
//  Created by sveltetech on 21/08/24.
//

import SwiftUI

struct StarRatingView: View {
    @Binding var rating: Int
    var maximumRating = 4
    var color: Color = .themeColor

    var body: some View {
        HStack {
            ForEach(1...maximumRating, id: \.self) { index in
                Image(systemName: "star.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(index <= rating ? color : Color(uiColor: .systemGray5))
                    .onTapGesture {
                        rating = index
                    }
            }
        }
    }
}

#Preview {
    StarRatingView(rating: .constant(3))
}
