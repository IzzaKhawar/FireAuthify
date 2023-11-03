//
//  Background1.swift
//  FirebaseAnalytics
//
//  Created by apple on 11/3/23.
//

import SwiftUI



struct Background1: View {
    var body: some View {
        let opaqueColor = Color(#colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0))
        let myColor4 = Color(#colorLiteral(red: 0.004859850742, green: 0.09608627111, blue: 0.5749928951, alpha: 1))

        VStack{
            ZStack{
                HStack(alignment: .bottom , spacing: 20){
                    
                    Rectangle()
                        .fill(myColor4)
                        .frame(
                            width: 14 ,
                            height: 30 ,
                            alignment: .trailing
                        )
                    
                    
                    
                    
                    Rectangle()
                        .fill(myColor4)
                        .frame(
                            width: 14 ,
                            height: 50 ,
                            alignment: .trailing
                            
                        )
                        .accentColor(myColor4)
                    
                    
                    Rectangle()
                        .fill(myColor4)
                        .frame(
                            width: 14 ,
                            height: 70 ,
                            alignment: .trailing
                        )
                        .accentColor(myColor4)
                    
                    
                    Rectangle()
                        .fill(myColor4)
                        .frame(
                            width: 14 ,
                            height: 90 ,
                            alignment: .trailing
                            
                        )
                    
                    
                    Rectangle()
                        .fill(myColor4)
                        .frame(
                            width: 14 ,
                            height: 110 ,
                            alignment: .trailing
                            
                        )
                        .accentColor(myColor4)
                    
                    
                    
                }
                .padding(.top, 20.0)
                
                HStack(alignment: .bottom , spacing: 19.0){
                    
                    Rectangle()
                        .fill(opaqueColor)
                        .frame(
                            width: 14 ,
                            height: 30 ,
                            alignment: .trailing
                        )
                        .border(Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/2)
                    
                    
                    
                    
                    Rectangle()
                        .fill(opaqueColor)
                        .frame(
                            width: 14 ,
                            height: 50 ,
                            alignment: .trailing
                            
                        )
                        .border(Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/2)
                    
                    
                    Rectangle()
                        .fill(opaqueColor)
                        .frame(
                            width: 14 ,
                            height: 70 ,
                            alignment: .trailing
                        )
                        .border(Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/2)
                    
                    
                    Rectangle()
                        .fill(opaqueColor)
                        .frame(
                            width: 14 ,
                            height: 90 ,
                            alignment: .trailing
                            
                        )
                        .border(Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/2)
                    
                    
                    Rectangle()
                        .fill(opaqueColor)
                        .frame(
                            width: 14 ,
                            height: 110 ,
                            alignment: .trailing
                            
                        )
                        .border(Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/2)
                    
                    
                    
                }
                .padding(.trailing, 12.0)
                .foregroundColor(/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/)
            }
            
            Text("Firebase Analytics.")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(myColor4)
                .dynamicTypeSize(.accessibility1)
            Text("Firebase Practice Project")
                .font(.title3)
                .foregroundColor(myColor4)
        }
        
    }
    
    
}


#Preview {
    Background1()
}
