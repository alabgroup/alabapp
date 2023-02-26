//
//  ContentView.swift
//  Church App
//
//  Created by Kirsty Ihenetu on 2/23/23.
//

import SwiftUI

struct ContactView: View {
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
                HStack {
                    Image(systemName: "message")
                        .foregroundColor(.black)
                    Text("Chat")
                        .font(.subheadline)
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
    
