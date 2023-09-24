//
//  ErrorView.swift
//  
//
//  Created by Zaheer Moola on 2023/09/23.
//

import SwiftUI

public struct ErrorView: View {

    let errorMessage: String

    init(message: String = "Please try again later") {
        self.errorMessage = message
    }

    public var body: some View {
        VStack(spacing: 8) {
            Image("errorImage", bundle: .module)
                .padding(.bottom, 48)

            Text("Oops, something went wrong")
                .font(.title2)

            Text(errorMessage)
                .font(.body)
                .multilineTextAlignment(.center)

        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView()
    }
}
