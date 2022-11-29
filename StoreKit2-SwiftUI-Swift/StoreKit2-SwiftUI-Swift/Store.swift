//
//  Store.swift
//  StoreKit2-SwiftUI-Swift
//
//  Created by Joseph Estanislao Calla Moreyra on 28/11/22.
//
import StoreKit
import Foundation
import SwiftUI

class ViewModel: ObservableObject {
    @Published var products: [Product] = []
    @Published var purchasedIds: [String] = []
    func fetchProducts() {
        async {
            do {
                let products = try await Product.products(for: ["com.apple.watch_new"])
                DispatchQueue.main.async {
                    self.products = products
                }
                
                if let product = products.first {
                    await isPurchased(product: product)
                }
                
            } catch {
                print("Error \(error)")
            }
        }
    }
    
    func isPurchased(product: Product) async {
        guard let state = await product.currentEntitlement else { return }
        guard let state = await product.currentEntitlement else { return }
        switch state {
        case .verified(let transaction):
            print(transaction.productID)
            DispatchQueue.main.async {
                self.purchasedIds.append(transaction.productID)
            }
            
        case .unverified(_):
            break
        }
    }
    
    func purchase() {
        async {
            guard let product = products.first else { return }
            do {
                let result = try await product.purchase()
                
                switch result {
                case .success(let verification):
                    switch verification {
                    case .verified(let trans):
                        print(trans.productID)
                    case .unverified(_):
                        break
                    }
                case .userCancelled:
                    break
                case .pending:
                    break
                }
            } catch {
                print("Error \(error)")
            }
        }
    }
}
