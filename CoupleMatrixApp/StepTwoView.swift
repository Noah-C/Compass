import SwiftUI

struct StepTwoView: View {
    let problemStatement: String
    @Binding var position: CGPoint?
    let onBack: () -> Void
    let onNext: () -> Void
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Partner A, please drop your pin.")
                .font(.system(size: 24, weight: .semibold))
                .multilineTextAlignment(.center)
            
            Text("Problem: \"\(problemStatement)\"")
                .font(.system(size: 16))
                .italic()
                .foregroundColor(.gray)
            
            MatrixView(
                onTap: { point in
                    position = point
                },
                partnerAPosition: position
            )
            .frame(height: 400)
            .padding()
            
            HStack(spacing: 20) {
                Button(action: onBack) {
                    Text("← Back")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.gray)
                        .frame(width: 150, height: 50)
                        .background(Color(UIColor.systemGray5))
                        .cornerRadius(10)
                }
                
                Button(action: onNext) {
                    Text("Next")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.white)
                        .frame(width: 150, height: 50)
                        .background(position == nil ? Color.gray : Color.blue)
                        .cornerRadius(10)
                }
                .disabled(position == nil)
            }
        }
        .padding()
        .background(Color(UIColor.systemBackground))
    }
} 