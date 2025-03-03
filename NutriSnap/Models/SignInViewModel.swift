class SignInViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""

    func signIn(completion: @escaping (Bool) -> Void) {
        // Simulate authentication logic (Replace with actual authentication)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if self.email == "test@example.com" && self.password == "password123" {
                completion(true)  // Success
            } else {
                completion(false) // Failure
            }
        }
    }

    func forgotPassword() {
        // Handle forgot password logic
    }
}
