import SwiftUI

struct MatrixView: View {
    let onTap: ((CGPoint) -> Void)?
    var partnerAPosition: CGPoint?
    var partnerBPosition: CGPoint?
    
    private let columns = ["un-intentional", "intentional", "ill-intentional"]
    private let rows = ["bothered", "not mind", "Enjoy it!"]
    
    var body: some View {
        VStack(spacing: 0) {
            // Header row
            HStack(spacing: 0) {
                DiagonalCell()
                    .frame(width: 100, height: 60)
                ForEach(columns, id: \.self) { column in
                    HeaderCell(text: column)
                }
            }
            
            // Matrix rows
            ForEach(rows, id: \.self) { row in
                HStack(spacing: 0) {
                    HeaderCell(text: row)
                        .frame(width: 100)
                    ZStack {
                        Rectangle()
                            .stroke(Color.black, lineWidth: 1)
                        if let onTap = onTap {
                            Color.clear
                                .contentShape(Rectangle())
                                .gesture(
                                    DragGesture(minimumDistance: 0)
                                        .onEnded { value in
                                            let point = value.location
                                            onTap(point)
                                        }
                                )
                        }
                        // Draw grid lines
                        GridLines()
                        
                        // Draw pins
                        if let pos = partnerAPosition {
                            Circle()
                                .fill(Color.red)
                                .frame(width: 20, height: 20)
                                .position(pos)
                        }
                        if let pos = partnerBPosition {
                            Circle()
                                .fill(Color.blue)
                                .frame(width: 20, height: 20)
                                .position(pos)
                        }
                    }
                }
            }
        }
        .border(Color.black, width: 2)
    }
}

struct DiagonalCell: View {
    var body: some View {
        ZStack {
            Rectangle()
                .stroke(Color.black, lineWidth: 1)
            Path { path in
                path.move(to: CGPoint(x: 0, y: 0))
                path.addLine(to: CGPoint(x: 100, y: 60))
            }
            .stroke(Color.black, lineWidth: 1)
            
            VStack {
                Text("What is the intention?")
                    .font(.system(size: 12))
                    .rotationEffect(.degrees(-30))
                    .offset(x: 10, y: -5)
                
                Text("What do you think he/she feels?")
                    .font(.system(size: 12))
                    .rotationEffect(.degrees(-30))
                    .offset(x: -10, y: 5)
            }
        }
    }
}

struct HeaderCell: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.system(size: 14, weight: .medium))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .multilineTextAlignment(.center)
            .padding(4)
            .border(Color.black, width: 1)
            .background(Color(UIColor.systemBackground))
    }
}

struct GridLines: View {
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                // Vertical line
                path.move(to: CGPoint(x: geometry.size.width/2, y: 0))
                path.addLine(to: CGPoint(x: geometry.size.width/2, y: geometry.size.height))
                
                // Horizontal line
                path.move(to: CGPoint(x: 0, y: geometry.size.height/2))
                path.addLine(to: CGPoint(x: geometry.size.width, y: geometry.size.height/2))
            }
            .stroke(Color.black, style: StrokeStyle(lineWidth: 1, dash: [5]))
        }
    }
}

struct MatrixView_Previews: PreviewProvider {
    static var previews: some View {
        MatrixView(onTap: nil)
            .padding()
    }
} 