import Foundation

struct MealEntry: Identifiable, Codable {
    var id = UUID()
    var date: Date
    var foodName: String
    var calories: Int
    var carbs: Int
    var protein: Int
    var fats: Int
    var isManualEntry: Bool
    var mealType: String?
}
