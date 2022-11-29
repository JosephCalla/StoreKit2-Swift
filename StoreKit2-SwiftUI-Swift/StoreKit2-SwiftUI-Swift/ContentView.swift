//
//  ContentView.swift
//  StoreKit2-SwiftUI-Swift
//
//  Created by Joseph Estanislao Calla Moreyra on 28/11/22.
//

import SwiftUI
import CoreData
import StoreKit // StoreKit 2

// Fetch Products
// Purchase product
// Update UI / Fetch Product State

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    
    var body: some View {
        VStack {
            Image(systemName: "applelogo")
                .resizable()
                .frame(width: 100, height: 100)
            
            Text("Apple Store")
                .bold()
                .font(.system(size: 32))
            
            Image("Watch")
                .resizable()
                .aspectRatio(contentMode: .fit)
    
            
            if let product = viewModel.products.first {
                Text(product.displayName)
                Text(product.description)
                Button {
                    if viewModel.purchasedIds.isEmpty {
                        viewModel.purchase()
                    }
                } label: {
                    Text(viewModel.purchasedIds.isEmpty ? "Buy Now \(product.displayName)" : "Purchased")
                        .bold()
                        .foregroundColor(Color.white)
                        .frame(width: 220, height: 50)
                        .background(viewModel.purchasedIds.isEmpty ? Color.blue : Color.green)
                        .cornerRadius(8)
                }
            }
        }
        .onAppear {
            viewModel.fetchProducts()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
