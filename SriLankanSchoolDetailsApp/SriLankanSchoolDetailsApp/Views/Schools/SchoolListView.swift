//
//  SchoolList.swift
//  SriLankanSchoolDetailsApp
//
//  Created by Erantha Welikala on 1/3/22.
//

import SwiftUI

struct SchoolListView: View {
    
    @EnvironmentObject var modelData: ModelData
    
    @State private var showFavoritesOnly = false
    
    var filteredSchools: [School] {
        modelData.schools.filter {school in
            (!showFavoritesOnly || school.isFavorite)
        }
    }
    
    var body: some View {
        List {
            Toggle(isOn: $showFavoritesOnly) {
                Text("Favorites Only")
            }
            ForEach(filteredSchools, id: \.imageName) { school in
                NavigationLink(
                    destination:
                        SchoolDetailView(school: school),
                    label: {
                        SchoolRowView(school: school)
                            .padding()
                    })
            }
        }
    }
}

struct SchoolList_Previews: PreviewProvider {
    static var previews: some View {
        SchoolListView()
            .environmentObject(ModelData())
    }
}
