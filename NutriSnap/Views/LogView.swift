import SwiftUI

struct LogView: View {
    @State private var image: UIImage? = nil
    @State private var showImagePicker = false
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var navigateToManualEntry = false

    var body: some View {
        VStack {
            Text("Log - Val")
                .font(.title)
                .padding()
            
            // Meal Scan Button
            Button(action: {
                showImagePicker = true
            }) {
                VStack {
                    Image(systemName: "camera.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.black)
                    Text("Meal Scan")
                        .font(.headline)
                        .foregroundColor(.black)
                }
                .padding()
            }
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
            .padding()
            
            Divider()
            
            // Manual Entry Button
            Button(action: {
                navigateToManualEntry = true
            }) {
                VStack {
                    Image(systemName: "pencil")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.black)
                    Text("Manual Entry")
                        .font(.headline)
                        .foregroundColor(.black)
                }
                .padding()
            }
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
            .padding()
            
            Spacer()
        }
        .padding()
        .background(Color(UIColor.systemGray6))
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(image: $image, sourceType: sourceType)
        }
        .fullScreenCover(isPresented: $navigateToManualEntry) {
            ManualEntryView()
        }
    }
}

struct ManualEntryView: View {
    var body: some View {
        VStack {
            Text("Manual Entry")
                .font(.title)
                .padding()
            
            Spacer()
        }
    }
}

struct LogView_Previews: PreviewProvider {
    static var previews: some View {
        LogView()
    }
}
