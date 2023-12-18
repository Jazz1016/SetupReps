//
//  PlayerDetailView.swift
//  PlayerShowcase
//
//  Created by James Lea on 7/12/23.
//

import SwiftUI

struct PlayerDetailView: View {
    let selectedPlayer: Player
    @Binding var isDetailShown: Bool
    
    var body: some View {
        VStack {
            Text(selectedPlayer.firstName)
            Text(selectedPlayer.lastName)
        }
    }
}

struct PlayerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerDetailView(selectedPlayer: MockData.jazzPlayers.first!, isDetailShown: .constant(true))
    }
}
