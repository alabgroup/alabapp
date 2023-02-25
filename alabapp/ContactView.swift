//
//  ContentView.swift
//  Church App
//
//  Created by Kirsty Ihenetu on 2/23/23.
//

import SwiftUI

struct ContactView: View {
    var body: some View {
        VStack(alignment: .leading){
            Text("Contact")
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 10)
                Divider()
            HStack{
                Image(systemName: "message")
                    .foregroundColor(.black)
                Text("Chat")
                    .font(.subheadline)
                Image(systemName: "envelope")
                    .foregroundColor(.black)
                Text("Email")
                    .font(.subheadline)
                Image(systemName:"phone")
                    .foregroundColor(.black)
                Text("Phone")
                    .font(.subheadline)
            }
            
        }
        .padding()
    }
}
    
    
    struct Previews_ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContactView();
        }
    }
    
