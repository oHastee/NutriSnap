import SwiftUI

struct MealCardView: View {
    let meal: MealEntry  // ✅ Accepts MealEntry

    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "photo")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .foregroundColor(.white)
                .padding()
                .background(Color.green)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(meal.foodName)
                    .font(.headline)
                Text("Calories: \(meal.calories)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}

// MARK: - Preview
struct MealCardView_Previews: PreviewProvider {
    static var previews: some View {
        MealCardView(meal: MealEntry(
            date: Date(),
            foodName: "Example Meal",
            calories: 400,
            carbs: 50,
            protein: 30,
            fats: 10,
            isManualEntry: true
        ))
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
