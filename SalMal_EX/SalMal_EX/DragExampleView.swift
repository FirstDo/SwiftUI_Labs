import SwiftUI

struct DragExampleView: View {
  @GestureState private var currentState: CGSize = .zero
  
  var drag: some Gesture {
    DragGesture()
      .updating($currentState) { value, state, transaction in
        state = value.translation
        transaction.animation = .spring()
      }
  }
  
  var body: some View {
    Color.black.opacity(0.1)
      .frame(width: 400, height: 400)
      .overlay {
        Circle()
          .fill(Color.red)
          .frame(width: 80, height: 80, alignment: .center)
          .offset(currentState)
          .gesture(drag)
      }
  }
}

struct DragExampleView_Previews: PreviewProvider {
  static var previews: some View {
    DragExampleView()
  }
}
