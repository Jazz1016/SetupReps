//
//  PlayerGridView.swift
//  PlayerShowcase
//
//  Created by James Lea on 7/12/23.
//

import SwiftUI

struct PlayerGridView: View {
    @State var isPlayerDetailShown = false
    @State var selectedPlayer: Player?
    
//    let gridColumns = [
//            GridItem(.flexible()),
//            GridItem(.flexible()),
//            GridItem(.flexible())
//        ]
    
    var body: some View {
        ZStack {
            NavigationStack {
                ScrollView {
                    LazyVGrid(columns: gridColumns) {
                        ForEach(MockData.jazzPlayers, id: \.self) { player in
                            PlayerGridCell(player: player)
                            .onTapGesture {
                                isPlayerDetailShown = true
                            }
                        }
                    }
                }
                .navigationTitle("Jazz Players")
            }
            
            if isPlayerDetailShown {
                PlayerDetailView(selectedPlayer: selectedPlayer!, isDetailShown: $isPlayerDetailShown)
            }
            
            
        }
    }
}

struct PlayerGridView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerGridView()
    }
}
