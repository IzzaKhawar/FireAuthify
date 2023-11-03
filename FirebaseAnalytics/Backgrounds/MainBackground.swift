//
//  MainBackground.swift
//  FirebaseAnalytics
//
//  Created by apple on 11/3/23.
//


import SwiftUI

struct MainBackground: View {
    var body: some View {
        let myColor1 = Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        let myColor2 = Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))
        let myColor3 = Color(#colorLiteral(red: 0, green: 0.3285208941, blue: 0.5748849511, alpha: 1))
        let myColor4 = Color(#colorLiteral(red: 0.004859850742, green: 0.09608627111, blue: 0.5749928951, alpha: 1))
        
        
        ZStack(alignment: .bottom, content: {
            
            
            Rectangle()
                .fill(
                    LinearGradient(
                        colors: [Color.white , myColor4],
                        startPoint: .top,
                        endPoint: .bottom))
            
                .frame(
                    width: 600,
                    height: 400,
                    alignment: .bottom
                )
            VStack{
                Rectangle()
                    .fill(Color.white)
                
                    .frame(
                        width: 600,
                        height: 380
                        ,
                        alignment: .bottom
                    )
                Rectangle()
                    .fill(myColor4)
                
                    .frame(
                        width: 600,
                        height: 390,
                        alignment: .bottom)
            }
            
            Ellipse()
                .trim(from: 0.5 ,to: 1.0)
                .fill(myColor1)
                .padding(.top, 20.0)
                .frame(
                    width: 500,
                    height: 500,
                    alignment:.bottomLeading
                    
                )
                .opacity(8)
            Ellipse()
            
                .trim(from: 0.5 ,to: 1.0)
                .fill(myColor2)
                .padding(.top, 110.0)
                .frame(
                    width: 500,
                    height: 500,
                    alignment:.bottomLeading
                    
                )
            
            Ellipse()
            
                .trim(from: 0.5 ,to: 1.0)
                .fill(myColor3)
                .padding(.top, 190.0)
                .frame(
                    width: 500,
                    height: 500,
                    alignment:.bottomLeading
                    
                )
            Ellipse()
            
                .trim(from: 0.5 ,to: 1.0)
                .fill(myColor4)
                .padding(.top, 310.0)
                .frame(
                    width: 500,
                    height: 500
                )
            
            
            
        })
        
        
        
        
        .padding(.top, 50.0)
//        .(if #available(iOS 16.0, *) {
//            scrollContentBackground(.automatic)
//        } else {
//            // Fallback on earlier versions
//        })
//        
        
        
        
    }
}

#Preview{
        MainBackground()
    }

