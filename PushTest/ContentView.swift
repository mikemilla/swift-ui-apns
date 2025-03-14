//
//  ContentView.swift
//  PushTest
//
//  Created by Michael Miller on 3/14/25.
//

import SwiftUI
import Courier_iOS

struct ContentView: View {
    @State private var userId: String = "test_user"
    @State private var isLoading: Bool = true
    @State private var isSignedIn: Bool = false

    var body: some View {
        Group {
            if isLoading {
                // Show loading indicator
                ProgressView("Loading...")
            } else {
                // Show only userId and jwt fields
                VStack(spacing: 20) {
                    Text("User ID: \(userId): \(isSignedIn ? "Signed In" : "Not Signed In")")
                    Button(isSignedIn ? "Sign Out" : "Sign In") {
                        if isSignedIn {
                            Task {
                                await Courier.shared.signOut()
                                isLoading = false
                                isSignedIn = false
                            }
                        } else {
                            Task {
                                await signIn()
                            }
                        }
                    }
                }
            }
        }
        .padding()
        .onAppear {
            Task {
                await refreshUser()
            }
        }
    }
    
    // This should hit an endpoint on your backend and return the jwt with your security requirements
    private func getJWT() -> String {
        return "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzY29wZSI6InVzZXJfaWQ6dGVzdF91c2VyIHdyaXRlOnVzZXItdG9rZW5zIGluYm94OnJlYWQ6bWVzc2FnZXMgaW5ib3g6d3JpdGU6ZXZlbnRzIHJlYWQ6cHJlZmVyZW5jZXMgd3JpdGU6cHJlZmVyZW5jZXMgcmVhZDpicmFuZHMiLCJ0ZW5hbnRfc2NvcGUiOiJwdWJsaXNoZWQvcHJvZHVjdGlvbiIsInRlbmFudF9pZCI6IjJjYTViODIyLWZjZjItNGE5Ni04YmEyLTQ4M2I2MTE2ZDMzMCIsImlhdCI6MTc0MTk3NDE1NiwiZXhwIjoxODI4Mzc0MTU2LCJqdGkiOiIzZTQwOGYyMS01YzA2LTQ5MWEtYjI1Zi0zMmFjNGMwYTNmNTUifQ.Jg7YEQrkRrbYkdJ46HTQb_AjYllLQGPmVvB3FmVj9DU"
    }
    
    private func refreshUser() async {
        
        let isUserSignedIn = await Courier.shared.isUserSignedIn
        
        if !isUserSignedIn {
            isSignedIn = false
            isLoading = false
            return
        }
        
        // Get a new jwt
        await signIn()
        
    }

    private func signIn() async {
        isSignedIn = true
        isLoading = true
        do {
            let jwt = getJWT()
            await Courier.shared.signIn(userId: userId, accessToken: jwt)
            let status = try await Courier.requestNotificationPermission()
            print(status.rawValue)
        } catch {
            print(error.localizedDescription)
        }
        isLoading = false
    }
}

#Preview {
    ContentView()
}
