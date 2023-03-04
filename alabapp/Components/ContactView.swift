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
    
    // Open the user's email.
    func openMail() {
        let email = "support@alab.org"
        if let url = URL(string: "mailto:\(email)") {
            if #available(iOS 10.0, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    var phoneNumber = "646-948-6900"
    
    // Maybe call Alabaster's phone number.
    func callAlab() {
        let phone = "tel://"
        let phoneNumberFormatted = phone + phoneNumber
        guard let url = URL(string: phoneNumberFormatted) else { return }
        UIApplication.shared.open(url)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text("Contact")
                .font(MyFont.title)
                .foregroundColor(MyFont.black)
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
                            .font(MyFont.caption)
                    }
                    
                }
                Spacer()
                Button(action: {openMail()}){
                    HStack {
                        Image(systemName: "envelope")
                            .foregroundColor(.black)
                        Text("Email")
                            .font(MyFont.caption)
                    }
                    
                }
                Spacer()
                Button (action: {callAlab()}) {
                    HStack {
                        Image(systemName: "phone")
                            .foregroundColor(.black)
                        Text("Phone")
                            .font(MyFont.caption)
                    }
                    
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

