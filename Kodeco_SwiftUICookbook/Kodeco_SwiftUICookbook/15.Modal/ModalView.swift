import SwiftUI

struct Product: Identifiable {
  let name: String
  let price: Int
  
  var id: String { return name }
}

struct ProductDetailView: View {
  let product: Product
  
  var body: some View {
    VStack {
      Text(product.name)
        .font(.title)
      Text("Pirce: \(product.price)")
    }
  }
}

struct ModalView: View {
  let products = [
    Product(name: "Macbook Pro", price: 1299),
    Product(name: "iPhone", price: 999),
    Product(name: "AirPods", price: 199)
  ]
  
  @State private var selectedProduct: Product?
  
  var body: some View {
    List(products) { product in
      Text(product.name)
        .onTapGesture {
          selectedProduct = product
        }
    }
    .sheet(item: $selectedProduct) { product in
      ProductDetailView(product: product)
    }
  }
}

struct ModalView_Previews: PreviewProvider {
  static var previews: some View {
    ModalView()
  }
}
