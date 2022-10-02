//
//  ContentView.swift
//  Day60Challenge
//
//  Created by Maciej on 02/10/2022.
//

import SwiftUI

struct ContentView: View {
    let networkService = NetworkSerivce()
    @State var users = [User]()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(users, id: \.self) { user in
                    NavigationLink(destination: {
                        
                        UserDetails(user: user)
                    }, label: {
                        HStack {
                            Image(systemName: user.isActive ? "circle.fill" : "circle")
                                .foregroundColor(user.isActive ? .green : .gray)
                            Text(user.name)
                        }
                    })
                }
            }
            .navigationTitle("Users: \(users.count)")
            .task {
                do {
                    users = try await networkService.getUsers()
                } catch {
                    print(error)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
