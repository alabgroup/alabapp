//
//  HomeView.swift
//  alabapp
//
//  Created by Janet Lee on 2/25/23.
//

import SwiftUI

struct HomeView: View {
    // SwiftUI
    let alabCityView = Image("AlabCityView")
    var body: some View {
        ZStack {
            alabCityView
            //                .fill(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
                .ignoresSafeArea()
                .padding(.trailing, 6)
                .frame(width: 385, height: 273)
                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                .cornerRadius(8)
                .offset(x: 0, y: -269.50)
            //                .cornerRadius(90)
            
            Text("Alabaster Group")
                .fontWeight(.bold)
                .font(.largeTitle)
                .foregroundColor(.white)
                .frame(width: 361, height: 65, alignment: .topLeading)
                .offset(x: 19, y: -177.50)
            
            
            //            .offset(x: 0, y: 24.75)
            //            .frame(width: 475, height: 83.50)
            
            VStack(alignment: .leading, spacing: 5) {
                
                
                HStack (spacing: 35){
                    Text("Visit Us in New York City!")
                        .fontWeight(.semibold)
                        .font(.callout)
                        .multilineTextAlignment(.center)
                    //                        .frame(width: 276.52, height: 181, alignment: .topLeading)
                        .frame(width: 125, height: 21, alignment: .topLeading)
                        .padding(.leading, 15)
                        .padding(.trailing, 16)
                        .padding(.top, 50)
                        .padding(.bottom, 81)
                    //                        .offset(x: -93.50, y: -49)
                        .frame(width: 136, height: 132)
                        .background(Color(red: 0.54, green: 0.75, blue: 0.90, opacity: 0.80))
                        .cornerRadius(8)
                    
                    Text("Visit Us in Boston!")
                        .fontWeight(.semibold)
                        .font(.callout)
                        .multilineTextAlignment(.center)
                        .frame(width: 125, height: 21, alignment: .topLeading)
                        .padding(.leading, 15)
                        .padding(.trailing, 16)
                        .padding(.top, 50)
                        .padding(.bottom, 81)
                    //                    .offset(x: -93.50, y: -49)
                        .frame(width: 136, height: 132)
                        .background(Color(red: 0.54, green: 0.75, blue: 0.90, opacity: 0.80))
                        .cornerRadius(8)
                    
                }
                Text("About Alabaster Group ")
                    .fontWeight(.medium)
                    .font(.title)
                    .frame(width: 312, height: 35, alignment: .topLeading)
                
                Text("Why We Exist")
                    .fontWeight(.semibold)
                    .font(.callout)
                    .frame(width: 217.37, height: 18, alignment: .topLeading)
                
                Text("Alabaster Group is a ministry dedicated to the Gospel of Jesus Christ. We exist for his sake, out of love for him and a desire to see others love and delight in him. We operate with a long-term vision of bringing people into deeper knowledge of and relationship with Jesus, through the powerful work of the Holy Spirit.\nWe began our ministry on a group of university campuses commonly called the Ivy League. While we are still focused on these campuses and other select universities, we also host Alabaster Church in New York City and continually seek to expand the means through which we can foster a thriving spiritual community to the glory of his name.")
                    .fontWeight(.medium)
                    .font(.caption)
                    .frame(width: 276.52, height: 181, alignment: .topLeading)
            }
            .frame(maxWidth: 312, maxHeight: .infinity)
            .offset(x: 2.50, y: 84)
            .frame(width: 312, height: 202)
            
            //            ZStack {
            ////                CODE FOR HORIZONTAL LINE ABOVE BOTTOM MENU -- NECESSARY!
            //                Rectangle()
            //                    .fill(Color(red: 0.74, green: 0.77, blue: 0.80))
            //                    .offset(x: 0, y: -41)
            //                    .frame(width: 375, height: 0.50)
            //                ZStack {
            //
            //                    VStack(spacing: 3) {
            //                        homeIcon
            //                            .resizable()
            ////                            .fill(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
            //                            .font(.system(size: 40))
            //                            .frame(width: 28, height: 28)
            //
            //                        Text("Events")
            //                            .fontWeight(.medium)
            //                            .font(.caption)
            //                    }
            //                    .offset(x: -11.50, y: -2)
            //                    .frame(width: 38, height: 42)
            //
            //                    VStack(spacing: 3) {
            //                        calendarIcon
            //                            .resizable()
            ////                            .fill(Color(red: 0.50, green: 0.23, blue: 0.27, opacity: 0.50))
            //                            .frame(width: 28, height: 28)
            //
            //                        Text("Contact")
            //                            .fontWeight(.medium)
            //                            .font(.caption)
            //                    }
            //                    .offset(x: 71, y: -1)
            //                    .frame(width: 45, height: 43)
            //                }
            //                .frame(width: 375, height: 83)
            //
            //                VStack(spacing: 3) {
            //                    giveIcon
            //                        .resizable()
            //                        .frame(width: 26, height: 26)
            //
            //                    Text("Give")
            //                        .fontWeight(.medium)
            //                        .font(.caption)
            //                }
            //                .offset(x: 125.50, y: -0.25)
            //                .frame(width: 26, height: 43)
            //            }
            //            .offset(x: 0, y: 364.75)
            //            .frame(width: 375, height: 83.50)
            //
            //            Text("Home")
            //                .fontWeight(.bold)
            //                .font(.largeTitle)
            //                .frame(width: 261, height: 33, alignment: .topLeading)
            //                .offset(x: -264, y: -350.50)
            //        }
            //        .ignoresSafeArea()
            //        .background(Color.white)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}