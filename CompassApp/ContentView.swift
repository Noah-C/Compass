import SwiftUI

struct ContentView: View {
    @State private var currentStep = 1
    @State private var problemStatement = ""
    @State private var partnerAPin: CGPoint?
    @State private var partnerBPin: CGPoint?
    
    var body: some View {
        Group {
            switch currentStep {
            case 1:
                StepOneView(
                    problemStatement: $problemStatement,
                    onNext: { currentStep = 2 }
                )
            case 2:
                StepTwoView(
                    problemStatement: $problemStatement,
                    selectedPin: $partnerAPin,
                    partnerLabel: "Partner A",
                    onNext: { currentStep = 3 },
                    onBack: { currentStep = 1 }
                )
            case 3:
                StepTwoView(
                    problemStatement: $problemStatement,
                    selectedPin: $partnerBPin,
                    partnerLabel: "Partner B",
                    onNext: { currentStep = 4 },
                    onBack: { currentStep = 2 }
                )
            case 4:
                StepThreeView(
                    problemStatement: $problemStatement,
                    partnerAPin: $partnerAPin,
                    partnerBPin: $partnerBPin,
                    onBack: { currentStep = 3 },
                    onReset: {
                        currentStep = 1
                        problemStatement = ""
                        partnerAPin = nil
                        partnerBPin = nil
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