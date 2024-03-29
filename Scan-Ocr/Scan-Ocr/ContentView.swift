//
//  ContentView.swift
//  Scan-Ocr
//
//  Created by James Lea on 1/3/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showScannerSheet = false
    @State private var texts: [ScanData] = []
    var body: some View {
        NavigationView {
            VStack {
                if texts.count > 0 {
                    List {
                        ForEach(texts) {text in
                            NavigationLink(destination: ScrollView{
                                Text(text.content)
                            }, label: {
                                Text(text.content).lineLimit(1)
                            })
                        }
                    }
                }
            }
            .navigationTitle("Scan OCR")
            .navigationBarItems(trailing: Button(action: {
                showScannerSheet = true
            }, label: {
                Image(systemName: "doc.text.viewfinder")
                    .font(.title)
            }))
            .sheet(isPresented: $showScannerSheet) {
                makeScannerView()
            }
        }
    }
    private func makeScannerView() -> ScannerView {
        ScannerView(completion: {
            textPerPage in
            if let outputText = textPerPage?.joined(separator: "\n").trimmingCharacters(in: .whitespacesAndNewlines) {
                let newScanData = ScanData(content: outputText)
                print(newScanData)
                self.texts.append(newScanData)
            }
            self.showScannerSheet = false
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
