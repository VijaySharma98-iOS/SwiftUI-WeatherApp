//
//  ButtonTextView.swift
//  SwiftUI-WeatherApp
//
//  Created by Vijay Sharma on 08/07/24.
//

import SwiftUI

struct ButtonTextView: View {
    
    var title: String
    var textColor: Color
    var backGroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280,height: 50)
            .background(backGroundColor)
            .font(.system(size: 20,
                          weight: .bold,
                          design: .default))
            .foregroundStyle(textColor)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
