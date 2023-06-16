import SwiftUI

class ParentViewModel: ObservableObject {
    @Published var nestedObject: NestedObject
    
    init() {
        self.nestedObject = NestedObject()
    }
}

class NestedObject: ObservableObject {
    @Published var value: Int = 0
    @Published var anotherValue: String = ""
}

struct ParentView: View {
    @StateObject private var parentViewModel = ParentViewModel()

    var body: some View {
        VStack {
            Text("Nested Object Value: \(parentViewModel.nestedObject.value)")
            Text("Nested Object Another Value: \(parentViewModel.nestedObject.anotherValue)")
            
            ChildView(value: $parentViewModel.nestedObject.value,
                      anotherValue: $parentViewModel.nestedObject.anotherValue)
                .padding()
        }
    }
}

struct ChildView: View {
    @Binding var value: Int
    @Binding var anotherValue: String
    
    var body: some View {
        VStack {
            Text("Nested Object Value: \(value)")
            Text("Nested Object Another Value: \(anotherValue)")
            
            Button("Increment Value") {
                value += 1
            }
            
            Button("Change Another Value") {
                anotherValue = "New Value"
            }
        }
    }
}

struct ParentView_Previews: PreviewProvider {
    static var previews: some View {
        ParentView()
    }
}
