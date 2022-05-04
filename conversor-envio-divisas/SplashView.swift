//
//  SplashView.swift
//  conversor-envio-divisas
//
//  Created by Victor Vargas on 04-05-22.
//

import SwiftUI

struct SplashView: View {
    
    @State var animate = false
    @State var endAnimation = false
    
    var body: some View {
        ZStack{
            ZStack{
                Image("SplashBg")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: animate ? .fill:.fit)
                    .frame(width: animate ? nil: 1000, height:animate ? nil: 1000)
                    .scaleEffect(animate ? 3:1)
                    .frame(width: UIScreen.main.bounds.width)
                Image("SplashLarge")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: animate ? .fill:.fit)
                    .frame(width: animate ? nil: 200, height:animate ? nil: 200)
                    .scaleEffect(animate ? 3:1)
                    .frame(width: UIScreen.main.bounds.width)
            }.ignoresSafeArea(.all, edges: .all)
                .onAppear(perform: animateSplash)
                .opacity(endAnimation ? 0:1)
        }
    }
    
    func animateSplash(){
        DispatchQueue.main.asyncAfter(deadline: .now()+0.25){
            withAnimation(Animation.easeIn(duration: 0.55)){
                animate.toggle()
            }
            withAnimation(Animation.easeOut(duration: 0.55)){
                endAnimation.toggle()
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
