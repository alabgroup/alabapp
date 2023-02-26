//
//  ContentView.swift
//  Church App
//
//  Created by Kirsty Ihenetu on 2/23/23.
//

import SwiftUI

struct ContactView: View {
    
    // Attempt to open FB Messenger if it is installed in the user's
    // device. Fall back to opening their web browser.
    func openMessenger() {
        guard let messenger = URL(string: "fb-messenger://user-thread/17850417653640456") else { return }
        if UIApplication.shared.canOpenURL(messenger as URL) {
            UIApplication.shared.open(messenger)
        } else {
            let url = URL(string: "https://m.me/alabgrp")
            if UIApplication.shared.canOpenURL(url!) {
                UIApplication.shared.open(url!)
            }
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text("Contact")
                .font(.title)
                .fontWeight(.medium)
                .padding(.bottom, 2)
            Divider()
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
            HStack {
                Spacer()
                Button(action: {openMessenger()}) {
                    HStack {
                        Image("messenger")
                            .resizable()
                            .frame(width: 24, height: 24)
                        Text("Chat")
                            .font(.subheadline)
                    }
                    
                }
                Spacer()
                HStack {
                    Image(systemName: "envelope")
                        .foregroundColor(.black)
                    Text("Email")
                        .font(.subheadline)
                }
                Spacer()
                HStack {
                    Image(systemName: "phone")
                        .foregroundColor(.black)
                    Text("Phone")
                        .font(.subheadline)
                }
                Spacer()
            }
        }
        .frame(width: 325)
    }
}


struct Previews_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContactView();
    }
}

