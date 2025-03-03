import SwiftUI

struct MealListView: View {
    @State private var selectedDate: Date = Date()
    @State private var selectedMealType: String? = nil
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "E, MMM d"
        return formatter
    }()

    // ✅ Static function to parse date
    private static func parseDate(_ dateString: String) -> Date {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.date(from: dateString) ?? Date()
    }

    @State private var meals: [MealEntry] = [
        // --- Day 1: 2025-03-01 ---
        MealEntry(date: parseDate("2025-03-01"), foodName: "Avocado Toast", calories: 350, carbs: 40, protein: 10, fats: 15, isManualEntry: true, mealType: "Breakfast"),
        MealEntry(date: parseDate("2025-03-01"), foodName: "Grilled Salmon", calories: 600, carbs: 20, protein: 50, fats: 25, isManualEntry: false, mealType: "Lunch"),
        MealEntry(date: parseDate("2025-03-01"), foodName: "Chicken Wrap", calories: 500, carbs: 45, protein: 30, fats: 15, isManualEntry: false, mealType: "Lunch"),
        MealEntry(date: parseDate("2025-03-01"), foodName: "Spaghetti Bolognese", calories: 700, carbs: 90, protein: 35, fats: 20, isManualEntry: false, mealType: "Dinner"),
        MealEntry(date: parseDate("2025-03-01"), foodName: "Fruit Salad", calories: 200, carbs: 50, protein: 3, fats: 1, isManualEntry: false, mealType: "Snack"),
        MealEntry(date: parseDate("2025-03-01"), foodName: "Protein Shake", calories: 250, carbs: 20, protein: 40, fats: 5, isManualEntry: false, mealType: "Snack"),
        
        // --- Day 2: 2025-03-02 ---
        MealEntry(date: parseDate("2025-03-02"), foodName: "Omelette", calories: 300, carbs: 30, protein: 15, fats: 10, isManualEntry: true, mealType: "Breakfast"),
        MealEntry(date: parseDate("2025-03-02"), foodName: "Chicken Caesar Salad", calories: 450, carbs: 20, protein: 40, fats: 10, isManualEntry: false, mealType: "Lunch"),
        MealEntry(date: parseDate("2025-03-02"), foodName: "Turkey Sandwich", calories: 500, carbs: 45, protein: 35, fats: 15, isManualEntry: false, mealType: "Lunch"),
        MealEntry(date: parseDate("2025-03-02"), foodName: "Steak & Veggies", calories: 650, carbs: 25, protein: 50, fats: 30, isManualEntry: false, mealType: "Dinner"),
        MealEntry(date: parseDate("2025-03-02"), foodName: "Greek Yogurt", calories: 150, carbs: 15, protein: 10, fats: 5, isManualEntry: false, mealType: "Snack"),
    ]

    private var filteredMeals: [MealEntry] {
        meals.filter { meal in
            Calendar.current.isDate(meal.date, inSameDayAs: selectedDate) &&
            (selectedMealType == nil || meal.mealType == selectedMealType!)
        }
    }

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Date Header
                HStack {
                    Button(action: { selectedDate = Calendar.current.date(byAdding: .day, value: -1, to: selectedDate)! }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.blue)
                    }
                    Spacer()
                    Text(selectedDate, formatter: dateFormatter)
                        .font(.title3)
                        .bold()
                    Spacer()
                    Button(action: { selectedDate = Calendar.current.date(byAdding: .day, value: 1, to: selectedDate)! }) {
                        Image(systemName: "chevron.right")
                            .foregroundColor(.blue)
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 10)
                
                // Meal Type Filter (Segmented Control)
                Picker("Meal Type", selection: $selectedMealType) {
                    Text("All").tag(nil as String?)
                    Text("Breakfast").tag("Breakfast" as String?)
                    Text("Lunch").tag("Lunch" as String?)
                    Text("Dinner").tag("Dinner" as String?)
                    Text("Snack").tag("Snack" as String?)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                // Meal List
                ScrollView {
                    VStack(spacing: 12) {
                        ForEach(filteredMeals) { meal in
                            NavigationLink(destination: MealDetailView(meal: meal)) {
                                MealCardView(meal: meal, showDate: true, showType: true)
                            }
                                .background(Color.white)
                                .cornerRadius(12)
                                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                                .padding(.horizontal)
                        }
                    }
                }
                .padding(.top)
            }
            .navigationTitle("")
            .navigationBarHidden(true)
        }
    }
}

// MARK: - Preview
struct MealListView_Previews: PreviewProvider {
    static var previews: some View {
        MealListView()
    }
}
