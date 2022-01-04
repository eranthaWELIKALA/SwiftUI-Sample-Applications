//
//  SchoolDetailView.swift
//  SriLankanSchoolDetailsApp
//
//  Created by Erantha Welikala on 1/3/22.
//

import SwiftUI

struct SchoolDetailView: View {
    
    @EnvironmentObject var modelData: ModelData
    
    var school: School
    var schoolIndex: Int {
        modelData.schools.firstIndex(where: { $0.imageName == school.imageName })!
    }
    
    var body: some View {
        ScrollView {
            MapView(coordinate: school.locationCoordinate)
                .ignoresSafeArea(edges: .all)
                .frame(height: 200)
            
            LogoView(logoName: school.imageName)
                .offset(y: -60)
                .padding(.bottom, -60)
            
            VStack(alignment: .leading){
                HStack {
                    Text(school.name)
                        .font(.title)
                    FavoriteButton(isSet: $modelData.schools[schoolIndex].isFavorite)
                }
                Text(school.district)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Divider()
                
                Text(school.description)
                
            }
            .padding()
            
            Spacer()
        }
        .navigationTitle(school.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SchoolDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SchoolDetailView(school: ModelData().schools[0])
            .environmentObject(ModelData())
    }
}
