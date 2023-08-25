import SwiftUI

struct MeetingHeaderView: View {
  let secondsElapsed: Int
  let secondsRemaining: Int
  let theme: Theme
  
  private var totalSeconds: Int {
    secondsElapsed + secondsRemaining
  }
  
  private var progess: Double {
    guard totalSeconds > 0 else { return 1 }
    return Double(secondsElapsed) / Double(totalSeconds)
  }
  
  private var minutesRemaining: Int {
    secondsRemaining / 60
  }
  
  var body: some View {
    VStack {
      ProgressView(value: 5, total: 15)
        .progressViewStyle(ScrumProgressViewStyle(theme: theme))
      HStack {
        VStack {
          Text("Seconds Elapsed")
            .font(.caption)
          Label("\(secondsElapsed)", systemImage: "hourglass.tophalf.fill")
        }
        Spacer()
        
        VStack {
          Text("Seconds Remaining")
            .font(.caption)
          Label("\(secondsRemaining)", systemImage: "hourglass.bottomhalf.fill")
            .labelStyle(.trailingIcon)
        }
      }
    }
    .accessibilityElement(children: .ignore)
    .accessibilityLabel("Time remaining")
    .accessibilityValue("\(minutesRemaining) minutes")
    .padding([.top, .horizontal])
  }
}

struct MeetingHeaderView_Previews: PreviewProvider {
  static var previews: some View {
    MeetingHeaderView(secondsElapsed: 60, secondsRemaining: 100, theme: .bubblegum)
      .previewLayout(.sizeThatFits)
  }
}
