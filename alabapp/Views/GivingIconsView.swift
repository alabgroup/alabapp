//
//  GivingIconsView.swift
//  alabapp
//
//  Created by Kirsty Ihenetu on 2/25/23.
//

import SwiftUI

struct GivingIconsView: View {
    var body: some View {
        VStack(alignment: .center) {
                ZStack(alignment: .centerLastTextBaseline) {
                    Image("Online Giving")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                        .frame(width: 340, height: 155)
                        .offset(x:0, y:215)
                    Text("Online Giving")
                        .font(.title2)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.leading)
                        .padding(25)
                        .offset(x:0, y:165)
                }
                HStack{
                    ZStack(alignment: .leading) {
                        Image("Checks & Cash")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                            .frame(width: 160, height: 168)
                            .offset(x:0, y:175)
                        Text("Checks & Cash")
                            .font(.title3)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                            .offset(x:12, y:188)
                    }
                    ZStack(alignment: .trailing) {
                        Image("Receipts")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                            .frame(width: 160, height: 168)
                            .offset(x:0, y:175)
                        Text("Receipts")
                            .font(.title3)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                            .offset(x:-40, y:187.5)
                    }
                }
        }
    }
}

struct Previews_GivingIconsView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            GivingIconsView()
        }
    }
}





/*    let geometry: GeometryProxy
 let catergoryName: String
 let catergoryNameLeft: String
 let catergoryNameRight: String
 var body: some View{
     ZStack(alignment: .bottomTrailing){
         Image(catergoryName.lowercased())
             .resizable()
             .aspectRatio(contentMode: fill)
             .frame(width: geometry.size.width * 0.45, height: geometry.size.width *0.55)
         Text(categoryName)
     }

 }
 
 ScrollView{
     VStack{
         GivingIconsView(geometry: geometry, catergoryNameLeft: "About Giving", catergoryNameRight: "Online Giving")
         GivingIconsView(geometry: geometry, catergoryNameLeft: "Checks & Cash", catergoryNameRight: "Receipts")
     }
 }

*/
