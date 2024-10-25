//
//  ShareController.swift
//  ShareTest
//
//  Created by Halisson da Silva Jesus on 25/10/24.
//

import Foundation
import SwiftUI

struct ActivityViewController: UIViewControllerRepresentable {
    
    @Binding var activityItems: [Any]
    var excludedActivityTypes: [UIActivity.ActivityType]? = nil
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ActivityViewController>) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: activityItems,
                                                  applicationActivities: nil)
        
        controller.excludedActivityTypes = excludedActivityTypes
        
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: UIViewControllerRepresentableContext<ActivityViewController>) { }
}

struct ShareSheetModifer: ViewModifier {
    @State private var showShareSheet: Bool = false
    @State var shareSheetItems: [Any] = []
    
    func body(content: Content) -> some View {
        content
            .contextMenu {
                Button(action: {
                    self.showShareSheet.toggle()
                }) {
                    Text("Share")
                    Image(systemName: "square.and.arrow.up")
                }
            }
            .sheet(isPresented: $showShareSheet, content: {
                ActivityViewController(activityItems: self.$shareSheetItems)
            })
    }
}

extension View {
    func shareSheet(items: [Any], excludedActivityTypes: [UIActivity.ActivityType]? = nil) -> some View {
        self.modifier(ShareSheetModifer(shareSheetItems: items))
    }
}
