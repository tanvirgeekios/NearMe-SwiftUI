//
//  ListView.swift
//  NearMeAzam
//
//  Created by MD Tanvir Alam on 1/6/21.
//

import SwiftUI

struct ListView: View {
    let landmarks : [LandMarkViewModel]
    var body: some View {
        List(landmarks, id:\.id){ landmark in
            VStack(alignment:.leading, spacing:10){
                Text(landmark.name)
                Text(landmark.title)
            }
        }
    }
}

//struct ListView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListView(landmarks: <#[LandMarkViewModel]#>)
//    }
//}
