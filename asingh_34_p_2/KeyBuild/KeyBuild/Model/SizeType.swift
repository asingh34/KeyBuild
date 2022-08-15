//
//  SizeType.swift
//  KeyBuild
//
//  Created by Anant Singh on 7/14/21.
//

import Foundation

enum SizeType: Int, CaseIterable {
    
    case sixtyFive, seventy, seventyFive, nintey, hundred, unknown
    
    func size() -> String {
        switch self {
            case .sixtyFive:
                return "65%"
            case .seventy:
                return "70%"
            case .seventyFive:
                return "75%"
            case .nintey:
                return "90%"
            case .hundred:
                return "100%"
            case .unknown:
                return "Unkown"
        }
    }
    
    init(_ size: String) {
        switch size {
            case "65%":
                self = .sixtyFive
            case "70%":
                self = .seventy
            case "75%":
                self = .seventyFive
            case "90%":
                self = .nintey
            case "100%":
                self = .hundred
            default:
                self = .unknown
        }
    }
}
