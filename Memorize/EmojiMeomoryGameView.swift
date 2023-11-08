//
//  ContentView.swift
//  Memorize
//
//  Created by David on 2023/10/18.
//

import SwiftUI

struct EmojiMeomoryGameView: View { //behaves like a view
    @ObservedObject var viewModel: EmojiMemoryGame

    var body: some View {
        VStack{
            ScrollView{
                Cards
                    .animation(.default, value: viewModel.cards)
            }
            Button("Shuffle"){
                viewModel.shuffle()
            }
        }
        .padding()
    }
    
    var Cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum:85),spacing: 0)], spacing:0){
            ForEach(viewModel.cards){ card in
                //emoji.indices replace 0..<n
                CardView(card: card)
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
                    .onTapGesture {
                        viewModel.choose(card)
                    }
            }
        }
        .foregroundColor(.pink)
    }
    
}


struct CardView: View{
    //let content: String
    
    //@State var isFaceup:Bool = false; //var for isfaceup: need to changed, let for base: does not change
    //@State is for line38 where view can not be changed
    var card: MemoryGame<String>.Card
    
    var body: some View{
        
        ZStack {
            let base = RoundedRectangle(cornerRadius:25)
            //type inference: let base: RoundedRectangle = RoundedRectangle(cornerRadius:25)
            Group{
                base.foregroundColor(.white)
                base.strokeBorder(style: StrokeStyle(lineWidth: 10, dash:[10,2]))
                Text(card.content).font(.system(size:200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1,contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill().opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
        //.onTapGesture(count: 1) {
        //    isFaceup.toggle()
            
        //}
    }
}
#Preview {
    EmojiMeomoryGameView(viewModel: EmojiMemoryGame())
}
