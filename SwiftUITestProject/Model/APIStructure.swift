//
//  APIStructure.swift
//  SwiftUITestProject
//
//  Created by TTGMOTSF on 21/03/2023.
//

import SwiftUI

struct Latest: Codable, Identifiable {

    var id = UUID()
    let category: String
    let name: String
    let price: Int
    let imageUrl: URL
    
    var image: UIImage {
        guard let data = try? Data(contentsOf: imageUrl),
              let image = UIImage(data: data) else {
            return UIImage(systemName: "photo")!
        }
        return image
    }
}
struct FlashSales: Codable, Identifiable {
    
    var id = UUID()
    let name: String
    let price: Int
    let discount: Int
    let imageUrl: URL
    
    var image: UIImage {
        guard let data = try? Data(contentsOf: imageUrl),
              let image = UIImage(data: data) else {
            return UIImage(systemName: "photo")!
        }
        return image
    }
}
