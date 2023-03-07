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
                    .font(MyFont.title)
                    .padding(.top, 20)
                Text("You may not record or stream any portion of this event. You may be removed from the venue upon the first violation. Rights to presentations made at Gospel Forum are reserved, and unauthorized use and recordings are strictly prohibited. We will make recordings available for free via YouTube a few weeks after the event.")
                    .font(MyFont.caption)
                
                Text("More policies")
                    .font(MyFont.title)
                Text("You may not record or stream any portion of this event. You may be removed from the venue upon the first violation. Rights to presentations made at Gospel Forum are reserved, and unauthorized use and recordings are strictly prohibited. We will make recordings available for free via YouTube a few weeks after the event.")
                    .font(MyFont.caption)
                Text("You may not record or stream any portion of this event. You may be removed from the venue upon the first violation. Rights to presentations made at Gospel Forum are reserved.")
                    .font(MyFont.caption)
                
                Text("Even more policies")
                    .font(MyFont.title)
                Text("You may not record or stream any portion of this event. You may be removed from the venue upon the first violation. Rights to presentations made at Gospel Forum are reserved, and unauthorized use and recordings are strictly prohibited. We will make recordings available for free via YouTube a few weeks after the event.")
                    .font(MyFont.caption)
            }.padding(.horizontal, 24)
        }
        
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
