//
//  GivingIconsView.swift
//  alabapp
//
//  Created by Kirsty Ihenetu on 2/25/23.
//

import SwiftUI

struct ImageOverlay: View {
    var image : String
    var text: String
    var body: some View {
        VStack (spacing: 10){
            Text(text)
                .font(MyFont.title2)
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
            Image(systemName: image)
                .font(.largeTitle)
                .foregroundColor(.white)
        }
    }
}

struct OnlineGivingView: View{
    let GIwidth = CGFloat(UIScreen.main.bounds.width - 48.0)
    var body: some View{
        ZStack(alignment: .trailing) {
            Image("onlineGiving")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                .frame(width: (GIwidth-12)/2)
                .overlay(ImageOverlay(image: "globe", text: "Online Giving"), alignment: .center)
        }
    }
}

struct ChecksCashView: View {
    let GIwidth = CGFloat(UIScreen.main.bounds.width - 48.0)
    
    var body: some View {
        ZStack(alignment: .leading) {
            Image("checks&Cash")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 14, style: .continuous))
                .frame(width: (GIwidth-12)/2)
                .overlay(ImageOverlay(image: "dollarsign.circle", text: "Checks & Cash"), alignment: .center)
        }
    }
}


struct BottomSheetView: View{
    let GIwidth = CGFloat(UIScreen.main.bounds.width - 48.0)

    var body: some View{
        ScrollView{
            VStack(alignment: .center){
         
                Spacer()
                Text("Checks and Cash")
                    .font(MyFont.title2)
                    .fontWeight(.medium)
                Spacer()
                Text("You use our donation box located by the exits of the Ballroom to give by check.\n \n**Please make checks payable to Alabaster Group**, so that we are able to process and receipt gifts.\n \nTo receive a receipt for cash gifts, please fill out an envelope and include your cash in the envelope. You may also use our envelopes to make a gift by card.")
                    .font(MyFont.body)
                    .lineSpacing(2)
            }
        }.frame(width: GIwidth)
            
    }
}

struct GivingIconsView: View{
    @State var showingBottomSheet = false
    
    var body: some View{
        HStack (spacing: 10){
            Button(action: {
                if let churchCenterUrl = URL(string: "https://churchcenter.com/setup") {
                    UIApplication.shared.open(churchCenterUrl)
                }
            }) {
                OnlineGivingView()
            }
            
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
