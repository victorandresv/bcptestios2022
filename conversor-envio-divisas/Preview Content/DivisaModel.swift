//
//  DivisaModel.swift
//  conversor-envio-divisas
//
//  Created by Victor Vargas on 04-05-22.
//

import Foundation
import SwiftUI

struct DivisaModel {
    var code, name: String
    var flag: Image
    var price: Float
}

struct Divisa: Codable {
    var code, name: String
    var price_buy, price_sell: Float
    
    static let allDivisas: [Divisa] = Bundle.main.decode(file: "divisas.json")
}

extension Bundle {
    func decode<T: Decodable>(file:String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("El archivo json no existe")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("El archivo json no se pudo cargar")
        }
        
        let decoder = JSONDecoder()
        
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
            fatalError("El archivo json no se pudo decodificar")
        }
        
        return loadedData
    }
}
