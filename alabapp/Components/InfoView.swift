//
//  InfoView.swift
//  alabapp
//
//  Created by Janet Lee on 3/1/23.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        ScrollView {
            VStack (alignment: .leading, spacing: 10) {
                Text("Policies")
                    .font(.title)
                Text("You may not record or stream any portion of this event. You may be removed from the venue upon the first violation. Rights to presentations made at Gospel Forum are reserved, and unauthorized use and recordings are strictly prohibited. We will make recordings available for free via YouTube a few weeks after the event.")
                    .font(.caption)
                
                Text("More policies")
                    .font(.title2)
                Text("You may not record or stream any portion of this event. You may be removed from the venue upon the first violation. Rights to presentations made at Gospel Forum are reserved, and unauthorized use and recordings are strictly prohibited. We will make recordings available for free via YouTube a few weeks after the event.")
                    .font(.caption)
                Text("You may not record or stream any portion of this event. You may be removed from the venue upon the first violation. Rights to presentations made at Gospel Forum are reserved.")
                    .font(.caption)
                
                Text("Even more policies")
                    .font(.title2)
                Text("You may not record or stream any portion of this event. You may be removed from the venue upon the first violation. Rights to presentations made at Gospel Forum are reserved, and unauthorized use and recordings are strictly prohibited. We will make recordings available for free via YouTube a few weeks after the event.")
                    .font(.caption)
            }.padding(.horizontal, 24)
        }
        
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
