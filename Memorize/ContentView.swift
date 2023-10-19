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
            CardView()
            CardView()
        }
        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
        .padding()
    }
}


struct CardView: View{
    @State var isFaceup:Bool = false; //var for isfaceup: need to changed, let for base: does not change
    //@State is for line38 where view can not be changed
    var body: some View{
        
        ZStack {
            let base = RoundedRectangle(cornerRadius:25)
            //type inference: let base: RoundedRectangle = RoundedRectangle(cornerRadius:25)
            if isFaceup{
                base.foregroundColor(.white)
                base.strokeBorder(style: StrokeStyle(lineWidth: 10, dash:[10,2]))
                Text("😩").font(.largeTitle)
            }else{
                base.fill()
            }
        }.onTapGesture(count: 2) {
            isFaceup.toggle()
            
        }
        
    }
}
#Preview {
    ContentView()
}
