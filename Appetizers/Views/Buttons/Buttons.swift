import SwiftUI

struct AppetizerButton: View {
    var price : Double
    var body: some View {
        Text("$\(price, specifier: "%.2f") - Add to Order")
            .fontWeight(.semibold)
            .font(.title3)
            .frame(width: 260, height: 50)
            .foregroundStyle(.white)
            .background(.brandPrimary)
            .cornerRadius(10)
    }
}

struct CloseButton: View {
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 30,height: 30)
                .foregroundStyle(.white)
                .opacity(0.6)
            Image(systemName:"xmark")
                .imageScale(.small)
                .frame(width: 44,height: 44)
                .foregroundStyle(.black)
        }
    }
}
