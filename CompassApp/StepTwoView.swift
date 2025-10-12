import SwiftUI

struct StepTwoView: View {
    @Binding var problemStatement: String
    @Binding var selectedPin: CGPoint?
    let partnerLabel: String
    let onNext: () -> Void
    let onBack: () -> Void
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                Spacer()
                    .frame(height: geometry.size.height * 0.05)
                
                Text("\(partnerLabel), drop your pin")
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
    
    private let cellSize: CGFloat = 100
    private let headerHeight: CGFloat = 50
    private let columns = ["unint", "int", "ill-int"]
    private let rows = ["bothered", "not mind", "enjoy it"]
    
    var body: some View {
        VStack(spacing: 0) {
            // Header row
            HStack(spacing: 0) {
                // Top-left diagonal cell
                ZStack {
                    Rectangle()
                        .stroke(Color.black, lineWidth: 1)
                        .background(Color(.systemGray6))
                    
                    Path { path in
                        path.move(to: CGPoint(x: 0, y: 0))
                        path.addLine(to: CGPoint(x: cellSize, y: headerHeight))
                    }
                    .stroke(Color.black, lineWidth: 1)
                    
                    VStack(alignment: .trailing) {
                        Text("Intention")
                            .font(.system(size: 10))
                            .padding(.top, 5)
                            .padding(.trailing, 5)
                        Spacer()
                        Text("Feel")
                            .font(.system(size: 10))
                            .padding(.bottom, 5)
                            .padding(.leading, 5)
                    }
                }
                .frame(width: cellSize, height: headerHeight)
                
                ForEach(columns, id: \.self) { column in
                    Text(column)
                        .font(.system(size: 13, weight: .medium))
                        .frame(width: cellSize, height: headerHeight)
                        .background(Color(.systemGray6))
                        .overlay(Rectangle().stroke(Color.black, lineWidth: 1))
                }
            }
            
            // Matrix rows with interactive grid
            ForEach(Array(rows.enumerated()), id: \.offset) { rowIndex, row in
                HStack(spacing: 0) {
                    // Row header
                    Text(row)
                        .font(.system(size: 13, weight: .medium))
                        .frame(width: cellSize, height: cellSize)
                        .background(Color(.systemGray6))
                        .overlay(Rectangle().stroke(Color.black, lineWidth: 1))
                    
                    // Interactive grid area
                    GeometryReader { geometry in
                        ZStack {
                            Color.white
                            
                            // Grid lines
                            Path { path in
                                // Vertical lines
                                for i in 1..<columns.count {
                                    let x = geometry.size.width * CGFloat(i) / CGFloat(columns.count)
                                    path.move(to: CGPoint(x: x, y: 0))
                                    path.addLine(to: CGPoint(x: x, y: geometry.size.height))
                                }
                                // Horizontal lines  
                                for i in 1..<rows.count {
                                    let y = geometry.size.height * CGFloat(i) / CGFloat(rows.count)
                                    path.move(to: CGPoint(x: 0, y: y))
                                    path.addLine(to: CGPoint(x: geometry.size.width, y: y))
                                }
                            }
                            .stroke(Color(.systemGray4), style: StrokeStyle(lineWidth: 1, dash: [5]))
                            
                            // Selected pin
                            if let pin = selectedPin {
                                Circle()
                                    .fill(Color.blue)
                                    .frame(width: 16, height: 16)
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
                    }
                    .frame(width: CGFloat(columns.count) * cellSize, height: cellSize)
                    .overlay(Rectangle().stroke(Color.black, lineWidth: 1))
                }
            }
        }
    }
} 