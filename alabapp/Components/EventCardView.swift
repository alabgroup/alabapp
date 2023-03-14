//
//  EventCardView.swift
//  alabapp
//
//  Created by Janet Lee on 2/25/23.
//

import SwiftUI

struct EventCardView : View {
    let event: EventMeta
    let default_image = "city"
    
    func getSafeImage(named: String) -> Image {
        let uiImage =  (UIImage(named: named) ?? UIImage(named: default_image))!
        return Image(uiImage: uiImage)
    }
    
    @ViewBuilder
    func view(for phase: AsyncImagePhase) -> some View {
        switch phase {
        case .empty:
            ProgressView()
                .frame(width: (UIScreen.main.bounds.width - 48), height: (UIScreen.main.bounds.width - 48)/2)
        case .success(let image):
            image.resizable()
                .scaledToFill()
                .frame(width: (UIScreen.main.bounds.width - 48), height: (UIScreen.main.bounds.width - 48)/2, alignment: .center)
        case .failure(let error):
            Image(default_image)
            VStack(spacing: 16) {
                Image(systemName: "xmark.octagon.fill")
                    .foregroundColor(.red)
                Text(error.localizedDescription)
                    .multilineTextAlignment(.center)
            }
        @unknown default:
            Text("Unknown")
                .foregroundColor(.gray)
        }
        
    }
    
    func pillColor(_ pillName: String) -> Color {
        switch pillName {
        case "Students":
            return MyFont.yellow
        case "Public":
            return MyFont.lightGray
        default:
            return MyFont.lightBlue
        }
    }
    
    var body: some View {
        // Event card
        ZStack (alignment: .topLeading) {
            
            // Event title and info
            NavigationLink(destination: EventDetailedView(event: event)) {
                ZStack() {
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text(event.values.name)
                            .font(MyFont.title3)
                            .foregroundColor(Color.black)
                            .padding(.leading, 20)
                        
                        HStack (spacing: 10) {
                            Image(systemName:"calendar")
                                .foregroundColor(Color.black)
                            Text(event.values.datesString)
                                .font(MyFont.callout)
                                .foregroundColor(Color.black)
                        }.padding(.leading, 20)
                        
                        HStack (spacing: 10) {
                            Image(systemName:"mappin.and.ellipse")
                                .foregroundColor(Color.black)
                            Text(event.values.location)
                                .font(MyFont.callout)
                                .foregroundColor(Color.black)
                        }.padding(.leading, 20)
                        
                        HStack {
                            // Learn more button
                            ZStack {
                                Capsule()
                                    .frame(width: 76, height: 19)
                                    .foregroundColor(Color(red: 0.02, green: 0.176, blue: 0.408))
                                Text("Learn more")
                                    .font(MyFont.caption)
                                    .foregroundColor(Color.white)
                            }.padding(.leading, 10)
                            
                            Spacer()
                            
                            // Audience pills
                            ForEach (event.values.audiencePills.components(separatedBy: ","), id: \.self) { pillName in
                                ZStack {
                                    Capsule()
                                        .frame(width: 76, height: 19)
                                        .foregroundColor(pillColor(pillName))
                                    Text(pillName)
                                        .font(MyFont.caption)
                                        .foregroundColor(Color.black)
                                }.padding(.leading, 10)
                            }
                        }.padding(.horizontal, 10)
                    }.background(Rectangle()
                        .fill(MyFont.lightestGray)
                        .frame(width: (UIScreen.main.bounds.width - 48), height: (UIScreen.main.bounds.width - 48) * 0.4)
                        .shadow(color: .black.opacity(0.3), radius: 3, x: 2, y: 2))
                    
                    if !event.values.posterUrl.isEmpty {
                        AsyncImage(url: URL(string: event.values.posterUrl), content: view)
                            .frame(width: (UIScreen.main.bounds.width - 48), height: (UIScreen.main.bounds.width - 48)/16 * 9)
                            .offset(y: -165)
                            .shadow(color: .black.opacity(0.3), radius: 2, x: 2, y: 0)
                    } else { Image(default_image)
                            .resizable()
                            .frame(width: (UIScreen.main.bounds.width - 48), height: (UIScreen.main.bounds.width - 48)/16 * 9)
                            .offset(y: -165)
                            .shadow(color: .black.opacity(0.3), radius: 2, x: 2, y: 0)
                    }
                }
            }
        }.frame(width: (UIScreen.main.bounds.width - 48), height: (UIScreen.main.bounds.width - 48) * 0.9625)
        
    }
    
}

struct EventCardView_Previews: PreviewProvider {
    static var previews: some View {
        let gospelForum = EventMeta(id: "Gospel Forum", index: 0, values: EventContent(name: "Gospel Forum", location: "Hilton Parsippany, NJ", datesString: "April 21-23, 2023", isHappeningNow: 1, audience: "Open to all", codaName: "gospelForum23" , posterUrl: "https://codahosted.io/docs/t3DP5F4Tol/blobs/bl-RZFCf8klgw/31a44da2c6f406f4a003ec17d6f789b232f9705dc813bf00dc299ee1ef7da22266f711906c17d2a31acb6def58dc8c710550cb0fb2d22d7cb990e97bdc305a563bf32b0734647be30c430a38858b129b12f9e1d66861e279e034da0701a4ce2b22f490d9", detailedViewBannerUrl: "https://codahosted.io/docs/t3DP5F4Tol/blobs/bl--EJLBQhYZ3/6bf1018f29524ece9e915356f446b0195dabb0453b4327dbbcabfd6bdd656fee7a468387b683793e58e8063a77b0e6d0e3bf89e8b133b089d289a1e13c1d7833be1ef9399c9939d4028a9b4940bc63a5c3cde8d2b64e028c62df02640a20edc4683aa9f0", audiencePills: "Students,Public"))
        EventCardView(event: gospelForum)
    }
}
