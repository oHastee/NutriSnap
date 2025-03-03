import SwiftUI
import Combine

class SignUpViewModel: ObservableObject {
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var dailyCalorieGoal: String = ""
    
    func signUp() {
        // Placeholder: perform sign up logic here.
        print("Signing up with email: \(email)")
    }
}
