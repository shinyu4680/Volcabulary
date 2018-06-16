//
//  Voc.swift
//  Volcabulary
//
//  Created by kevin on 2018/6/15.
//  Copyright © 2018 KevinChang. All rights reserved.
//

import Foundation

struct VocabularyFav: Codable {
    var engTitle: String
    var chiTitle: String
    var engSentence: String
    var chiSentence: String


    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!

    static func saveToFile(vocabularyFavs: [VocabularyFav]) {
        let propertyEncoder = PropertyListEncoder()
        if let data = try? propertyEncoder.encode(vocabularyFavs) {
            let url = VocabularyFav.documentsDirectory.appendingPathComponent("vocabularyFav")
            try? data.write(to: url)
            //print(url.path)
        }
    }
    
    static func readFromFile () -> [VocabularyFav]? {
        let propertyDecoder = PropertyListDecoder()
        let url = VocabularyFav.documentsDirectory.appendingPathComponent("vocabularyFav")
        if let data = try? Data(contentsOf: url), let vocabularyFavs = try?
            propertyDecoder.decode([VocabularyFav].self, from: data) {
            return vocabularyFavs
        }else {
            return nil
        }
    }

}


