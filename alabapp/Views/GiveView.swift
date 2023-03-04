//
//  GiveView.swift
//  alabapp
//
//  Created by Janet Lee on 2/25/23.
//

import SwiftUI

struct GiveView: View {
    var body: some View {
        VStack(alignment: .center) {
            Text("Offering")
                .font(.largeTitle)
                .fontWeight(.bold)
                .offset(x:0, y:-350)
        }
      //  .padding()
        
        VStack(){
            HStack(){
                Text("Note for Special Events")
                    .fontWeight(.medium)
                    .font(.title)
                    .foregroundColor(.gray)
                    .frame(width: 327, height: 223, alignment: .leading)
                    .offset(x:175, y:-105)
                Text("Alabaster Group has committed the financial proceeds from special events to spreading the gospel of Jesus Christ among under-reached and under-served people groups.\nTo that end, **100% of net offerings from special events will be gifted to our speakers and their ministries.** We do not retain offerings from special events to finance our own operations. \nThank you for supporting evangelism, missions, outreach, and mercy ministries to those in need of the light of the gospel.\n")
                    .fontWeight(.light)
                    .lineSpacing(1.5)
                    .frame(width: 327, height: 351, alignment: .center)
                    .offset(x: -159, y: 67)
            }

            HStack(){
                Text("Ways to Give")
                     .fontWeight(.medium)
                     .font(.title)
                     .foregroundColor(.gray)
                     .frame(width: 327, height: 281, alignment: .topLeading)
                     .offset(x: 5, y: 18)
            }
            Spacer()

        }

    }
}

struct GiveView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack(){
            GiveView()
            GivingIconsView()
        }
    }
}

