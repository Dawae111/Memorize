//
//  ContentView.swift
//  Memorize
//
//  Created by David on 2023/10/18.
//

import SwiftUI

struct ContentView: View { //behaves like a view
    let emoji: Array<String> = ["⚽️","🏀","🏈","⚾️","🥎","🎾","🏐","🏉"]
        
    var body: some View {
        HStack{
            ForEach(emoji.indices, id: \.self){ index in
                CardView(content: emoji[index]);
            }
        }
        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
        .padding()
    }
}


struct CardView: View{
    let content: String
    
    @State var isFaceup:Bool = true; //var for isfaceup: need to changed, let for base: does not change
    //@State is for line38 where view can not be changed
    
    var body: some View{
        
        ZStack {
            let base = RoundedRectangle(cornerRadius:25)
            //type inference: let base: RoundedRectangle = RoundedRectangle(cornerRadius:25)
            if isFaceup{
                base.foregroundColor(.white)
                base.strokeBorder(style: StrokeStyle(lineWidth: 10, dash:[10,2]))
                Text(content).font(.largeTitle)
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
