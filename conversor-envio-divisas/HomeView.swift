//
//  HomeView.swift
//  conversor-envio-divisas
//
//  Created by Victor Vargas on 04-05-22.
//

import SwiftUI

struct HomeView: View {
    
    @State private var cantidad_a_convertir: String = "100"
    @State private var cantidad_convertida: String = "1000"
    @State private var texto_divisa_desde: String = "Dólares"
    @State private var texto_divisa_hacia: String = "Soles"
    @State private var texto_precio_compra_venta: String = "Compra: 3.25 | Venta: 3.29"
    @State private var divisas_modal_is_presented = false
    
    var body: some View {
            
            VStack{
                Image("SplashSmall")
                Spacer()
                
                ZStack{
                    HStack{
                        VStack(spacing: 0){
                            VStack(alignment: .leading, spacing: 0){
                                Text("Tú envías:")
                                    .font(.caption)
                                    .foregroundColor(Color.gray)
                                TextField("100", text: $cantidad_a_convertir)
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
                                TextField("100", text: $cantidad_convertida)
                            }
                            .padding(8)
                        }
                        
                        ZStack{
                            Color("BcpBlue")
                                .frame(height: 132)
                            VStack(alignment: .leading, spacing: 0){
                                
                                ZStack{}.frame(height: 20)
                                
                                HStack(spacing: 0){
                                    ZStack{}.frame(width: 10)
                                    Button(self.texto_divisa_desde){ }
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 12, weight: .bold, design: .default))
                                    .simultaneousGesture(LongPressGesture(minimumDuration: 1.0).onEnded({ _ in
                                        self.divisas_modal_is_presented = true
                                    }))
                                    .fullScreenCover(isPresented: $divisas_modal_is_presented, content: DivisasView.init)
                                }
                                
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
                                    }
                                }
                                
                                HStack(spacing: 0){
                                    ZStack{}.frame(width: 10)
                                    Button(self.texto_divisa_hacia){
                                        
                                    }
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 12, weight: .bold, design: .default))
                                }
                                ZStack{}.frame(height: 20)
                                
                                
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
                
                Text(self.texto_precio_compra_venta)
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
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
