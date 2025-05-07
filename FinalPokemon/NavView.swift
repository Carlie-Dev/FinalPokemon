//
//  NavView.swift
//  FinalPokemon
//
//  Created by PETERS, CARLIE E. on 5/7/25.
//

import SwiftUI

struct NavView: View {
    @ObservedObject var pokeView = PokemonViewModel()
    var body: some View {
        
        NavigationView{
            HStack{
                NavigationLink(destination: SaveView(poke: pokeView)) {
                    Image(systemName: "list.bullet.circle")
                        .foregroundColor(.black)
                }
                NavigationLink(destination: ListView(poke: pokeView)) {
                    Image(systemName: "house.fill")
                        .foregroundColor(.black)
                }
                NavigationLink(destination: DetailsPage(poke: pokeView)) {
                    Image(systemName: "books.vertical.fill")
                        .foregroundColor(.black)
                }
                
            }
           
        }
    }
}
    
#Preview {
    NavView()
}
