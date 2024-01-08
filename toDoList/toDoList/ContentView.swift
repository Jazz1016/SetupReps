//
//  ContentView.swift
//  toDoList
//
//  Created by James Lea on 1/7/24.
//

import SwiftUI

struct ContentView: View {
    @State var goyim = [Character(name: "mike"), Character(name: "fred"), Character(name: "sam"), Character(name: "nick")]
    
    var body: some View {
        VStack {
            List {
                ForEach(goyim) { goy in
                    Text(goy.name)
                }
                .onMove(perform: move)
            }
        }
    }
    
    func move(from source: IndexSet, to destination: Int) {
        goyim.move(fromOffsets: source, toOffset: destination)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Character: Identifiable {
    var id = UUID()
    var name: String
}
