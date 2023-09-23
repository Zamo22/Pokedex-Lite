//
//  InitialViewProvider.swift
//  
//
//  Created by Zaheer Moola on 2023/09/23.
//

import SwiftUI

/// Should be conformed to by the first view to be displayed for the application.
public protocol InitialViewProvider {
    func provide() -> AnyView
}
