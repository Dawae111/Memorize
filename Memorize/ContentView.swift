//
//  ContentView.swift
//  Memorize
//
//  Created by David on 2023/10/18.
//

import SwiftUI

struct ContentView: View { //behaves like a view
    let emoji: Array<String> = ["⚽️","🏀","🏈","⚾️","🥎","🎾","🏐","🏉"]
        
    @State var CardCount: Int = 4
    
    var body: some View {
        VStack{
            ScrollView{
                Cards
            }
            Spacer()
            CardCountAdjusters
        }
        .padding()
    }
    
    var Cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum:120))]){
            ForEach(0..<CardCount, id: \.self){ index in
                //emoji.indices replace 0..<n
                CardView(content: emoji[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.pink)
    }
    
    var CardCountAdjusters: some View{
        HStack(spacing:50){
            CardRemover
            //Spacer()
            CardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func CardCountAdjuster(by offset: Int, symbol:String)->some View{
        Button(action:{
            CardCount += offset
        },label: {
            Image(systemName: symbol)
        })
        .disabled(CardCount + offset < 1 || CardCount + offset > emoji.count)
    }
    
    var CardRemover: some View{
        return CardCountAdjuster(by:-1,symbol:"rectangle.stack.badge.minus.fill")
    }
    
    var CardAdder: some View{
        return CardCountAdjuster(by: 1, symbol:"rectangle.stack.badge.plus.fill")
    }
}


struct CardView: View{
    let content: String
    
    @State var isFaceup:Bool = false; //var for isfaceup: need to changed, let for base: does not change
    //@State is for line38 where view can not be changed
    
    var body: some View{
        
        ZStack {
            let base = RoundedRectangle(cornerRadius:25)
            //type inference: let base: RoundedRectangle = RoundedRectangle(cornerRadius:25)
            Group{
                base.foregroundColor(.white)
                base.strokeBorder(style: StrokeStyle(lineWidth: 10, dash:[10,2]))
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceup ? 1 : 0)
            base.fill().opacity(isFaceup ? 0 : 1)
        }.onTapGesture(count: 2) {
            isFaceup.toggle()
            
        }
        
    }
}
#Preview {
    ContentView()
}
