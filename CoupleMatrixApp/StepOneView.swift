import SwiftUI

struct StepOneView: View {
    @Binding var problemStatement: String
    let onNext: () -> Void
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                Spacer()
                    .frame(height: geometry.size.height * 0.1)
                
                Text("Let's hear what the problem is.")
                    .font(.system(size: 32, weight: .semibold))
                    .multilineTextAlignment(.center)
                    .foregroundColor(.init(uiColor: UIColor(hex: "#2c3e50")))
                
                Spacer()
                    .frame(height: geometry.size.height * 0.15)
                
                TextField("What has he/she done or said?", text: $problemStatement)
                    .textFieldStyle(CustomTextFieldStyle())
                    .padding(.horizontal, 20)
                
                Spacer()
                
                Button(action: {
                    if !problemStatement.isEmpty {
                        onNext()
                    }
                }) {
                    Text("Next")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(.white)
                        .frame(width: 200, height: 50)
                        .background(
                            problemStatement.isEmpty ?
                            Color(.systemGray3) :
                            Color(.systemBlue)
                        )
                        .cornerRadius(10)
                }
                .disabled(problemStatement.isEmpty)
                .padding(.bottom, 50)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(.systemBackground))
        }
    }
}

struct CustomTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .font(.system(size: 18))
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color(.systemBackground))
                    .shadow(color: .black.opacity(0.05), radius: 4)
            )
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color(.systemGray4), lineWidth: 1)
            )
    }
}

extension UIColor {
    convenience init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        
        var rgb: UInt64 = 0
        
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        
        let r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let b = CGFloat(rgb & 0x0000FF) / 255.0
        
        self.init(red: r, green: g, blue: b, alpha: 1.0)
    }
}

struct StepOneView_Previews: PreviewProvider {
    static var previews: some View {
        StepOneView(problemStatement: .constant(""), onNext: {})
    }
} 