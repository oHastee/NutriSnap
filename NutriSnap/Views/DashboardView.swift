//
//  DashboardView.swift
//  NutriSnap
//
//  Created by Oscar Piedrasanta Diaz on 2025-03-01.
//


import SwiftUI

struct DashboardView: View {
    // Mock data for demonstration
    @State private var currentDate: String = "Fri, Feb 7"
    
    var body: some View {
        NavigationView {
            VStack(spacing: 16) {
                
                // MARK: - Top Bar (Date + Arrows)
                HStack {
                    Button(action: {
                        // Decrement date (placeholder)
                        print("Previous date tapped")
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title)
                            .foregroundColor(.blue)
                    }
                    
                    Spacer()
                    
                    Text(currentDate)
                        .font(.headline)
                    
                    Spacer()
                    
                    Button(action: {
                        // Increment date (placeholder)
                        print("Next date tapped")
                    }) {
                        Image(systemName: "chevron.right")
                            .font(.title)
                            .foregroundColor(.blue)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 16)
                
                // MARK: - Circle with "XXX Remaining"
                ZStack {
                    Circle()
                        .stroke(Color.green, lineWidth: 10)
                        .frame(width: 120, height: 120)
                    
                    VStack {
                        Text("1200")
                            .font(.title)
                            .fontWeight(.bold)
                        Text("Remaining")
                            .font(.subheadline)
                    }
                }
                .padding(.top, 8)
                
                // MARK: - Macros (Carbs, Protein, Fats)
                HStack(spacing: 40) {
                    VStack {
                        Text("Carbs")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Text("50/200 g")
                            .font(.headline)
                    }
                    
                    VStack {
                        Text("Protein")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Text("60/150 g")
                            .font(.headline)
                    }
                    
                    VStack {
                        Text("Fats")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        Text("30/70 g")
                            .font(.headline)
                    }
                }
                .padding(.vertical)
                
                // MARK: - Meals List
                VStack(spacing: 16) {
                    MealRowView(
                        iconName: "sunrise.fill",
                        mealName: "Breakfast",
                        currentCalories: 300,
                        totalCalories: 500
                    )
                    MealRowView(
                        iconName: "sun.max.fill",
                        mealName: "Lunch",
                        currentCalories: 400,
                        totalCalories: 600
                    )
                    MealRowView(
                        iconName: "moon.stars.fill",
                        mealName: "Dinner",
                        currentCalories: 500,
                        totalCalories: 700
                    )
                    MealRowView(
                        iconName: "takeoutbag.and.cup.and.straw.fill",
                        mealName: "Snacks",
                        currentCalories: 100,
                        totalCalories: 300
                    )
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

// MARK: - MealRowView (Reusable Row)
struct MealRowView: View {
    let iconName: String
    let mealName: String
    let currentCalories: Int
    let totalCalories: Int
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .font(.title2)
                .foregroundColor(.green)
            
            Text(mealName)
                .font(.headline)
            
            Spacer()
            
            Text("\(currentCalories)/\(totalCalories) Cal")
                .font(.subheadline)
            
            // Placeholder circle (could be a mini progress ring)
            Circle()
                .stroke(Color.green, lineWidth: 2)
                .frame(width: 24, height: 24)
        }
        .padding(.vertical, 4)
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
            .previewDevice("iPhone 14 Plus")
    }
}
