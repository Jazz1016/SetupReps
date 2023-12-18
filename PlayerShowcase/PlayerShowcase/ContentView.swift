//
//  ContentView.swift
//  PlayerShowcase
//
//  Created by James Lea on 7/11/23.
//

import SwiftUI

struct ContentView: View {
    @State var count: Int = 0
    var body: some View {
        VStack {
            VStack {
                Text("\(count)")
                HStack {
                    Button {
                        plusOne()
                    } label: {
                        Text("+")
                    }
                    Button {
                        minusOne()
                    } label: {
                        Text("-")
                    }
                }
            }
        }
    }
    
    func plusOne() {
        count += 1
    }
    
    func minusOne() {
        count -= 1
    }
    
    func goyslop() {
        print("McDonald")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
