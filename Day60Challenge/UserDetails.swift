//
//  UserDetails.swift
//  Day60Challenge
//
//  Created by Maciej on 02/10/2022.
//

import SwiftUI

struct UserDetails: View {
    var user: User
    @State var showIdAlert = false
    
    var body: some View {
        List {
            Section {
                HStack {
                    Text(user.name)
                    Spacer()
                    Text(" \(user.age) years old")
                        .foregroundColor(.secondary)
                }
                Text("Member since: \(user.registered.formatted(.dateTime.month(.wide).year()))")
            } header: {
                Text("User name")
            }
            
            Section {
                Text(user.about)
            } header: {
                Text("About")
            }
            
            Section {
                Text(user.email)
                Text(user.address)
                Text("Works at: \(user.company)")
            } header: {
                Text("Details")
            }
            
            Section {
                ForEach(user.friends, id: \.self) { friend in
                    VStack {
                        HStack {
                            Image(systemName: "person.fill")
                            Text(friend?.name ?? "Friend")
                        }
                    }
                }
            } header: {
                Text("Friends: \(user.friends.count)")
            }
        }
        .navigationTitle("\(user.name): \(user.isActive ? "Active" : "Offline")")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem {
                Button {
                    showIdAlert.toggle()
                } label: {
                    Image(systemName: "person.circle")
                }
            }
        }
        .alert("User ID", isPresented: $showIdAlert) {
            Button("Close", action: { } )
        } message: {
            Text(user.id)
        }
        
    }
}

struct UserDetails_Previews: PreviewProvider {
    static var previews: some View {
        UserDetails(user: User(id: "1", isActive: true, name: "Maciej Cantop", age: 22, company: "GD", email: "mcantop@gmail.com", address: "Pluto", about: "goood human", registered: Date.now, tags: ["I like SwiftUI"], friends: [nil]))
    }
}
