//
//  APIError.swift
//  standalone-akash
//
//  Created by keckuser on 5/3/24.
//


import Foundation

enum AppError: Error {
    case notURL
    case notFound
    case decodingError
    case unexpectedError
    case noDirectoryError
    
    func printError() -> String {
        switch self {
        case .notURL:
            return "Invalid URL"
        case .notFound:
            return "Server not found"
        case .decodingError:
            return "Invalid server data"
        case .unexpectedError:
            return "Oops! Error"
        case .noDirectoryError:
            return "No directory"
        }
    }
}
