//
//  StatRatingView.swift
//  
//
//  Created by Zaheer Moola on 2023/09/24.
//

import SwiftUI

public struct PercentageIndicatorView: View {

    let value: Int
    let valueMaximum: Int

    var percentage: CGFloat {
        CGFloat(value) / CGFloat(valueMaximum)
    }

    public init(stat: Int, valueMaximum: Int = 255) {
        self.value = stat
        self.valueMaximum = valueMaximum
    }

    public var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                Color.gray
                    .frame(width: geo.size.width,
                           height: 4)

                Color.blue
                    .frame(width: percentage * geo.size.width,
                           height: 4)
            }
            .frame(width: geo.size.width, height: geo.size.height)
            .cornerRadius(2)
        }
    }
}
