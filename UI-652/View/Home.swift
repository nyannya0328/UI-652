//
//  Home.swift
//  UI-652
//
//  Created by nyannyan0328 on 2022/08/25.
//

import SwiftUI

struct Home: View {
    @State var showDetail : Bool = false
    @State var selectedCard : Card?
    
    @State var showDetailContent : Bool = false
    @State var showExpence : Bool = false
      @Namespace var animation
    @State var cards : [Card] = [
    
        .init(cardImage: "Card1"),
        .init(cardImage: "Card2"),
    
    ]
    var body: some View {
        VStack{
            
            
                VStack(alignment:.leading,spacing: 10){
                    
                    
                       Text("Welcom Back,")
                           .font(.largeTitle.weight(.semibold))
                       
                       Text("Girl")
                           .font(.title3)
                           .foregroundColor(.gray)
                    
                    
                    
                    
                }
                  .frame(maxWidth: .infinity,alignment: .leading)
                  .overlay(alignment:.trailing){
                      
                      
                      Image("Pic")
                          .resizable()
                          .aspectRatio(contentMode: .fill)
                          .frame(width: 50,height: 50)
                          .clipShape(Circle())
                      
                  }
                
                
        
                
                
        
            .padding(15)
            
            VStack(alignment:.leading,spacing: 10){
                
                Text("Total Balance,")
                    .font(.caption.weight(.semibold))
                
                Text("19.999.999")
                    .foregroundColor(.white)
                
            }
            .padding(15)
            .padding(.top,10)
            .frame(maxWidth: .infinity,alignment: .leading)
            
            
            CardScrollView()
            
            
            
            
        }
        .opacity(showDetail ? 0 : 1)
        .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .top)
        .background{
         
            Color("BG").ignoresSafeArea()
        }
        .overlay {
            
            if let selectedCard,showDetail{
                
                
                DetailView(card: selectedCard)
                    .transition(.asymmetric(insertion: .identity, removal: .offset(y:1)))
            }
            
            
        }
    }
    @ViewBuilder
    func CardScrollView()->some View{
     
        ScrollView(.horizontal,showsIndicators: false){
            
            HStack(spacing:15){
                
                
                ForEach(cards){card in
                    
                    GeometryReader{proxy in
                        
                         let size = proxy.size
                        
                        if selectedCard?.id == card.id && showDetail{
                            
                            Rectangle()
                                .fill(.clear)
                                .frame(width: size.width,height: size.height)
                            
                            
                        }
                        else{
                            Image(card.cardImage)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .matchedGeometryEffect(id: card.id, in: animation)
                                .rotationEffect(.init(degrees: -90))
                                .frame(width: size.height,height: size.width)
                                .frame(width:size.width ,height: size.height)
                                .contentShape(Rectangle())
                                .onTapGesture {
                                    
                                    
                                    withAnimation(.interactiveSpring(response: 0.7,dampingFraction: 0.7,blendDuration: 0.7)){
                                        
                                        selectedCard = card
                                        showDetail = true
                                    }
                                }
                            
                            
                        }
                        
                        
                        
                    }
                    .frame(width:300)
               
                    
                }
                
                
                
    
            }
           
        }
        .padding(15)
        .padding(.leading,20)
        
        
    }
    
    @ViewBuilder
    func DetailView(card : Card)->some View{
        
        VStack{
            
            
            HStack{
                
                Button {
                    
                    withAnimation(.easeInOut(duration: 0.3)){
                        
                        showDetailContent = false
                        showExpence = false
                    }
                    
                    withAnimation(.easeInOut(duration: 0.5).delay(0.01)){
                        
                        showDetail = false
                        
                    }
                    
                } label: {
                    
                    
                    Image(systemName: "xmark")
                       .fontWeight(.black)
                       .foregroundColor(.white)
                    
                   
                }
                Text("BACK")
                    .font(.title2.weight(.semibold))
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity,alignment: .leading)

            }
            .opacity(showDetailContent ? 1 : 0)
            Image(card.cardImage)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .matchedGeometryEffect(id: card.id, in: animation)
                .rotationEffect(.init(degrees: showDetailContent ? 0 : -90))
                .frame(height:220)
            
            ExpenceView()
          
        }
        .padding(15)
    
        .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .top)
        .onAppear{
            
            withAnimation(.easeInOut(duration: 0.5)){
                
                showDetailContent = true
            }
            
            withAnimation(.easeInOut(duration: 0.5)){
                
                showExpence = true
            }
        }
        
    }
    
    @ViewBuilder
    func ExpenceView()->some View{
        
        
        GeometryReader{proxy in
         
             let size = proxy.size
            
            ScrollView(.vertical,showsIndicators: false){
                
                VStack(spacing:10){
                    
                    ForEach(Expences){expense in
                        
                        ExpencseCardView(expense: expense)
                        
                    }
                }
                .padding()
            }
            .frame(width: size.width,height: size.height)
            .background{
             
                RoundedRectangle(cornerRadius: 10,style: .continuous)
                    .fill(.white)
            }
            .offset(y:showExpence ? 0 : size.height + 50)
            
            
        }
        .padding(.top)
        .padding(.horizontal,10)
   
        
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ExpencseCardView : View{
    
    var expense : Expence
    
    @State var showView : Bool = false
    
    var body: some View{
        
        HStack{
            
            
            Image(expense.productIcon)
                .resizable()
                .aspectRatio(contentMode: .fit)
             .frame(width: 45,height: 45)
            
            
            VStack(alignment:.leading,spacing: 10){
                
             
                Text(expense.product)
                    .fontWeight(.bold)
                
                Text(expense.spendType)
                    .font(.caption)
                    .foregroundColor(.gray)
                
            }
              .frame(maxWidth: .infinity,alignment: .leading)
            
            
            
            VStack(alignment:.leading,spacing: 10){
                
             
                Text(expense.amountSpent)
                    .bold()
                
                Text(Date().formatted(date: .numeric, time: .omitted))
                    .font(.caption)
                    .foregroundColor(.gray)
                
            }
   
            
            
            
            
            
            
        }
        .foregroundColor(.black)
        .opacity(showView ? 1 : 0)
        .offset(y : showView ? 0 : 20)
        .onAppear{
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                
                withAnimation(.easeInOut(duration: 0.3).delay(Double(getIndex()) * 0.1)){
                    
                    showView = true
                }
            }
            
            
        }
    }
    func getIndex()->Int{
        
        let index = Expences.firstIndex { CA1 in
            
            return expense.id == CA1.id
        } ?? 0
        
      
        return index < 20 ? index : 20
        
        
    }
}
