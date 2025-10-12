import SwiftUI

struct StepTwoView: View {
    @Binding var problemStatement: String
    @Binding var selectedPin: CGPoint?
    let onNext: () -> Void
    let onBack: () -> Void
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                Spacer()
                    .frame(height: geometry.size.height * 0.05)
                
                Text("How does it make you feel?")
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
                
                MatrixView(selectedPin: $selectedPin)
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
                    
                    Button(action: {
                        if selectedPin != nil {
                            onNext()
                        }
                    }) {
                        Text("Next")
                            .font(.system(size: 18, weight: .medium))
                            .foregroundColor(.white)
                            .frame(width: 120, height: 50)
                            .background(
                                selectedPin == nil ?
                                Color(.systemGray3) :
                                Color(.systemBlue)
                            )
                            .cornerRadius(10)
                    }
                    .disabled(selectedPin == nil)
                }
                .padding(.bottom, 50)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.systemBackground))
        }
    }
}

struct MatrixView: View {
    @Binding var selectedPin: CGPoint?
    
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
                
                // Selected pin
                if let pin = selectedPin {
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 20, height: 20)
                        .position(x: pin.x * geometry.size.width,
                                y: pin.y * geometry.size.height)
                }
            }
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { value in
                        let x = max(0, min(1, value.location.x / geometry.size.width))
                        let y = max(0, min(1, value.location.y / geometry.size.height))
                        selectedPin = CGPoint(x: x, y: y)
                    }
            )
            .border(Color(.systemGray4))
        }
    }
} 