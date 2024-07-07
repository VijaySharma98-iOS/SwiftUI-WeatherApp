//
//  ContentView.swift
//  SwiftUI-WeatherApp
//
//  Created by Vijay Sharma on 06/07/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            BackGroundView()
            VStack {
                
                CityNameView(cityName: "Cupertino, CA")
                WeatherView(temperature: "76°", icon:  "cloud.sun.fill")
                    
                HStack(spacing: 20) {
                    WeekWeather(weekName: "Mon",
                                imageName: "sun.max.fill",
                                temperature: 76)
                    
                    WeekWeather(weekName: "Tue",
                                imageName: "cloud.sun.fill",
                                temperature: 60)
                    
                    WeekWeather(weekName: "Wed", 
                                imageName: "wind",
                                temperature: 72)
                    
                    WeekWeather(weekName: "Thu",
                                imageName: "sunset.fill",
                                temperature: 75)
                    
                    WeekWeather(weekName: "Fri", 
                                imageName: "cloud.sun.fill",
                                temperature: 72)

                }
                Spacer()
            }
            
        }
    }
}
struct WeekWeather: View {
    
    var weekName: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Text(weekName)
                .font(.system(size: 20, weight: .bold))
                .foregroundStyle(.white)
                .padding(.bottom)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundStyle(.white)
            
        }
        
    }
}

struct CityNameView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .bold()
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundStyle(.white)
    }
}

struct BackGroundView: View {
    var body: some View {
        LinearGradient(colors: [.blue, .white],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea()
    }
}
struct WeatherView: View {
    var temperature: String
    var icon: String
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: icon)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text(temperature)
                .font(.system(size: 70, weight: .medium))
                .foregroundStyle(.white)
        }
        .padding(.bottom, 40)
    }
        
}

#Preview {
    ContentView()
}
