import SwiftUI

struct MealEntryView: View {
    @State private var mealType: String = "Meal Type"
    @State private var foodName: String = ""
    @State private var calories: String = ""
    @State private var carbohydrates: String = ""
    @State private var protein: String = ""
    @State private var fats: String = ""
    
    let mealTypes = ["Breakfast", "Lunch", "Dinner", "Snack"]

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            
            Text("Entry")
                .font(.title)
                .fontWeight(.bold)
            
            // Meal Type Picker
            Text("Meal Type")
                .font(.headline)
            
            Picker("Meal Type", selection: $mealType) {
                Text("Meal Type").tag("Meal Type") 
                ForEach(mealTypes, id: \.self) { type in
                    Text(type).tag(type)
                }
            }
            .pickerStyle(MenuPickerStyle())
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(8)
            
            // Food Name
            Text("Food Name")
                .font(.headline)
            
            TextField("e.g., Chicken Salad", text: $foodName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            // Calories Input
            Text("Calories (kcal)")
                .font(.headline)
            
            TextField("Enter calories", text: $calories)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            // Macronutrients
            Text("Macronutrients")
                .font(.headline)
            
            VStack(spacing: 10) {
                HStack {
                    Text("Carbohydrates (g)")
                    Spacer()
                    TextField("0", text: $carbohydrates)
                        .keyboardType(.numberPad)
                        .frame(width: 80)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                HStack {
                    Text("Protein (g)")
                    Spacer()
                    TextField("0", text: $protein)
                        .keyboardType(.numberPad)
                        .frame(width: 80)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                HStack {
                    Text("Fats (g)")
                    Spacer()
                    TextField("0", text: $fats)
                        .keyboardType(.numberPad)
                        .frame(width: 80)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
            }
            .padding(.horizontal)
            
            Spacer()
            
            // Save Button
            Button(action: {
                // Action to save entry
            }) {
                Text("Save")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal)

        }
        .padding()
        .navigationBarTitleDisplayMode(.inline) 
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Manual Entry")
                    .font(.headline)
            }
        }
    }
}

struct MealEntryView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MealEntryView()
        }
    }
}
