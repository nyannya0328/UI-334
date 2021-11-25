//
//  ContentView.swift
//  Shared
//
//  Created by nyannyan0328 on 2021/10/19.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            
            ScrollView(.vertical, showsIndicators: false) {
                
                
                VStack(alignment: .leading, spacing: 30) {
                    
                    Image("p1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width : 400,height: 400)
                        .cornerRadius(15)
                      
                    
                    
                    Text("SEA")
                        .font(.title2.bold())
                       
                }
               
                .padding()
            }
            .navigationTitle("Lates")
        }
        .overlay(SplashScreen())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
