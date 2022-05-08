//
//  DivisasView.swift
//  conversor-envio-divisas
//
//  Created by Victor Vargas on 04-05-22.
//

import SwiftUI

struct DivisasView: View {
    
    var divisas: [Divisa] = Divisa.allDivisas
    @Binding var seleccion: Divisa
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack{
            Image("SplashSmall")
            Spacer()
            
            List(divisas, id: \.code) { divisa in
                let item = DivisaModel(code: divisa.code, name: divisa.name, flag: Image("Flag\(divisa.code)"), price: divisa.price_sell)
                ListItemDivisaView(divisa: item)
                    .onTapGesture {
                        self.seleccion = divisa
                        self.isPresented = false
                    }
            }
            
        }
    }
}
