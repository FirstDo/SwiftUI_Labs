import SwiftUI

enum TabItem: Hashable, CaseIterable {
    case home
    case apple
    case swift
    
    var title: String {
        switch self {
        case .home: return "홈"
        case .apple: return "애플"
        case .swift: return "스위프트"
        }
    }
    
    var imageName: String {
        switch self {
        case .home: return "house"
        case .apple: return "apple.logo"
        case .swift: return "swift"
        }
    }
}


struct TabBar: View {
    @Binding var selectedItem: TabItem
    
    var body: some View {
        GeometryReader { proxy in
            HStack(spacing: 0) {
                ForEach(TabItem.allCases, id: \.title) { item in
                    Button {
                        selectedItem = item
                    } label: {
                        tabItem(item, isActive: selectedItem == item)
                    }
                }
                .frame(width: proxy.size.width / 3)
            }
            .frame(height: 100)
        }
        .background(
            RoundedRectangle(cornerRadius: 20).fill(.white)
        )
        .frame(height: 100)
    }
    
    private func tabItem(_ item: TabItem, isActive: Bool) -> some View {
        VStack(spacing: 10) {
            Image(systemName: item.imageName)
                .resizable()
                .renderingMode(.template)
                .scaledToFit()
                .frame(width: 50, height: 50)
                .foregroundColor(isActive ? .black : .gray)
            
            Text(item.title)
                .foregroundColor(isActive ? .black : .gray)
        }
    }
}


struct TabBar_PreviewProvider: PreviewProvider {
    static var previews: some View {
        TabBar(selectedItem: .constant(.apple))
            .previewLayout(.sizeThatFits)
    }
}


