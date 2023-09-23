//
//  Loadable.swift
//  
//
//  Created by Zaheer Moola on 2023/09/23.
//

import Foundation

public enum Loadable<T> {
    case loading
    case loaded(T)
    case error(Error)
}

extension Loadable: Equatable where T: Equatable {

    public static func == (lhs: Loadable<T>, rhs: Loadable<T>) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading):
            return true
        case (.loaded(let first), .loaded(let second)):
            return first == second
        case (.error(let first), .error(let second)):
            return first.localizedDescription == second.localizedDescription
        default:
            return false
        }
    }

}
