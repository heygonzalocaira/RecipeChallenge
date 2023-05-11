//
//  LocationView.swift
//  recipeapp
//
//  Created by heygonza on 10/05/23.
//
import MapKit
import SwiftUI

struct LocationView: View {
    
    let location: Location
    @State private var region: MKCoordinateRegion
    
    init(location: Location) {
        self.location = location
        _region = State(initialValue: MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5)))
    }
    
    
    var body: some View {
        Map(coordinateRegion: $region)
            .edgesIgnoringSafeArea(.all)
    }
}
struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView(location: Location.example1())
    }
}
