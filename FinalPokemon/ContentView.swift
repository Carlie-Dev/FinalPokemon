//
//  ContentView.swift
//  FinalPokemon
//
//  Created by PETERS, CARLIE E. on 4/28/25.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack{
            Text("Poke Dex").font(.largeTitle)
            Text("Got to Catch 'em All!")
            NavView()
        }.padding(10)
        
    }
        
}

#Preview {
    ContentView()
}
