//
//  SchoolRow.swift
//  SriLankanSchoolDetailsApp
//
//  Created by Erantha Welikala on 1/3/22.
//

import SwiftUI

struct SchoolRowView: View {
    
    var school: School
    
    var body: some View {
        HStack {
            school.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(school.name)
            
            Spacer()
            if school.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct SchoolRow_Previews: PreviewProvider {
    static var previews: some View {
        SchoolRowView(school: ModelData().schools[0])
    }
}
