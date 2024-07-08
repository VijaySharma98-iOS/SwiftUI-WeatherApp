//
//  ContentView.swift
//  SwiftUI-WeatherApp
//
//  Created by Vijay Sharma on 06/07/24.
//

import SwiftUI

struct WeekWeatherModel {
    var weekName: String
    var imageName: String
    var temperature: Int
}


struct ContentView: View {
    
    @State private var isNight = false
    
    let weekData = [
            WeekWeatherModel(weekName: "Mon", imageName: "sun.max.fill", temperature: 76),
            WeekWeatherModel(weekName: "Tue", imageName: "cloud.sun.fill", temperature: 60),
            WeekWeatherModel(weekName: "Wed", imageName: "wind", temperature: 72),
            WeekWeatherModel(weekName: "Thu", imageName: "sunset.fill", temperature: 75),
            WeekWeatherModel(weekName: "Fri", imageName: "cloud.sun.fill", temperature: 72)
        ]
    
    var body: some View {
        ZStack {
            
            BackGroundView(isNight: $isNight)
            
            VStack {
                
                CityNameView(cityName: "Cupertino, CA")
                WeatherView(temperature: "76°", 
                            icon:  isNight ? "moon.stars.fill" : "cloud.sun.fill")
                    
                HStack(spacing: 20) {
                    
                    ForEach(weekData,id: \.weekName) { day in
                        WeekWeather(weekName: day.weekName,
                                    imageName: day.imageName,
                                    temperature: day.temperature)
                        
                    }
                    

                }
                Spacer()
                
                Button {
                    print("Button tapped")
                    isNight.toggle()
                } label: {
                    ButtonTextView(title: isNight ? "Change day Time." : "Change night Time",
                                   textColor: .blue,
                                   backGroundColor: .white)
                }
                Spacer()
            }
            
        }
    }
}

#Preview {
    ContentView()
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

struct BackGroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(colors: [isNight ? .black : .blue,
                                isNight ? .gray : .appBlue],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea()
    }
}



