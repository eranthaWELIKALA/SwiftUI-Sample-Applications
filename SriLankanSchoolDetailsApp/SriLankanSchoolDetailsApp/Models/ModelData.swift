//
//  ModelData.swift
//  SriLankanSchoolDetailsApp
//
//  Created by Erantha Welikala on 1/3/22.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var schools: [School] = load("schools.json")
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Could not find \(filename) in main bundle")
    }
    
    do {
        data = try Data(contentsOf: file)
    }
    catch {
        fatalError("Could not load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decorder = JSONDecoder()
        return try decorder.decode(T.self, from: data)
    }
    catch {
        fatalError("Could not parse \(filename) as \(T.self):\n\(error)")
    }
}
