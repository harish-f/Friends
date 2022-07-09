//
//  File.swift
//  freindsApp
//
//  Created by HARISH RAM BAGHAVATH stu on 18/6/22.
//

import Foundation
import SwiftUI

struct FriendDetailView: View {
    @Binding var friend: Friend;
    var body: some View {
        ScrollView {
            Image(friend.slothImage)
                .resizable()
                .frame(height: 300)
                .scaledToFit()
            
            Image(friend.slothImage)
                .resizable()
                .scaledToFill()
                .frame(width: 250, height: 250)
                .mask(Circle())
                .overlay(
                    Circle()
                        .stroke(lineWidth: 8)
                        .foregroundColor(.white)
                )
                .offset(y: -250/2)
                .shadow(radius: 6)
                .padding(.bottom, -250/2)
            
            Text("\(Image(systemName: friend.icon))\(friend.name)")
                .font(.largeTitle)
                .padding()
                .frame(alignment: .topLeading)
            HStack {
                ForEach(friend.types, id: \.rawValue) { type in
                    Label(type.rawValue, systemImage: type.getSymbolName())
                        .padding(15)
                        .foregroundColor(.white)
                        .background(.blue)
                        .cornerRadius(15)
                }
            }
            .padding()
            VStack(alignment: .leading){
                Text("Attack")
                Slider(value: $friend.attack,
                       in: 0...15,
                       step: 1)
                Text("Defence")
                Slider(value: $friend.defense,
                       in: 0...15,
                       step: 1)
            }
            .padding()
        }
        
    }
}
