//import SwiftUI
//
//class ParentViewModel: ObservableObject {
//    @Published var nestedObject: NestedObject
//
//    init() {
//        self.nestedObject = NestedObject()
//    }
//}
//
//class NestedObject {
//    var value: Int = 0
//    var anotherValue: String = ""
//}
//
//struct ParentView: View {
//    @StateObject private var parentViewModel = ParentViewModel()
//
//    var body: some View {
//        VStack {
//            Text("Nested Object Value: \(parentViewModel.nestedObject.value)")
//            Text("Nested Object Another Value: \(parentViewModel.nestedObject.anotherValue)")
//
//            ChildView(viewModel: ChildViewModel(value: $parentViewModel.nestedObject.value, anotherValue: $parentViewModel.nestedObject.anotherValue))
//                .padding()
//        }
//    }
//}
//
//class ChildViewModel: ObservableObject {
//    @Binding var value: Int
//    @Binding var anotherValue: String
//
//    init(value: Binding<Int>, anotherValue: Binding<String>) {
//        self._value = value
//        self._anotherValue = anotherValue
//    }
//}
//
//struct ChildView: View {
//    @ObservedObject var viewModel: ChildViewModel
//
//    var body: some View {
//        VStack {
//            Text("Nested Object Value: \(viewModel.value)")
//            Text("Nested Object Another Value: \(viewModel.anotherValue)")
//
//            Button("Increment Value") {
//                viewModel.value += 1
//            }
//
//            Button("Change Another Value") {
//                viewModel.anotherValue = "New Value"
//            }
//        }
//    }
//}
//
//struct ParentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ParentView()
//    }
//}


import SwiftUI

class UserData: ObservableObject {
    @Published var name: String = "John Doe"
}

class ChildViewModel: ObservableObject {
    @EnvironmentObject var userData: UserData
    
    // Use the userData property in your view model
    func doSomething() {
        print(userData.name)
    }
}

struct ParentView: View {
    @StateObject private var userData = UserData()
    
    var body: some View {
        VStack {
            Text(userData.name)
                .padding()
            
            ChildView()
                .environmentObject(userData) // Inject the environment object
            
            Button("Change Name") {
                userData.name = "Jane Smith" // Update the environment object
            }
            .padding()
        }
    }
}

struct ChildView: View {
    @EnvironmentObject var userData: UserData
    @StateObject private var childViewModel = ChildViewModel()
    
    var body: some View {
        VStack {
            Text(childViewModel.userData.name)
                .padding()
            
            Button("Do Something") {
                childViewModel.doSomething() // Access the environment object in the child view's view model
            }
            .padding()
        }
    }
}

struct ParentView_Previews: PreviewProvider {
    static var previews: some View {
        ParentView()
    }
}
