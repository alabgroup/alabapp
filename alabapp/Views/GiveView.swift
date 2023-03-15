//
//  GiveView.swift
//  alabapp
//
//  Created by Janet Lee on 2/25/23.
//

import SwiftUI

struct GiveView: View {
    let screenW = CGFloat((UIScreen.main.bounds.width - 48.0))
    
    var body: some View {
        
        ScrollView (showsIndicators: false) {
                VStack(alignment: .center, spacing: 10) {
                    Text("Offering")
                        .fontWeight(.medium)
                        .font(MyFont.largeTitle)
                    Spacer()
                    
                    GivingIconsView()
                    
                    Spacer()
                    Text("Receipts")
                        .fontWeight(.medium)
                        .font(MyFont.title)
                        .foregroundColor(.gray)
                        .frame(width: screenW, alignment: .leading)
                    Text("Alabaster Group is a charity registered under Section 501(c)3, and donations may be deducted against US taxable income to the extent permitted by law.\n \nWe provide receipts at year-end to all donors who require substantiation for gifts made during the calendar year (typically single gifts over $250 USD). \n \nTo request a receipt before year-end or for any other giving-related inquiries, please e-mail us at support@alab.org.")
                        .font(MyFont.body)
                        .fontWeight(.regular)
                        .lineSpacing(1.5)
                    Spacer()
                    Text("Notes for Special Events")
                        .fontWeight(.medium)
                        .font(MyFont.title)
                        .foregroundColor(.gray)
                        .frame(width: screenW, alignment: .leading)
                    Text("Alabaster Group has committed the financial proceeds from special events to spreading the gospel of Jesus Christ among under-reached and under-served people groups.\n \nTo that end, **100% of net offerings from special events will be gifted to our speakers and their ministries.** We do not retain offerings from special events to finance our own operations. \n \nThank you for supporting evangelism, missions, outreach, and mercy ministries to those in need of the light of the gospel.")
                        .font(MyFont.body)
                        .fontWeight(.regular)
                        .lineSpacing(1.5)
                    Spacer()
                }
            }.frame(width: screenW)
        } //end bracket for scrollview
} //end of GiveView struct

struct GiveView_Previews: PreviewProvider {
    static var previews: some View {
        GiveView()
    }
}

