import SwiftUI

// MARK: - MealType Enum
enum MealType: String, CaseIterable, Identifiable {
    case breakfast = "Breakfast"
    case lunch = "Lunch"
    case dinner = "Dinner"
    case snack = "Snack"
    
    var id: String { rawValue }
}

// MARK: - Meal Model
struct Meal: Identifiable {
    let id = UUID()
    let name: String
    let type: MealType
    let date: Date
    let imageName: String?
}

// MARK: - MealLogView
struct MealLogView: View {
    
    // MARK: - State
    @State private var selectedDate: Date = Date()
    @State private var showDatePicker: Bool = false
    
    // If `mealTypeFilter` is nil, show all meal types
    @State private var mealTypeFilter: MealType? = nil
    
    // MARK: - Dummy Data (3 days + 1 from a week later)
    private let allMeals: [Meal] = [
        // --- Day 1: 2025-03-01 ---
        Meal(name: "Avocado Toast",         type: .breakfast, date: sampleDate("2025-03-01"), imageName: "photo"),
        Meal(name: "Grilled Salmon",        type: .lunch,     date: sampleDate("2025-03-01"), imageName: "photo"),
        Meal(name: "Chicken Wrap",          type: .lunch,     date: sampleDate("2025-03-01"), imageName: "photo"),
        Meal(name: "Spaghetti Bolognese",   type: .dinner,    date: sampleDate("2025-03-01"), imageName: "photo"),
        Meal(name: "Fruit Salad",           type: .snack,     date: sampleDate("2025-03-01"), imageName: "photo"),
        Meal(name: "Protein Shake",         type: .snack,     date: sampleDate("2025-03-01"), imageName: "photo"),
        
        // --- Day 2: 2025-03-02 ---
        Meal(name: "Omelette",              type: .breakfast, date: sampleDate("2025-03-02"), imageName: "photo"),
        Meal(name: "Chicken Caesar Salad",  type: .lunch,     date: sampleDate("2025-03-02"), imageName: "photo"),
        Meal(name: "Turkey Sandwich",       type: .lunch,     date: sampleDate("2025-03-02"), imageName: "photo"),
        Meal(name: "Steak & Veggies",       type: .dinner,    date: sampleDate("2025-03-02"), imageName: "photo"),
        Meal(name: "Greek Yogurt",          type: .snack,     date: sampleDate("2025-03-02"), imageName: "photo"),
        
        // --- Day 3: 2025-02-28 ---
        Meal(name: "Pancakes",              type: .breakfast, date: sampleDate("2025-02-28"), imageName: "photo"),
        Meal(name: "Tuna Sandwich",         type: .lunch,     date: sampleDate("2025-02-28"), imageName: "photo"),
        Meal(name: "Burrito Bowl",          type: .dinner,    date: sampleDate("2025-02-28"), imageName: "photo"),
        Meal(name: "Fruit Smoothie",        type: .snack,     date: sampleDate("2025-02-28"), imageName: "photo"),
        Meal(name: "Popcorn",               type: .snack,     date: sampleDate("2025-02-28"), imageName: "photo"),
        
        // --- One week earlier: 2025-02-23 ---
        Meal(name: "French Toast",          type: .breakfast, date: sampleDate("2025-02-23"), imageName: "photo"),
        Meal(name: "Sushi Roll",            type: .lunch,     date: sampleDate("2025-02-23"), imageName: "photo"),
        Meal(name: "Tacos",                 type: .dinner,    date: sampleDate("2025-02-23"), imageName: "photo"),
        Meal(name: "Apple Slices",          type: .snack,     date: sampleDate("2025-02-23"), imageName: "photo"),
        Meal(name: "Cookies",               type: .snack,     date: sampleDate("2025-02-23"), imageName: "photo")
    ]
    
    // MARK: - Filtered Meals
    private var filteredMeals: [Meal] {
        allMeals.filter { meal in
            // 1) Same day as selectedDate
            Calendar.current.isDate(meal.date, inSameDayAs: selectedDate)
            // 2) Matches mealTypeFilter if set
            && (mealTypeFilter == nil || meal.type == mealTypeFilter!)
        }
    }
    
    // MARK: - Date Formatter
    private var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE, MMM d"
        return formatter.string(from: selectedDate)
    }
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                
                // MARK: - Top Bar (Left/Right Arrows + Centered Date)
                HStack {
                    // Left arrow (previous day)
                    Button(action: {
                        selectedDate = Calendar.current.date(byAdding: .day, value: -1, to: selectedDate) ?? selectedDate
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title2)
                            .foregroundColor(.blue)
                    }
                    
                    Spacer()
                    
                    // Centered date (tap to open date picker)
                    Text(formattedDate)
                        .font(.headline)
                        .onTapGesture {
                            showDatePicker = true
                        }
                    
                    Spacer()
                    
                    // Right arrow (next day)
                    Button(action: {
                        selectedDate = Calendar.current.date(byAdding: .day, value: 1, to: selectedDate) ?? selectedDate
                    }) {
                        Image(systemName: "chevron.right")
                            .font(.title2)
                            .foregroundColor(.blue)
                    }
                }
                .padding()
                
                Divider()
                
                // MARK: - Meal Type Filter (Segmented Control)
                Picker("Meal Type", selection: $mealTypeFilter) {
                    Text("All").tag(nil as MealType?)
                    ForEach(MealType.allCases) { mealType in
                        Text(mealType.rawValue).tag(mealType as MealType?)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                // MARK: - List of Meals for Selected Date
                ScrollView {
                    if filteredMeals.isEmpty {
                        Text("No meals for this date.")
                            .foregroundColor(.gray)
                            .padding()
                    } else {
                        VStack(spacing: 12) {
                            ForEach(filteredMeals) { meal in
                                MealCardView(meal: meal)
                            }
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 16)
                    }
                }
                
                Spacer()
            }
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        
        // MARK: - DatePicker Sheet
        .sheet(isPresented: $showDatePicker) {
            VStack {
                Text("Select a Date")
                    .font(.headline)
                    .padding()
                
                DatePicker(
                    "",
                    selection: $selectedDate,
                    displayedComponents: .date
                )
                .datePickerStyle(GraphicalDatePickerStyle())
                .labelsHidden()
                
                Button("Done") {
                    showDatePicker = false
                }
                .padding()
            }
            .presentationDetents([.medium, .large])
        }
    }
}

// MARK: - MealCardView
struct MealCardView: View {
    let meal: Meal
    
    var body: some View {
        HStack(spacing: 12) {
            // Placeholder image
            if let imageName = meal.imageName {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(8)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(meal.name)
                    .font(.headline)
                Text(meal.type.rawValue)
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

// MARK: - Helper for Sample Data
private func sampleDate(_ dateString: String) -> Date {
    // Format: "YYYY-MM-dd" e.g., "2025-01-25"
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter.date(from: dateString) ?? Date()
}

// MARK: - Preview
struct MealLogView_Previews: PreviewProvider {
    static var previews: some View {
        MealLogView()
            .previewDevice("iPhone 14 Plus")
    }
}
