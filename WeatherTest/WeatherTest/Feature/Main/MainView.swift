//
//  MainView.swift
//  WeatherTest
//
//  Created by Angelber Castro on 15/11/24.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    @State private var showAlert = false

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.blue]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(spacing: 20) {
                Button(action: {
                    let vc = MapViewContainer()
                    Navigation.push(view: vc, animated: true)
                }) {
                    Text("Maps View")
                }
                .buttonStyle(ButtonsStyle(color: .green))

                Button(action: {
                    let vc = LocationsListView()
                    Navigation.push(view: vc, animated: true)
                }) {
                    Text("Locations List")
                }
                .buttonStyle(ButtonsStyle(color: .blue))

                Button(action: {
                    viewModel.getWeather()
                }) {
                    Text("Test API")
                }
                .buttonStyle(ButtonsStyle(color: .green))
            }
            .padding()

        }
        .navigationTitle("Principal View")
        .alert(isPresented: Binding<Bool>(
            get: { viewModel.weatherMessage != nil },
            set: { if !$0 { viewModel.weatherMessage = nil } }
        )) {
            Alert(
                title: Text("API Result"),
                message: Text(viewModel.weatherMessage ?? ""),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}
