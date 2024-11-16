//
//  LocationsListView.swift
//  WeatherTest
//
//  Created by Angelber Castroon 15/11/24.
//

import SwiftUI
import Factory

struct LocationsListView: View {
    @State var items = Container.datastore.getLocations()

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.gray.opacity(0.3), Color.gray]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(alignment: .leading) {
                if items.count > 0 {
                    Text("My Locations")
                        .font(.largeTitle)
                        .bold()
                        .padding(.horizontal)

                    List {
                        ForEach(items) { item in
                            LocationsRow(lat: item.lat, lon: item.lon, name: item.name)
                                .listRowInsets(EdgeInsets(top: 0, leading: 10, bottom: 5, trailing: 10))
                                .listRowBackground(Color.white.opacity(0.1))
                        }
                    }
                    .listStyle(PlainListStyle())
                } else {
                    Spacer()
                    Text("Empty locations")
                        .font(.largeTitle)
                        .bold()
                        .padding(.horizontal)
                    Spacer()
                }
            }
        }
    }
}
