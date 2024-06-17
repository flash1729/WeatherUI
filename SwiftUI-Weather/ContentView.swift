//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Aditya Medhane on 25/05/24.
//

// Todo 1. make a database for days and use enums and stufs to organize the htack
//      2. Use a weather api and create a basic app

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    
    var body: some View {
        ZStack(content: {
            
            BackgroundView(isNight: isNight)
        
            VStack(spacing: 0.0){
                
                CityTextView(cityName: "Nashik, MH")
                
                BigWeatherDetailView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temp: isNight ? 20 : 25)
                
                
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "MON", imageName: "cloud.sun.fill", temp: 24)
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.snow.fill", temp: 27)
                    WeatherDayView(dayOfWeek: "WEN", imageName: "cloud.moon.rain.fill", temp: 23)
                    WeatherDayView(dayOfWeek: "THU", imageName: "tornado", temp: 29)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "cloud.sun.rain.fill", temp: 21)
                    
                    
                }
                
                .padding(.bottom, 80)
                
                Button{
                    isNight.toggle()
                } label: {
                    WeatherButton(btLabel: "Change Day Time",
                                  backGrndClr: .mint,
                                  textColor: .white)
                }
                
                
                Spacer()
            }
            .padding()
        })
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temp: Int
    var body: some View {
        VStack(spacing: 2) {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temp)°")
                .font(.system(size: 30))
                .foregroundStyle(.white)
            
        }
    }
}

struct BackgroundView: View {
    var isNight: Bool
    
    var body: some View {
        // This gradient is a very customised one
//        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,
//                                                   isNight ? .gray : Color("lightBlue")]),
//                       startPoint: .topLeading,
//                       endPoint: .bottomTrailing)
//        .ignoresSafeArea()
  
// Very simple default gradient
        
        ContainerRelativeShape()
            .fill(isNight ? Color.black.gradient : Color.blue.gradient)
            .ignoresSafeArea()
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View{
        
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
    
}

struct BigWeatherDetailView: View {
    
    var imageName: String
    var temp: Int
    
    var body: some View{
        VStack(spacing: 8) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
            Text("\(temp)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}

struct WeatherButton: View {
    
    var btLabel: String
    var backGrndClr: Color
    var textColor: Color
    
    var body: some View{
        
        Text(btLabel)
            .frame(width: 280, height: 50)
            .background(backGrndClr.gradient)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
