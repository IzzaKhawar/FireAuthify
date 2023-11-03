//
//  LogInBackground.swift
//  DataMe
//
//  Created by apple on 9/8/23.
//

import SwiftUI

struct LogInBackground: View {
    var body: some View {
        let myColor1 = Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
        let myColor2 = Color(#colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))
        let myColor4 = Color(#colorLiteral(red: 0.004859850742, green: 0.09608627111, blue: 0.5749928951, alpha: 1))
        
        VStack{
            
            
            Circle(
            )
            .fill(Color.blue)
            .frame(width: 700
                   
                   , height: 500
            )
            .padding(.bottom, 100.0)
            .padding(/*@START_MENU_TOKEN@*/.trailing, 500.0/*@END_MENU_TOKEN@*/)
              
            
            
            
            ZStack{
                
                Ellipse()
                    .trim(from: 0.5 ,to: 1.0)
                    .fill(myColor1)
                    .padding(.top, -100.0)
                    .frame(
                        width: 600,
                        height: 900,
                        alignment:.bottomLeading
                        
                    )
                Ellipse()
                    .trim(from: 0.5 ,to: 1.0)
                    .fill(myColor1)
                    .padding(.top, -50.0)
                    .frame(
                        width: 600,
                        height: 900,
                        alignment:.bottomLeading
                        
                    )
                
                Ellipse()
                    .trim(from: 0.5 ,to: 1.0)
                    .fill(myColor2)
                    .padding(.top, -50.0)
                    .frame(
                        width: 600,
                        height: 800,
                        alignment:.bottomLeading
                        
                    )
                    .opacity(8)
                Ellipse()
                
                    .trim(from: 0.5 ,to: 1.0)
                    .fill(myColor4)
                    .padding(.top, 00.0)
                    .frame(
                        width: 600,
                        height: 700,
                        alignment:.bottomLeading
                        
                    )
                
                Ellipse()
                
                    .trim(from: 0.5 ,to: 1.0)
                    .fill(myColor4)
                    .padding(.top, 190.0)
                    .frame(
                        width: 500,
                        height: 500,
                        alignment:.bottomLeading
                        
                    )
                Ellipse()
                
                    .trim(from: 0.5 ,to: 1.0)
                    .fill(myColor4)
                    .padding(.top, 400.0)
                    .frame(
                        width: 500,
                        height: 700
                    )
                
                
                
            }
            
        }

        
        
        
        
    }
}

#Preview{
        LogInBackground()
    }

