//
//  NavView.swift
//  FinalPokemon
//
//  Created by PETERS, CARLIE E. on 5/7/25.
//

import SwiftUI

struct NavView: View {
    var body: some View {
        
        NavigationView{
            HStack{
                NavigationLink(destination: SaveView()) {
                    Image(systemName: "list.bullet.circle")
                        .foregroundColor(.black)
                }
                NavigationLink(destination: ListView()) {
                    Image(systemName: "house.fill")
                        .foregroundColor(.black)
                }
                NavigationLink(destination: DetailsPage()) {
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
