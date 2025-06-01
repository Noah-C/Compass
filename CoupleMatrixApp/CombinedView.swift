import SwiftUI

struct CombinedView: View {
    let problemStatement: String
    let partnerAPosition: CGPoint?
    let partnerBPosition: CGPoint?
    let onBack: () -> Void
    let onRestart: () -> Void
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Combined View")
                .font(.system(size: 24, weight: .semibold))
                .multilineTextAlignment(.center)
            
            Text("Problem: \"\(problemStatement)\"")
                .font(.system(size: 16))
                .italic()
                .foregroundColor(.gray)
            
            MatrixView(
                onTap: nil,
                partnerAPosition: partnerAPosition,
                partnerBPosition: partnerBPosition
            )
            .frame(height: 400)
            .padding()
            
            Text("Red = Partner A, Blue = Partner B")
                .font(.system(size: 14))
                .foregroundColor(.gray)
            
            Text("Now you can discuss.")
                .font(.system(size: 24, weight: .bold))
                .padding(.vertical)
            
            HStack(spacing: 20) {
                Button(action: onBack) {
                    Text("← Back")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.gray)
                        .frame(width: 150, height: 50)
                        .background(Color(UIColor.systemGray5))
                        .cornerRadius(10)
                }
                
                Button(action: onRestart) {
                    Text("Do it again")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.white)
                        .frame(width: 150, height: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            }
        }
        .padding()
        .background(Color(UIColor.systemBackground))
    }
} 