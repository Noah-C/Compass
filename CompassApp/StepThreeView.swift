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
                
                // Legend
                HStack(spacing: 20) {
                    HStack(spacing: 8) {
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 12, height: 12)
                        Text("Partner A")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                    }
                    HStack(spacing: 8) {
                        Circle()
                            .fill(Color.red)
                            .frame(width: 12, height: 12)
                        Text("Partner B")
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                    }
                }
                .padding(.top, 10)
                
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
            
            // Matrix rows with pins
            ForEach(Array(rows.enumerated()), id: \.offset) { rowIndex, row in
                HStack(spacing: 0) {
                    // Row header
                    Text(row)
                        .font(.system(size: 13, weight: .medium))
                        .frame(width: cellSize, height: cellSize)
                        .background(Color(.systemGray6))
                        .overlay(Rectangle().stroke(Color.black, lineWidth: 1))
                    
                    // Grid area with pins
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
                            
                            // Partner A pin (blue)
                            if let pin = partnerAPin {
                                Circle()
                                    .fill(Color.blue)
                                    .frame(width: 16, height: 16)
                                    .position(x: pin.x * geometry.size.width,
                                            y: pin.y * geometry.size.height)
                            }
                            
                            // Partner B pin (red)
                            if let pin = partnerBPin {
                                Circle()
                                    .fill(Color.red)
                                    .frame(width: 16, height: 16)
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
                    }
                    .frame(width: CGFloat(columns.count) * cellSize, height: cellSize)
                    .overlay(Rectangle().stroke(Color.black, lineWidth: 1))
                }
            }
        }
    }
} 