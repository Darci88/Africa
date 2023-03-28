//
//  MapView.swift
//  Africa
//
//  Created by user219285 on 3/27/23.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        return mapRegion
    }()
    
    let locations: [NationalParkLocation] = Bundle.main.decode("locations.json")
    
    //MARK: - Body
    var body: some View {
        // Basic Map
      //  Map(coordinateRegion: $region)
        
        // Advanced Map
        Map(coordinateRegion: $region, annotationItems: locations, annotationContent: { item in
            // a) Pin: old style (always static)
            // MapPin(coordinate: item.location, tint: .accentColor)
            
            // b) Marker: new style (always static)
            //MapMarker(coordinate: item.location, tint: .accentColor)
            
            // c) Custom basic annotation (it could be interactive)
//            MapAnnotation(coordinate: item.location) {
//                Image("logo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 30, height: 30, alignment: .center)
//            }
            
            // d) custom advanced annotation(it could be interactive)
            MapAnnotation(coordinate: item.location) {
                MapAnnotationView(location: item)
            }
        }) //end map
        .overlay(
            HStack(alignment: .center, spacing: 10) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                .frame(width: 50, height: 50, alignment: .center)
                
                VStack(alignment: .leading, spacing: 3) {
                    HStack {
                        Text("Latitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    
                    Divider()
                    
                    HStack {
                        Text("Longitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                }
            } //hstack
            .padding(.vertical, 10)
            .padding(.horizontal, 15)
            .background(
                Color.black
                    .cornerRadius(10)
                    .opacity(0.6)
            )
            .padding()
            , alignment: .top
            
        )
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
