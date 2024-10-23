//
//  AppetizerHomeViewModel.swift
//  Todo App
//
//  Created by Ayaz on 22/10/2024.
//

import SwiftUI

final class AppetizerHomeViewModel: ObservableObject{
    @Published  var appetizers: [Appetizer]=[]
    @Published var alertItem :AlertItem?
    @Published var isLoading: Bool = false
    @Published  var isShowingDetail: Bool = false
    @Published  var selectedAppetizer: Appetizer?
    func getAppetizer(){
        isLoading = true
        NetworkManger.shared.getAppetizers { result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                    
                case .failure(let error):
                    switch error {
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                        
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                        
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                        
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                        
                    }
                }
            }
        }
    }
}
