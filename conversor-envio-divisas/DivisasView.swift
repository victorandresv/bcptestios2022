//
//  DivisasView.swift
//  conversor-envio-divisas
//
//  Created by Victor Vargas on 04-05-22.
//

import SwiftUI

struct DivisasView: View {
    
    private var divisas: [Divisa] = Divisa.allDivisas
    
    var body: some View {
        VStack{
            Image("SplashSmall")
            Spacer()
            
            List(divisas, id: \.code) { divisa in
                let item = DivisaModel(code: divisa.code, name: divisa.name, flag: Image("Flag\(divisa.code)"), price: divisa.price_sell)
                ListItemDivisaView(divisa: item)
            }
            
        }
    }
}

struct DivisasView_Previews: PreviewProvider {
    static var previews: some View {
        DivisasView()
    }
}
