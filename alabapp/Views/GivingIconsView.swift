//
//  GivingIconsView.swift
//  alabapp
//
//  Created by Kirsty Ihenetu on 2/25/23.
//

import SwiftUI

struct OnlineGivingView: View{
    let GIwidth = CGFloat(UIScreen.main.bounds.width - 48.0)
    var body: some View{
        Grid(alignment: .center, horizontalSpacing: 1,
             verticalSpacing: 30){
            GridRow(){
                ZStack(alignment: .trailing) {
                    Image("onlineGiving")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                        .frame(width: (GIwidth-12)/2, height: 168)
                        .offset(x:0, y:-40)
                    Image(systemName: "globe")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .offset(x:-60, y:-50)
                    Text("Online Giving")
                        .font(.title3)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .offset(x:-25, y:-10)
                }
            }
        }
    }
}
struct ChecksCashView: View {
    let GIwidth = CGFloat(UIScreen.main.bounds.width - 48.0)
   
    var body: some View {
        Grid(alignment: .center, horizontalSpacing: 1,
             verticalSpacing: 30){
            GridRow(){
                ZStack(alignment: .leading) {
                    Image("checks&Cash")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                        .frame(width: (GIwidth-12)/2, height: 168)
                        .offset(x:0, y:-40)
                    Image(systemName: "dollarsign.circle")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        .offset(x:60, y:-50)
                    Text("Checks & Cash")
                        .font(.title3)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .offset(x:12, y:-10)
                    
                }
                    
                }
            }
        }
}


struct BottomSheetView: View{
    var body: some View{
        VStack(alignment: .center){
            Text("Checks and Cash")
                .font(.largeTitle)
                .fontWeight(.bold)
            Spacer()
            Text("You use our donation box located by the exits of the Ballroom to give by check.\n \n **Please make checks payable to Alabaster Group**, so that we are able to process and receipt gifts.\n \n To receive a receipt for cash gifts, please fill out an envelope and include your cash in the envelope. You may also use our envelopes to make a gift by card.")
                .lineSpacing(2)
                .lineLimit(9)
        }
    }
}

struct GivingIconsView: View{
    @State var showingBottomSheet = false
    
    var body: some View{
        HStack {
            Button(action: {
                if let churchCenterUrl = URL(string: "https://churchcenter.com/setup") {
                    UIApplication.shared.open(churchCenterUrl)
                }
            }) {
                OnlineGivingView()
            }
            .padding(.trailing, 8)
            
            Button(action: {
                showingBottomSheet.toggle()
            }) {
                ChecksCashView()
            }
        }
        .sheet(isPresented: $showingBottomSheet) {
            BottomSheetView()
                .presentationDetents([.fraction(0.5)])
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
