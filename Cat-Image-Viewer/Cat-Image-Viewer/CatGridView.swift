//
//  CatGridView.swift
//  Cat-Image-Viewer
//
//  Created by James Lea on 5/22/23.
//

import SwiftUI

struct CatGridView: View {
    let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(MockData.sampleCats, id: \.id) { cat in
                        Image("missing-cat")
                            .resizable()
                            .frame(width: 90, height: 90)
                    }
                }
                .padding()
            }
        }
    }
}

struct CatGridView_Previews: PreviewProvider {
    static var previews: some View {
        CatGridView()
    }
}
