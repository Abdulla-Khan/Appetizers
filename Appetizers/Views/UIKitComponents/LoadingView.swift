//
//  LoadingView.swift
//  Todo App
//
//  Created by Ayaz on 22/10/2024.
//

import SwiftUI

struct  LoadingViewIndicator : UIViewRepresentable{
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.color = UIColor.brandColor
        activityIndicatorView.startAnimating()
        return activityIndicatorView
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}
    
    
}


struct LoadingView : View {
    var body: some View {
        ZStack{
            Color(.systemBackground).edgesIgnoringSafeArea(.all)
            LoadingViewIndicator()
        }
        
    }
}
