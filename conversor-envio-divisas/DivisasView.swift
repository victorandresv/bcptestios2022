//
//  DivisasView.swift
//  conversor-envio-divisas
//
//  Created by Victor Vargas on 04-05-22.
//

import SwiftUI

private let Divisas = [
    DivisaModel(code: "USD", name: "Estados Unidos", flag: Image("FlagUSD"), price: 1),
    DivisaModel(code: "EUR", name: "Europa", flag: Image("FlagEUR"), price: 1),
    DivisaModel(code: "PEN", name: "Perú", flag: Image("FlagPEN"), price: 1),
    DivisaModel(code: "BRL", name: "Brasil", flag: Image("FlagBRL"), price: 1),
    DivisaModel(code: "CLP", name: "Chile", flag: Image("FlagCLP"), price: 1)
]

struct DivisasView: View {
    
    var body: some View {
        
        VStack{
            Image("SplashSmall")
            Spacer()
            
            List(Divisas, id: \.code) { divisa in
                ListItemDivisaView(divisa: divisa)
            }
            
        }
    }
}

struct DivisasView_Previews: PreviewProvider {
    static var previews: some View {
        DivisasView()
    }
}
