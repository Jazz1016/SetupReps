//
//  PlayerGridView.swift
//  PlayerShowcase
//
//  Created by James Lea on 7/12/23.
//

import SwiftUI

struct PlayerGridView: View {
    var isPlayerDetailShown = false
    var selectedPlayer: Player?
    
    let gridColumns = [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    
    var body: some View {
        ZStack {
            NavigationStack {
                ScrollView {
                    LazyVGrid(columns: gridColumns) {
                        ForEach(MockData.jazzPlayers, id: \.self) { player in
                            VStack {
                                Image(player.image)
                                    .resizable()
                                    .frame(width: 40, height: 50)
                                Text(player.lastName)
                                Text(player.height)
                                Text(player.weight)
                            }
                        }
                    }
                }
                .navigationTitle("Jazz Players")
            }
            
            if isPlayerDetailShown {
                PlayerDetailView(selectedPlayer: selectedPlayer!)
            }
            
            
        }
    }
}

struct PlayerGridView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerGridView()
    }
}
