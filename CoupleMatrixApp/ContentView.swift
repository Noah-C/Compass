import SwiftUI

struct ContentView: View {
    @State private var currentStep = 1
    @State private var problemStatement = ""
    @State private var partnerAPosition: CGPoint?
    @State private var partnerBPosition: CGPoint?
    
    var body: some View {
        VStack {
            switch currentStep {
            case 1:
                StepOneView(
                    problemStatement: $problemStatement,
                    onNext: { currentStep = 2 }
                )
            case 2:
                StepTwoView(
                    problemStatement: problemStatement,
                    position: $partnerAPosition,
                    onBack: { currentStep = 1 },
                    onNext: { currentStep = 3 }
                )
            case 3:
                StepThreeView(
                    problemStatement: problemStatement,
                    position: $partnerBPosition,
                    onBack: { currentStep = 2 },
                    onNext: { currentStep = 4 }
                )
            case 4:
                CombinedView(
                    problemStatement: problemStatement,
                    partnerAPosition: partnerAPosition,
                    partnerBPosition: partnerBPosition,
                    onBack: { currentStep = 3 },
                    onRestart: {
                        currentStep = 1
                        problemStatement = ""
                        partnerAPosition = nil
                        partnerBPosition = nil
                    }
                )
            default:
                EmptyView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
} 