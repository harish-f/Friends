//
//  File.swift
//  freindsApp
//
//  Created by HARISH RAM BAGHAVATH stu on 2/7/22.
//

import Foundation
import SwiftUI

struct NewFriendView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var friends: [Friend]
    @Binding var isNewFriendPresented: Bool
    @State var newFriend = Friend(name: "", icon: "", school: "", slothImage: "sloth1", attack: 0, defense: 0, types: [.water])
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Information")) {
                        TextField("Enter your name", text: $newFriend.name)
                        TextField("Enter an icon name", text: $newFriend.icon)
                        TextField("Enter your school", text: $newFriend.school)
                    }
                    Section(header: Text("Pew Pew Strength")) {
                        VStack{
                            Text("Attack: \(newFriend.attack)")
                            Slider(value: $newFriend.attack, in: 0...15, step: 1)
                        }
                        VStack{
                            Text("Defense: \(newFriend.defense)")
                            Slider(value: $newFriend.defense, in: 0...15, step: 1)
                        }
                    }
                    Section(header: Text("hi")) {
                        Picker("Type", selection: $newFriend.types) {
                            Text("normal")
                                .tag(FriendType.normal)
                            Text("fire")
                                .tag(FriendType.fire)
                            Text("water")
                                .tag(FriendType.water)
                            Text("grass")
                                .tag(FriendType.grass)
                            Text("electric")
                                .tag(FriendType.electric)
                            Text("ice")
                                .tag(FriendType.ice)
                        }
                    }
                        
                }
                HStack {
                    Button {
                        newFriend = Friend(name: "", icon: "", school: "", slothImage: "", attack: 0, defense: 0, types: [])
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Cancel")
                            .padding(10)
                            .background(.blue)
                            .foregroundColor(.red)
                            .cornerRadius(10)
                    }
                    
                    
                    Button {
                        friends.append(newFriend)
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("DONE")
                            .padding(10)
                            .background(.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                
            }.navigationTitle("Add Friend")
        }
    }
}
