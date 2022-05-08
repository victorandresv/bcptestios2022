//
//  HomeView.swift
//  conversor-envio-divisas
//
//  Created by Victor Vargas on 04-05-22.
//

import SwiftUI

struct HomeView: View {
    
    @State private var divisa_a_convertir: Divisa = Divisa(code: "USD", name: "Estados Unidos", coin_name: "Dolares", price_buy: 1, price_sell: 1)
    @State private var divisa_convertida: Divisa = Divisa(code: "EUR", name: "Unión Europea", coin_name: "Euros", price_buy: 0.94, price_sell: 0.96)
    
    @State private var cantidad_a_convertir: Float = 100
    @State private var cantidad_convertida: Float = 0
    @State private var divisas_modal_is_presented1 = false
    @State private var divisas_modal_is_presented2 = false
    @State private var currency_format_from = NumberFormatter()
    @State private var currency_format_to = NumberFormatter()
    
    var body: some View {
        
        currency_format_from.maximumFractionDigits = 2
        
        currency_format_to.maximumFractionDigits = 2
        
            return VStack{
                Image("SplashSmall")
                Spacer()
                
                ZStack{
                    HStack{
                        
                        //CUADRO DE VALORES
                        VStack(spacing: 0){
                            VStack(alignment: .leading, spacing: 0){
                                Text("Tú envías:")
                                    .font(.caption)
                                    .foregroundColor(Color.gray)
                                TextField("Desde", value: $cantidad_a_convertir, formatter: currency_format_from)
                                    .ignoresSafeArea()
                            }
                            .padding(8)
                            
                            Divider()
                                .frame(height: 0.5)
                             .padding(.horizontal, 20)
                             .background(Color.gray)
                            
                            
                            VStack(alignment: .leading, spacing: 0){
                                Text("Tú recibes:")
                                    .font(.caption)
                                    .foregroundColor(Color.gray)
                                TextField("Hasta", value: $cantidad_convertida, formatter: currency_format_to)
                            }
                            .padding(8)
                        }
                        //CUADRO DE VALORES
                        
                        
                        ZStack{
                            Color("BcpBlue")
                                .frame(height: 132)
                            VStack(alignment: .leading, spacing: 0){
                                
                                ZStack{}.frame(height: 20)
                                
                                //DIVISA A CONVERTIR
                                HStack(spacing: 0){
                                    ZStack{}.frame(width: 10)
                                    Button(self.divisa_a_convertir.coin_name){ }
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 12, weight: .bold, design: .default))
                                    .simultaneousGesture(LongPressGesture(minimumDuration: 0.5).onEnded({ _ in
                                        divisas_modal_is_presented1 = true
                                    }))
                                    .fullScreenCover(isPresented: $divisas_modal_is_presented1){
                                        DivisasView(seleccion: self.$divisa_a_convertir, isPresented: $divisas_modal_is_presented1)
                                    }
                                }
                                //DIVISA A CONVERTIR
                                
                                
                                ZStack{
                                    Divider()
                                            .frame(height: 0.5)
                                            .padding(.horizontal, 0.0)
                                         .background(Color.gray)
                                    
                                    HStack(spacing: 0){
                                        Spacer()
                                        Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                                            .resizable(resizingMode: .stretch)
                                            .aspectRatio(contentMode: .fit)
                                            .foregroundColor(.white)
                                            .frame(height: 40)
                                            .padding(8)
                                            .onTapGesture {
                                                self.cantidad_convertida = (self.cantidad_a_convertir / self.divisa_a_convertir.price_sell) * self.divisa_convertida.price_buy
                                                print(self.cantidad_convertida)
                                            }
                                    }
                                }
                                
                                
                                //DIVISA CONVERTIDA
                                HStack(spacing: 0){
                                    ZStack{}.frame(width: 10)
                                    Button(self.divisa_convertida.coin_name){ }
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 12, weight: .bold, design: .default))
                                    .simultaneousGesture(LongPressGesture(minimumDuration: 0.5).onEnded({ _ in
                                        self.divisas_modal_is_presented2 = true
                                    }))
                                    .fullScreenCover(isPresented: $divisas_modal_is_presented2){
                                        DivisasView(seleccion: self.$divisa_convertida, isPresented: $divisas_modal_is_presented2)
                                    }
                                }
                                ZStack{}.frame(height: 20)
                                //DIVISA CONVERTIDA
                                
                                
                            }
                            .padding(0.0)
                        }
                        .frame(width: 100)
                    }
                    .cornerRadius(6)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6).stroke(Color.gray, lineWidth: 1)
                    )
                    .padding()
                    
                }
                
                Text("Compra: \(self.divisa_a_convertir.price_buy) | Venta: \(self.divisa_convertida.price_sell)")
                    .font(.system(size: 14))
                
                Spacer()
                
                ZStack{
                    Color("BcpLightBlue")
                    Button("Empieza tu operación"){
                        
                    }
                    .foregroundColor(Color.white)
                    .font(.system(size: 12, weight: .bold, design: .default))
                    .padding(22)
                }
                .frame(height: 60)
            }
            .onAppear(){
                
            }
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
