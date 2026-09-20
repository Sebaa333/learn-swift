//
//  SafariView.swift
//  Apple-Frameworks
//
//  Created by sebastian santivanez on 15/07/2026.
//

import SwiftUI
import SafariServices


struct SafariView: UIViewControllerRepresentable{
    
    let url : URL
    
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) ->
    SFSafariViewController {
        SFSafariViewController(url: url)
    }
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {}
}
