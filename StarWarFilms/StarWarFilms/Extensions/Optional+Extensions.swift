//
//  Optional+Extensions.swift
//  StarWarFilms
//
//  Created by Khoa Nguyen on 07/12/2023.
//

import Foundation

extension Optional where Wrapped: ExpressibleByStringLiteral {
    var orStringEmpty: Wrapped {
        switch self {
        case .some(let value):
            return value
        case _:
            return ""
        }
    }
}

extension Optional where Wrapped == Int {
    var orZero: Wrapped {
        switch self {
        case .some(let value):
            return value
        case _:
            return 0
        }
    }
}

extension Optional where Wrapped == Double {
    var orZero: Wrapped {
        switch self {
        case .some(let value):
            return value
        case _:
            return 0
        }
    }
}

extension Optional where Wrapped == Bool {
    var orFalse: Wrapped {
        switch self {
        case .some(let value):
            return value
        case _:
            return false
        }
    }
}

extension Optional where Wrapped: Collection {
    var orArrEmpty: Wrapped {
        switch self {
        case .some(let value):
            return value
        case _:
            return [] as! Wrapped
        }
    }
}

extension Optional where Wrapped == Date {
    var orCurrent: Wrapped {
        switch self {
        case .some(let value):
            return value
        case _:
            return Date()
        }
    }
}


extension Optional where Wrapped == String {
    var intOrZero: Int {
        return Int(Float(self ?? "0") ?? 0)
    }

    func defaulted(to value: String) -> String {
        return isNilOrEmpty ? value : self!
    }

    var isNilOrEmpty: Bool {
        return self == nil || self?.isEmpty == true
    }
}
