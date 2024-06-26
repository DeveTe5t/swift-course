//
//  BMIView.swift
//  CourseiOSApp
//
//  Created by Totus tuo on 26/06/24.
//

import SwiftUI

struct BMIView: View {
    
    // Way 1: Change color text navigation bar
//    init() {
//        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
//    }
    @State var gender: Int = 0
    @State var age: Int = 18
    @State var weight: Int = 80
    @State var height: Double = 140
    
    var body: some View {
        VStack {
            HStack {
                ToggleButton(text: "Male", imageName: "heart.fill", gender: 0, selectedGender: $gender)
                ToggleButton(text: "Female", imageName: "star.fill", gender: 1, selectedGender: $gender)
            }
            HeightCalculator(selectedHeight: $height)
            HStack {
                CardCounterButton(text: "Age", number: $age)
                CardCounterButton(text: "Weight", number: $weight)
            }
            BMICalculateButton()
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .background(.backgroundApp)
//        .navigationTitle("BMI Calculator")
//        Way 2: Change color text navigation bar
        .toolbar{
            ToolbarItem(placement: .principal) {
                Text("BMI Calculator").foregroundColor(.white)
            }
        }
//        .navigationBarBackButtonHidden()
//        Way 3: Change color text navigation bar
// //        .navigationBarTitleTextColor(.white)
//        Way 4: Change color text navigation bar
//        .toolbarColorScheme(.dark, for: .navigationBar)
// //        .toolbarBackground(Color.blue, for: .navigationBar)
//        .toolbarBackground(.visible, for: .navigationBar)
    }
}

//Way 3: Change color text navigation bar
//extension View {
//    @available(iOS 14, *)
//    func navigationBarTitleTextColor(_ color: Color) -> some View {
//        let uiColor = UIColor(color)
//        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: uiColor ]
//        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: uiColor ]
//        return self
//    }
//}

struct ToggleButton: View {
    let text: String
    let imageName: String
    let gender: Int
    @Binding var selectedGender: Int
    
    var body: some View {
        let color = if (gender == selectedGender) {
            Color.backgroundComponentSelected
        } else {
            Color.backgroundComponent
        }
        
        Button(action: {
            selectedGender = gender
        }) {
            VStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    .foregroundColor(.white)
                InformationText(text: text)
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
            .background(color)
        }
    }
}

struct InformationText: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .bold()
            .foregroundColor(.white)
    }
}

struct TitleText: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.title2)
            .foregroundColor(.gray)
    }
}

struct HeightCalculator: View {
    @Binding var selectedHeight: Double
    
    var body: some View {
        VStack {
            TitleText(text: "Height")
            InformationText(text: "\(Int(selectedHeight)) cm")
            Slider(value: $selectedHeight, in: 100...220, step: 1)
                .accentColor(.purple)
                .padding(.horizontal, 16)
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .background(.backgroundComponent)
    }
}

//struct CounterButton: View {
//    let text: String
//    @State var value: Int
//    
//    var body: some View {
//        VStack {
//            TitleText(text: text)
//            InformationText(text: String(value))
//            HStack {
//                ButtonAgeWeight(imageIcon: "minus", value: $value)
//                ButtonAgeWeight(imageIcon: "plus", value: $value)
//            }
//        }
//        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
//        .background(.backgroundComponent)
//    }
//}

struct CardCounterButton: View {
    let text: String
    @Binding var number: Int
    
    var body: some View {
        VStack {
            TitleText(text: text)
            InformationText(text: String(number))
            HStack {
//                ButtonAgeWeight(imageIcon: "minus", value: $number)
//                ButtonAgeWeight(imageIcon: "plus", value: $number)
//                ZStack {
//                    Button(action:{}) {
//                        Circle()
//                            .frame(width: 70, height: 70)
//                            .foregroundColor(.purple)
//                    }
//                    Image(systemName: "minus")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 30)
//                        .foregroundColor(.white)
                    ButtonCounter(iconName: "minus", number: $number)
                    ButtonCounter(iconName: "plus", number: $number)
//                }
            }
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .background(.backgroundComponent)
    }
}

struct ButtonCounter: View {
    let iconName: String
    @Binding var number: Int
    
    var body: some View {
        ZStack {
            Button(action:{
                if (number < 1 || number > 99) {
                    return
                }
                
                if (iconName == "minus") {
                    number -= 1
                } else if (iconName == "plus") {
                    number += 1
                }
            }) {
                Circle()
                    .frame(width: 70, height: 70)
                    .foregroundColor(.purple)
            }
            Image(systemName: iconName)
                .resizable()
                .scaledToFit()
                .frame(width: 30)
                .foregroundColor(.white)
        }
    }
}

//struct ButtonAgeWeight: View {
//    let imageIcon: String
//    @Binding var value: Int
//    
//    var body: some View {
//        
//        Button(action: {
//            if (value == 0) { return }
//                
//            if (imageIcon == "minus") {
////                if (value > 0) {
//                    value -= 1
////                }
//            } else {
//                value += 1
//            }
//        }) {
//            Image(systemName: imageIcon)
//                .resizable()
//                .scaledToFit()
//                .frame(width: 35)
//                .foregroundColor(.white)
//        }
//        .scaledToFit()
//        .frame(width: 90, height: 90)
//        .background(.purple)
//        .cornerRadius(45.0)
//    }
//}

struct BMICalculateButton: View {
    var body: some View {
        NavigationStack {
            NavigationLink(destination:{}) {
                Text("Calculate")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .bold()
                    .foregroundColor(.purple)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 100)
                    .background(.backgroundComponent)
            }
        }
    }
}

#Preview {
    BMIView()
//    ToggleButton(text: "Male", imageName: "heart.fill", index: 0)
}
