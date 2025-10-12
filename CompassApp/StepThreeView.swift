import SwiftUI

struct StepThreeView: View {
    @Binding var problemStatement: String
    @Binding var partnerAPin: CGPoint?
    @Binding var partnerBPin: CGPoint?
    let onBack: () -> Void
    let onReset: () -> Void
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                Spacer()
                    .frame(height: geometry.size.height * 0.05)
                
                Text("Here's what we found")
                    .font(.system(size: 32, weight: .semibold))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.init(uiColor: UIColor(hex: "#2c3e50")))
                
                Text(problemStatement)
                    .font(.system(size: 18))
                    .foregroundColor(.gray)
                    .padding(.top, 8)
                    .multilineTextAlignment(.center)
                
                Spacer()
                    .frame(height: geometry.size.height * 0.1)
                
                CombinedMatrixView(
                    partnerAPin: partnerAPin,
                    partnerBPin: partnerBPin
                )
                .frame(maxWidth: .infinity)
                .aspectRatio(1, contentMode: .fit)
                .padding(.horizontal, 20)
                
                Spacer()
                
                HStack(spacing: 20) {
                    Button(action: onBack) {
                        Text("Back")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(.white)
                            .frame(width: 120, height: 50)
                            .background(Color(.systemGray3))
                            .cornerRadius(10)
                    }
                    
                    Button(action: onReset) {
                        Text("Do it again")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(.white)
                            .frame(width: 120, height: 50)
                            .background(Color(.systemBlue))
                            .cornerRadius(10)
                    }
                }
                .padding(.bottom, 50)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.systemBackground))
        }
    }
}

struct CombinedMatrixView: View {
    let partnerAPin: CGPoint?
    let partnerBPin: CGPoint?
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // Background
                Color(.systemBackground)
                
                // Grid lines
                Path { path in
                    // Vertical lines
                    path.move(to: CGPoint(x: geometry.size.width/2, y: 0))
                    path.addLine(to: CGPoint(x: geometry.size.width/2, y: geometry.size.height))
                    
                    // Horizontal lines
                    path.move(to: CGPoint(x: 0, y: geometry.size.height/2))
                    path.addLine(to: CGPoint(x: geometry.size.width, y: geometry.size.height/2))
                }
                .stroke(Color(.systemGray4), style: StrokeStyle(lineWidth: 1, dash: [5]))
                
                // Labels
                VStack {
                    Text("Angry")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.gray)
                        .padding(.top, 10)
                    Spacer()
                    Text("Sad")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.gray)
                        .padding(.bottom, 10)
                }
                
                HStack {
                    Text("Distant")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.gray)
                        .padding(.leading, 10)
                        .rotationEffect(.degrees(-90))
                    Spacer()
                    Text("Close")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(.gray)
                        .padding(.trailing, 10)
                        .rotationEffect(.degrees(-90))
                }
                
                // Partner A pin
                if let pin = partnerAPin {
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 20, height: 20)
                        .position(x: pin.x * geometry.size.width,
                                y: pin.y * geometry.size.height)
                }
                
                // Partner B pin
                if let pin = partnerBPin {
                    Circle()
                        .fill(Color.red)
                        .frame(width: 20, height: 20)
                        .position(x: pin.x * geometry.size.width,
                                y: pin.y * geometry.size.height)
                }
                
                // Line connecting pins
                if let pinA = partnerAPin, let pinB = partnerBPin {
                    Path { path in
                        path.move(to: CGPoint(x: pinA.x * geometry.size.width,
                                            y: pinA.y * geometry.size.height))
                        path.addLine(to: CGPoint(x: pinB.x * geometry.size.width,
                                               y: pinB.y * geometry.size.height))
                    }
                    .stroke(Color.gray, style: StrokeStyle(lineWidth: 2, dash: [5]))
                }
            }
            .border(Color(.systemGray4))
        }
    }
} 