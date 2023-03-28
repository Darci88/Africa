//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by user219285 on 3/27/23.
//

import Foundation

extension Bundle {
    func decode<T: Codable>(_ file: String) -> T {
        //1. Locate the json file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        //2. create a property for the data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Dailed to load \(file) from bundle.")
        }
        
        //3. Create a decoder
        let decoder = JSONDecoder()
        
        //4.Create a property for the decoded data
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failde to decode \(file) from bundle.")
        }
        
        //5. Return ready-to-use data
        return loaded
    }
}
