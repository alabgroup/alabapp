//
//  GiveView.swift
//  alabapp
//
//  Created by Janet Lee on 2/25/23.
//

import SwiftUI

struct GiveView: View {
    var body: some View {
        
       ScrollView{
            ZStack(alignment: .top){
                VStack(alignment: .center) {
                    Text("Offering")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                       // .offset(x:0, y:-350)
                }
                Spacer()
                
                GivingIconsView()
                    .offset(x:0 , y:110 )
                
                VStack(){
                    HStack(){
                        Text("Receipts")
                            .fontWeight(.medium)
                            .font(.title)
                            .foregroundColor(.gray)
                            .frame(width: 327, height: 223, alignment: .leading)
                            .offset(x:0, y:0)
                        Text("Alabaster Group is a charity registered under Section 501(c)3, and donations may be deducted against US taxable income to the extent permitted by law.\n \n We provide receipts at year-end to all donors who require substantiation for gifts made during the calendar year (typically single gifts over $250 USD). \n \nTo request a receipt before year-end or for any other giving-related inquiries, please e-mail us at support@alab.org.")
                            .fontWeight(.light)
                            .lineSpacing(1.5)
                            .frame(width: 327, height: 351, alignment: .center)
                            .offset(x: 175, y: 250)
                        Spacer()
                        Text("Notes for Special Events")
                            .fontWeight(.medium)
                            .font(.title)
                            .foregroundColor(.gray)
                            .frame(width: 327, height: 223, alignment: .leading)
                            .offset(x:-160, y:405)
                        Spacer()
                        Text("Alabaster Group has committed the financial proceeds from special events to spreading the gospel of Jesus Christ among under-reached and under-served people groups.\nTo that end, **100% of net offerings from special events will be gifted to our speakers and their ministries.** We do not retain offerings from special events to finance our own operations. \nThank you for supporting evangelism, missions, outreach, and mercy ministries to those in need of the light of the gospel.\n")
                            .fontWeight(.light)
                            .lineSpacing(1.5)
                            .frame(width: 327, height: 351, alignment: .center)
                            .offset(x: -490, y: 575)
                    }
                    
                    Spacer()
                    
                }
         }
     } //end bracket for scrollview
    } //end of body
} //end of GiveView struct

struct GiveView_Previews: PreviewProvider {
    static var previews: some View {
            GiveView()
           // GivingIconsView()
    }
}

