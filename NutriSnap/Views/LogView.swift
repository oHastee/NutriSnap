import SwiftUI

struct LogView: View {
    @State private var image: UIImage? = nil
    @State private var showImagePicker = false
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    @State private var navigateToMealEntry = false
    
    var body: some View {
        VStack {
            Spacer()
            
            // Meal Scan Button
            Button(action: {
                // Ensure the back camera is used.
                sourceType = .camera
                showImagePicker = true
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.green.opacity(0.7), Color.green]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 180, height: 180)
                        .shadow(radius: 8)
                    
                    VStack {
                        Image(systemName: "camera.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.white)
                        Text("Meal Scan")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                }
            }
            .padding()
            
            // Manual Entry Button
            Button(action: {
                navigateToMealEntry = true
            }) {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.green, Color.blue]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 180, height: 180)
                        .shadow(radius: 8)
                    
                    VStack {
                        Image(systemName: "pencil")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.white)
                        Text("Manual Entry")
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                }
            }
            .padding()
            
            Spacer()
        }
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(image: $image, sourceType: sourceType)
        }
        .fullScreenCover(isPresented: $navigateToMealEntry) {
            // Replace MealEntryView with your actual view.
            MealEntryView(meal: MealEntry(
                date: Date(),
                foodName: "",
                calories: 0,
                carbs: 0,
                protein: 0,
                fats: 0,
                isManualEntry: true
            ))
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct LogView_Previews: PreviewProvider {
    static var previews: some View {
        LogView()
            .previewDevice("iPhone 14")
    }
}
