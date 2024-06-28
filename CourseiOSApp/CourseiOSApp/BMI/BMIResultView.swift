//
//  BMIResultView.swift
//  CourseiOSApp
//
//  Created by Totus tuo on 28/06/24.
//

import SwiftUI

struct BMIResultView: View {
    let userWeight: Double
    let userHeight: Double
    
    var body: some View {
        VStack {
            Text("Your result")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
                .foregroundColor(.white)
            
            let result = calculateBMI(weight: userWeight, height: userHeight)
            InformationView(result: result)
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .background(.backgroundApp)
    }
}

func calculateBMI(weight: Double, height: Double) -> Double {
        
    let result = weight / ((height/100) * (height/100))
    return result
}

struct InformationView: View {
    let result: Double
    var body: some View {
        let information = getBMIResult(result: result)
        
        VStack {
            Spacer()
            Text(information.0)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .foregroundColor(information.2)
            Spacer()
            Text("\(result, specifier: "%.2f")")
                .font(.system(size: 80))
                .bold()
                .foregroundColor(.white)
            Spacer()
            Text(information.1)
                .font(.title2)
                .foregroundColor(.white)
                .padding(.horizontal, 8)
            Spacer()
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .background(.backgroundComponent)
        .cornerRadius(16.0)
    }
}

func getBMIResult(result: Double) -> (String, String, Color) {
    let title: String
    let description: String
    let color: Color
    
//    case 0.00..<20:
    switch result {
    case 0.00...19.99:
        title = "Underweight"
        description = "You are below the recommended weight according to your BMI."
        color = Color.yellow
    case 20.00...24.99:
        title = "Normal weight"
        description = "You are at the recommended weight according to your BMI."
        color = Color.green
    case 25.00...29.99:
        title = "Overweight"
        description = "You are above the recommended weight according to your BMI."
        color = Color.orange
    case 30.00...100.00:
        title = "Obesity"
        description = "You are well above the recommended weight according to your BMI."
        color = Color.red
    default:
        title = "ERROR"
        description = "An error has occurred"
        color = Color.gray
    }
    
    return (title, description, color)
}

#Preview {
    BMIResultView(userWeight: 60, userHeight: 160)
}
