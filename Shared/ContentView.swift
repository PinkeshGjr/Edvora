//
//  ContentView.swift
//  Shared
//
//  Created by  on 24/11/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingAlert = false
    @State var viewModel: ContentViewModel
    
    var body: some View {
        VStack {
            
            Spacer()
            Image("logo")
            Spacer()
            CustomTextField(title: "Username", image: "user", textInput: $viewModel.username)
                .padding(25)
                .frame(height: 70)
            CustomPasswordTextField("Password")
                .padding(25)
                .frame(height: 70)
            CustomTextField(title: "Email address", image: "email", textInput: $viewModel.email)
                .padding(25)
                .frame(height: 70)
            HStack{
                Spacer()
                Button {
                } label: {
                    Text("Forgotten Password?")
                        .foregroundColor(FONT_COLOR)
                }
            }.padding(25)
            Spacer()
            CustomButton("LOGIN")
                .padding(25)
                .frame(height: 90)
                .onTapGesture {
                    if !viewModel.isValidData() {
                        showingAlert = true
                    }
                    
                    print(viewModel.email)
                }
            HStack(alignment: .center, spacing: 5) {
                Text("Don't have an account?")
                    .foregroundColor(Color.gray)
                Button {
                } label: {
                    Text("Sign up")
                        .foregroundColor(FONT_COLOR)
                }
            }
        }
        .alert(viewModel.errorMessage, isPresented: $showingAlert) {
            Button("OK", role: .cancel) { }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ContentViewModel())
    }
}

