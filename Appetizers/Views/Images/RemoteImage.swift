//
//  RemoteImage.swift
//  Todo App
//
//  Created by Ayaz on 22/10/2024.
//

import SwiftUI

final class ImageLoader: ObservableObject {
   @Published var image: Image? = nil
    
    func loadImage(fromURLString : String){
        NetworkManger.shared.getImages(fromUrlString: fromURLString) { uiImage in
            guard let uiImage = uiImage else { return }
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}


struct RemoteImage : View {
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("food-placeholder").resizable()
    }
}

struct AppetizerRemoteImage: View{
    @StateObject var  imageLoader = ImageLoader()
    var urlString: String
    var body: some View{
        RemoteImage(
            image: imageLoader.image
        ).onAppear{
            imageLoader.loadImage(fromURLString: urlString)
        }
    }
}
