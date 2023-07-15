//
//  PlayerGridCell.swift
//  PlayerShowcase
//
//  Created by James Lea on 7/14/23.
//

import SwiftUI

struct PlayerGridCell: View {
    var player: Player
    
    var body: some View {
        VStack {
            Image(player.image)
                .resizable()
                .frame(width: 40, height: 50)
            Text(player.lastName)
                .fontWeight(.semibold)
            Text(player.height)
            Text(player.weight)
        }
    }
}

struct PlayerGridCell_Previews: PreviewProvider {
    static var previews: some View {
        PlayerGridCell(player: MockData.jazzPlayers.first!)
    }
}
