//
//  ContentView.swift
//  Memorize
//
//  Created by David on 2023/10/18.
//

import SwiftUI

struct ContentView: View { //behaves like a view\
    var body: some View {
        HStack{
            CardView(isFaceup: true)
            CardView()
        }
        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
        .padding()
    }
}


struct CardView: View{
    var isFaceup:Bool = false;
    var body: some View{
        ZStack {
            if isFaceup{
                RoundedRectangle(cornerRadius: 25)
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                    .strokeBorder(style: StrokeStyle(lineWidth: 10, dash:[10,2]))
                Text("😩").font(.largeTitle)
            }else{
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
            }
        }
    }
}
#Preview {
    ContentView()
}
