//
//  ListItemDivisaView.swift
//  conversor-envio-divisas
//
//  Created by Victor Vargas on 04-05-22.
//

import SwiftUI

struct ListItemDivisaView: View {
    
    var divisa: DivisaModel
    
    var body: some View {
        HStack(spacing:0){
            divisa.flag
            
            VStack(alignment:.leading, spacing:0){
                Text(divisa.name)
                Text("1 USD = ")
                + Text(String(divisa.price))
                + Text(" USD")
            }
            .padding(12)
        }
    }
}

struct ListItemDivisaView_Previews: PreviewProvider {
    static var previews: some View {
        var divisa = DivisaModel(code: "USD", name: "Estados Unidos", flag: Image("FlagUSD"), price: 1)
        ListItemDivisaView(divisa: divisa)
    }
}
