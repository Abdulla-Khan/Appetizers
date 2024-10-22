//
//  AppetizersDetailView.swift
//  Todo App
//
//  Created by Ayaz on 22/10/2024.
//

import SwiftUI

struct AppetizersDetailView: View {
    let appetizer : Appetizer
    @Binding var isShowingDetail: Bool
    var body: some View {
        VStack {
//            Image("asian-flank-steak")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 300,height: 225)
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300,height: 225)
            VStack{
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                HStack(spacing: 40){
                    InfoStack(
                        heading: "Calories", value: appetizer.calories
                    )
                    InfoStack(
                        heading: "Carbs", value: appetizer.carbs
                    )
                    InfoStack(
                        heading: "Protein", value: appetizer.protein
                    )
                }
            }
            Button{} label: {
                AppetizerButton(price: appetizer.price)
            }.padding(.bottom, 30)
        }.frame(width: 300)
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .shadow(radius: 10)
            .overlay(Button{
                isShowingDetail = false
            } label: {
                CloseButton()
            },alignment: .topTrailing
        )
    }
}

#Preview {
    AppetizersDetailView(
        appetizer: MockData.sampleAppetizer,
        isShowingDetail: .constant(false)
    )
}


struct InfoStack: View {
    var heading: String
    var value: Int
    var body: some View {
        VStack(spacing: 5){
            Text(heading)
                .bold()
                .font(.caption)
            Text("\(value)")
                .foregroundStyle(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}
