//
//  SplashScreen.swift
//  UI-334 (iOS)
//
//  Created by nyannyan0328 on 2021/10/19.
//

import SwiftUI

struct SplashScreen: View {
    @State var startAnimation : Bool = false
    @State var bowAnimation : Bool = false
    @State var growAnimation : Bool = false
    
    @State var showPlus : Bool = false
    @State var plusBGGlow = false
    
    @State var endAnimation : Bool = false
    var body: some View {
        HStack{
            if !endAnimation{
                
                ZStack{
                    
                    Color("BG")
                        .ignoresSafeArea()
                    
                    GeometryReader{proxy in
                        
                        let size = proxy.size
                        
                        
                        ZStack{
                            
                            
                            Circle()
                                .trim(from: 0, to: bowAnimation ? 0.5 : 0)//時計回りに回転
                                .stroke(
                                
                                LinearGradient(colors: [
                                    
                                    Color("Gradient1"),
                                    Color("Gradient2"),
                                    Color("Gradient3"),
                                    Color("Gradient4"),
                                    Color("Gradient5").opacity(0.5),
                                    Color("BG"),
                                    Color("BG"),
                                    Color("BG"),
                                
                                ], startPoint: .leading, endPoint: .trailing),style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round)
                                
                                )
                                .overlay(
                                
                                
                                Circle()
                                    .fill(Color.white).opacity(0.5)
                                    .frame(width: 6, height: 6)
                                    .overlay(
                                    
                                    Circle()
                                        .fill(Color.white).opacity(growAnimation ? 0.2 : 0.1)
                                        .frame(width: 20, height:20)
                                    
                                    )
                                   
                                    .blur(radius: 2.5)
                                    .offset(x: (size.width / 2) / 2)
                                    .rotationEffect(.init(degrees: bowAnimation ? 180 : 0))
                                    .opacity(startAnimation ? 1 : 0)
                                
                                )
                                .frame(width: size.width / 2, height: size.height / 1.9)
                                .rotationEffect(.init(degrees: -200))
                                .offset(y: 10)
                            
                            HStack(spacing:-20){
                                
                                
                                Image("disney")
                                    .resizable()
                                    .renderingMode(.template)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: size.width / 1.9, height: size.height / 1.9)
                                    .opacity(bowAnimation ? 1 : 0)
                                   
                                
                                Image("plus")
                                    .resizable()
                                    .renderingMode(.template)
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 80, height: 80)
                                    .background(
                                    
                                        ZStack{
                                            
                                            Circle()
                                                .fill(.white.opacity(0.25))
                                                .frame(width: 20, height: 20)
                                                .blur(radius: 2)
                                            Circle()
                                                .fill(.white.opacity(0.25))
                                                .frame(width: 35, height: 35)
                                                .blur(radius: 2)
                                        }
                                            .opacity(plusBGGlow ? 1 : 0)
                                    
                                    )
                                
                                    .scaleEffect(showPlus ? 1 : 0)
                                    
                            }
                            .foregroundColor(.white)
                            
                            
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        
                    }
                }
                .onAppear {
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        
                        
                        withAnimation(.linear(duration: 2)){
                            
                            bowAnimation.toggle()
                        }
                        withAnimation(.linear(duration: 1).repeatForever(autoreverses: true)){
                            
                            growAnimation.toggle()
                        }
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            
                            withAnimation(.spring()){
                                
                                startAnimation.toggle()
                            }
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            
                            withAnimation(.spring()){
                                showPlus.toggle()
                                startAnimation.toggle()
                            }
                            
                            
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.7) {
                            
                            
                            withAnimation(.linear(duration: 0.5)){
                                
                                plusBGGlow.toggle()
                            }
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                
                                //０.5秒後にサークルを消す
                                withAnimation(.linear(duration: 0.4)){
                                    
                                    plusBGGlow.toggle()
                                }
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                    
                                    //０.5秒後にサークルを消す
                                    withAnimation{
                                        
                                        endAnimation.toggle()
                                    }
                                    
                                    
                                }
                                
                                
                            }
                            
                           
                            
                            
                        }
                        
                        
                    }
                    
                    
                }
            }
        }
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
