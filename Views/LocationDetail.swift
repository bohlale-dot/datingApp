//
//  LocationDetail.swift
//  Dating
//
//  Created by Bohlale Manage on 2023/07/17.
//

import SwiftUI

struct LocationDetail: View {
    
    let location: Location
    var body: some View {
        ScrollView {
            VStack
            {
                imageSelection
                    .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10)
                
                
                VStack(alignment: .leading, spacing: 16) {
                    titleSection
                    Divider()
                    descriptionSection
                    
                   
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                }
            
            }
        .ignoresSafeArea()
        .overlay(backButton, alignment: .topLeading)
           
        }
        
    }


struct LocationDetail_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetail(location: LocationsDataService.locations.first!)
    }
}

extension LocationDetail {
    private var imageSelection: some View {
        TabView {
            ForEach(location.imageNames, id: \.self) {
                Image($0)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped()
            }
        }
        .frame(height: 500)
        .tabViewStyle(PageTabViewStyle())

    }
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(location.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text(location.cityName)
                .font(.title3)
                .foregroundColor(.secondary)
        }
    }
    private var descriptionSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(location.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
               
          
        }
    }
    private var backButton: some View {
        Button {
            //
        } label: {
            Image(systemName: "Xmark")
                .font(.headline)
                .padding(16)
                .foregroundColor(.primary)
                .background(.thickMaterial)
                .cornerRadius(10)
                .shadow(radius: 4)
                .padding()
        }

    }
}
