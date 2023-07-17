//
//  LocationsView.swift
//  Dating
//
//  Created by Bohlale Manage on 2023/07/17.
//
import SwiftUI
import MapKit



struct LocationsView: View {
    
    
    @EnvironmentObject private var vm: LocationsViewModel
    
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $vm.mapRegion)
                .ignoresSafeArea()
            
            VStack (spacing: 0){
                header
                .padding()
                
                
                Spacer()
                ZStack {
                    ForEach(vm.locations) { location in
                        if vm.mapLocation == location {
                            LocationPreviewView(location: location)
                                .shadow(color: Color.black.opacity(0.3), radius: 20)
                                .padding()
                                .transition(.asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)))
                        }
                    }
                }
                
            }
        }
        .sheet(item: $vm.sheetLotion, onDismiss: nil) { location in
            LocationDetail(location: location)
        }
    }
}


struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
            .environmentObject(LocationsViewModel())
    }
}

extension LocationsView {
    private var header: some View {
        VStack {
            Text(vm.mapLocation.cityName)
                .font(.title2)
                .fontWeight(.black)
                .foregroundColor(.primary)
                .frame(height: 55)
                .frame(width: .infinity)
                .animation(.none, value: vm.mapLocation)
                .overlay(alignment: .leading) {
                    //Image(systemName: "arrow.down")
                        
                }
            if vm.showLocationsList {
                LocationsListView()
            }
                
            
        }
        .background(.thinMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(30), radius: 20, x: 0, y: 15)
    }
}

