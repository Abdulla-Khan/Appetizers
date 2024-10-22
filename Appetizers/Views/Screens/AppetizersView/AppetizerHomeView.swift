//
//  AppetizerHomeView.swift
//  Todo App
//
//  Created by Ayaz on 22/10/2024.
//

import SwiftUI

struct AppetizerHomeView: View {
    @StateObject var appetizerHomeViewModel: AppetizerHomeViewModel = AppetizerHomeViewModel()
    var body: some View {
        ZStack{
            NavigationView{
                List(appetizerHomeViewModel.appetizers) { appetizer in
                    AppetizerListCell(appetizer:  appetizer).onTapGesture{
                        appetizerHomeViewModel.isShowingDetail  = true
                        appetizerHomeViewModel.selectedAppetizer = appetizer
                    }
                }
                .navigationTitle("🍟Appetizers")
                .disabled(appetizerHomeViewModel.isShowingDetail)
            }.onAppear(){
                appetizerHomeViewModel.getAppetizer()
            }.blur(radius: appetizerHomeViewModel.isShowingDetail ? 20 : 0)
            
            if appetizerHomeViewModel.isShowingDetail{
                AppetizersDetailView(appetizer: appetizerHomeViewModel.selectedAppetizer!, isShowingDetail: $appetizerHomeViewModel.isShowingDetail)
            }
            if appetizerHomeViewModel.isLoading{
                LoadingView()
            }
        }.alert(item: $appetizerHomeViewModel.alertItem)
        {alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        }
    }
}


#Preview {
    AppetizerHomeView()    
}
