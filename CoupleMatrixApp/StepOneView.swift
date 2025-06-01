import SwiftUI

struct StepOneView: View {
    @Binding var problemStatement: String
    let onNext: () -> Void
    
    var body: some View {
        VStack(spacing: 40) {
            Text("Let's hear what the problem is.")
                .font(.system(size: 28, weight: .semibold))
                .multilineTextAlignment(.center)
            
            TextField("What has he/she done or said?", text: $problemStatement)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .font(.system(size: 18))
                .padding(.horizontal, 20)
                .frame(maxWidth: .infinity)
            
            Button(action: {
                if !problemStatement.isEmpty {
                    onNext()
                }
            }) {
                Text("Next")
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(.white)
                    .frame(width: 200, height: 50)
                    .background(problemStatement.isEmpty ? Color.gray : Color.blue)
                    .cornerRadius(10)
            }
            .disabled(problemStatement.isEmpty)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(UIColor.systemBackground))
    }
}

struct StepOneView_Previews: PreviewProvider {
    static var previews: some View {
        StepOneView(problemStatement: .constant(""), onNext: {})
    }
} 