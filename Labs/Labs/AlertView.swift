import SwiftUI

enum AlertItem: Equatable {
  case one
  case two
  case three
  
  var title: String {
    switch self {
    case .one:
      return "진료안내"
    case .two:
      return "안내"
    case .three:
      return "안내"
    }
  }
  
  var message: String {
    switch self {
    case .one:
      return "설정중이던 진료조건을 임시저장할까요"
    case .two:
      return "약 수령방법을\n당일배송으로 선택하시겠습니까?"
    case .three:
      return "진료과하을 변경하시면 선생님을\n다시 선택하고 예약을 진행하셔야 합니다\n그래도 변경하시겠습니까?"
    }
  }
  
  var description: String? {
    switch self {
    case .one:
      return nil
    case .two:
      return "약 3시간 이내 배송"
    case .three:
      return nil
    }
  }
}

extension View {
  func alert(
    item: Binding<AlertItem?>,
    confirmAction: @escaping () -> Void,
    cancelAction: (() -> Void)? = nil
  ) -> some View {
    modifier(AlertModifier(item: item, confirmAction: confirmAction, cancelAction: cancelAction))
  }
}

struct AlertModifier: ViewModifier {
  @Binding var item: AlertItem?
  var confirmAction: (() -> Void)
  var cancelAction: (() -> Void)?
  
  func body(content: Content) -> some View {
    ZStack {
      content
        .frame(maxWidth: .infinity, maxHeight: .infinity)
      
      Color.black.opacity(0.5)
        .ignoresSafeArea()
        .opacity(item == nil ? 0 : 1)
        .animation(.easeIn(duration: 0.5), value: item)
      
      if let item {
        AlertView(
          item: item,
          confirmAction: confirmAction,
          cancelAction: cancelAction
        )
        .zIndex(3)
        .padding(.horizontal, 20)
        .transition(.move(edge: .bottom))
        .animation(.default.delay(0.1))
      }
    }
  }
}

struct AlertView: View {
  let item: AlertItem
  
  var confirmAction: (() -> Void)
  var cancelAction: (() -> Void)?
  
  var body: some View {
    VStack(spacing: .zero) {
      Text(item.title)
        .foregroundColor(.secondary)
      
      Spacer()
      
      VStack(spacing: 30) {
        Text(item.message)
          .multilineTextAlignment(.center)
          .lineLimit(3)
          .foregroundColor(.primary)
          .bold()
        
        if let description = item.description {
          Text(description)
            .foregroundColor(.secondary)
        }
      }
      
      Spacer()
      
      HStack(spacing: 10) {
        if let cancelAction {
          CSButton(action: cancelAction, title: "취소")
            .background(.gray.opacity(0.7))
        }
        CSButton(action: confirmAction, title: "확인")
        
      }
    }
    .frame(height: 294)
    .padding(20)
    .background(
      RoundedRectangle(cornerRadius: 20).fill(.white)
    )
  }
}

struct AlertView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationStack {
      ZStack {
        Color.black.opacity(0.5)
        
        TabView {
          AlertView(item: .one, confirmAction: { }, cancelAction: {} )
          AlertView(item: .two, confirmAction: { }, cancelAction: {})
          AlertView(item: .three, confirmAction: { })
        }
        .tabViewStyle(.page)
        .padding()
      }
      .navigationTitle("Alert")
      .navigationBarTitleDisplayMode(.large)
    }
  }
}
