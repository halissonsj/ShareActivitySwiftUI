//
//  ContentView.swift
//  ShareTest
//
//  Created by Halisson da Silva Jesus on 25/10/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showShareSheet: Bool = false
    @State var shareSheetItems: [Any] = [UIImage(systemName: "trash.fill") as Any,
                                         "texto teste compartilhado: www.google.com",
                                         URL(string: "www.google.com")]

    var body: some View {
        ZStack {
            Color.red
                .ignoresSafeArea()
            
            VStack {
                Button {
                    self.showShareSheet.toggle()
                } label: {
                    Text("SHARE")
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .sheet(isPresented: $showShareSheet, content: {
            ActivityViewController(activityItems: $shareSheetItems)
        })
//        .shareSheet(items: shareSheetItems)
    }
}

#Preview {
    ContentView()
}
