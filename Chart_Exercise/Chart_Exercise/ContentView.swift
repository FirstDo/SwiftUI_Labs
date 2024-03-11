import SwiftUI
import Charts

struct ContentView: View {
  @State var sampleAnalytics: [SiteView] = sample_analytics
  @State var currentTab: String = "7 Days"
  @State var currentActiveItem: SiteView?
  @State var plotWidth: CGFloat = 0
  
  @State var isLineGraph = false
  
  var body: some View {
    NavigationStack {
      VStack {
        VStack(alignment: .leading, spacing: 30) {
          HStack {
            Text("Views")
              .fontWeight(.semibold)
            
            Picker("", selection: $currentTab) {
              Text("7 Days")
                .tag("7 Days")
              
              Text("Week")
                .tag("Week")
              
              Text("Month")
                .tag("Month")
            }
            .pickerStyle(.segmented)
            .padding(.leading, 80)
          }
          
          let totalValue = sampleAnalytics.reduce(0.0) {
            $1.views + $0
          }
          
          Text(totalValue.stringFormat)
            .font(.largeTitle.bold())
          
          AnimatedChart()
        }
        .padding()
        .background(
          RoundedRectangle(cornerRadius: 10, style: .continuous)
            .fill(.white.shadow(.drop(radius: 2)))
        )
        
        Toggle("Line Graph", isOn: $isLineGraph)
          .padding(.top)
        
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
      .padding()
      .navigationTitle("Swift Charts")
      .onChange(of: currentTab) { newValue in
        sampleAnalytics = sample_analytics
        
        if newValue != "7 Days" {
          for (index, _) in sampleAnalytics.enumerated() {
            sampleAnalytics[index].views = .random(in: 1500...10000)
          }
        }
        
        animateGroup()
      }
    }
  }
  
  @ViewBuilder
  func AnimatedChart() -> some View {
    let max = sampleAnalytics.max { $1.views > $0.views }!.views
    
    Chart {
      ForEach(sampleAnalytics) { item in
        
        if isLineGraph {
          LineMark(
            x: .value("Hour", item.hour, unit: .hour),
            y: .value("Views", item.animate ? item.views : 0)
          )
          
        } else {
          BarMark(
            x: .value("Hour", item.hour, unit: .hour),
            y: .value("Views", item.animate ? item.views : 0)
          )
        }
        
        if isLineGraph {
          AreaMark(
            x: .value("Hour", item.hour, unit: .hour),
            y: .value("Views", item.animate ? item.views : 0)
          )
          .foregroundStyle(Color.blue.opacity(0.1).gradient)
        }
        
        if let currentActiveItem, currentActiveItem.id == item.id {
          RuleMark(x: .value("Hour", currentActiveItem.hour))
            .lineStyle(.init(lineWidth: 2, miterLimit: 2, dash: [2], dashPhase: 5))
            .offset(x: (plotWidth / CGFloat(sampleAnalytics.count)) / 2)
            .annotation(position: .top) {
              VStack(alignment: .leading, spacing: 6) {
                Text("Views")
                  .font(.caption)
                  .foregroundColor(.gray)
                
                Text(currentActiveItem.views.stringFormat)
                  .font(.title3.bold())
              }
              .padding(.horizontal, 10)
              .padding(.vertical, 4)
              .background {
                RoundedRectangle(cornerRadius: 6, style: .continuous)
                  .fill(.white.shadow(.drop(radius: 2)))
              }
            }
        }
      }
    }
    .chartYScale(domain: 0...(max + 6_000))
    .chartOverlay { proxy in
      Rectangle()
        .fill(.clear).contentShape(Rectangle())
        .gesture(
          DragGesture()
            .onChanged { value in
              let location = value.location
              
              if let date: Date = proxy.value(atX: location.x) {
                let calendar = Calendar.current
                let hour = calendar.component(.hour, from: date)
                
                if let currentItem = sampleAnalytics.first(where: {
                  calendar.component(.hour, from: $0.hour) == hour
                }) {
                  self.currentActiveItem = currentItem
                  self.plotWidth = proxy.plotAreaSize.width
                }
              }
            }
            .onEnded { value in
              self.currentActiveItem = nil
            }
        )
    }
    .frame(height: 250)
    .onAppear {
      animateGroup()
    }
  }
  
  func animateGroup() {
    for (index, _) in sampleAnalytics.enumerated() {
      withAnimation(.easeInOut(duration: 0.5).delay(Double(index) * 0.05)) {
        sampleAnalytics[index].animate = true
      }
    }
  }
}

#Preview {
  ContentView()
}

extension Double {
  var stringFormat: String {
    if self >= 10000 && self < 999999 {
      return String(format: "%.1fK", self / 1_000).replacingOccurrences(of: ".0", with: "")
    }
    
    if self > 999999 {
      return String(format: "%.1fM", self / 1_000_000).replacingOccurrences(of: ".0", with: "")
    }
    
    return String(format: "%.0f", self)
  }
}
