//
//  ScanData.swift
//  Scan-Ocr
//
//  Created by James Lea on 1/3/24.
//

import Foundation

struct ScanData: Identifiable {
    var id = UUID()
    let content: String
    
    init(content: String){
        self.content = content
    }
    
}
