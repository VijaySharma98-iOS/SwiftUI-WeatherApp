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
                Spacer()
            }
            
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
    }
}

#Preview {
    ContentView()
}
