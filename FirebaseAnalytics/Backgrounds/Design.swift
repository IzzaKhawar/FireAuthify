//
//  Design.swift
//  DataMe
//
//  Created by apple on 9/8/23.
//

import SwiftUI

struct Design: View {
    var body: some View {
        let myColor4 = Color(#colorLiteral(red: 0.004859850742, green: 0.09608627111, blue: 0.5749928951, alpha: 1))
        let opaqueColor = Color(#colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 0))
        
        
        Group{
            HStack{
                VStack{
                    ZStack{
                        Rectangle()
                            .fill(opaqueColor)
                        Circle()
                        
                            .fill(Color.blue)
                            .frame(
                                width: 20, height: 20, alignment: .topLeading)
                            .padding([.bottom, .trailing], 60.0)
                    }
                    ZStack{
                        Rectangle()
                            .fill(opaqueColor)
                        Circle()
                            .stroke(myColor4, style: StrokeStyle(lineWidth: 4)
                            )
                            .frame(
                                width: 14, height: 20, alignment: .bottomTrailing)
                            .padding(.top, 50.0)
                        
                    }
                    ZStack{
                        Rectangle()
                            .fill(opaqueColor)
                        Rectangle()
                        
                            .fill(Color.white)
                            .frame(
                                width: 8, height: 26, alignment: .bottomLeading)
                            .padding([.top, .leading], 60.0)
                    }
                    ZStack{
                        Rectangle()
                            .fill(opaqueColor)
                        Circle()
                        
                            .fill(myColor4)
                            .frame(
                                width: 12, height: 16, alignment: .bottomTrailing)
                            .padding(/*@START_MENU_TOKEN@*/[.bottom, .trailing], 60.0/*@END_MENU_TOKEN@*/)
                        
                    }
                    ZStack{
                        Rectangle()
                            .fill(opaqueColor)
                        Rectangle()
                            .stroke(Color.blue, style: StrokeStyle(lineWidth: 4)
                            )
                            .frame(
                                width: 10, height: 10, alignment: .centerFirstTextBaseline)
                            .padding(/*@START_MENU_TOKEN@*/[.leading, .bottom], 60.0/*@END_MENU_TOKEN@*/)
                        
                        
                    }
                }
                VStack{
                    ZStack{
                        Rectangle()
                            .fill(opaqueColor)
                        
                    }
                    ZStack{
                        Rectangle()
                            .fill(opaqueColor)
                        Rectangle()
                            .stroke(myColor4, style: StrokeStyle(lineWidth: 4)
                            )
                            .frame(
                                width: 10, height: 6, alignment: .centerFirstTextBaseline)
                            .padding(/*@START_MENU_TOKEN@*/[.top, .leading], 90.0/*@END_MENU_TOKEN@*/)
                        
                    }
                    ZStack{
                        Rectangle()
                            .fill(opaqueColor)
                        
                    }
                    ZStack{
                        Rectangle()
                            .fill(opaqueColor)
                        Circle()
                            .stroke(Color.white, style: StrokeStyle(lineWidth: 4)
                            )
                            .frame(
                                width: 20, height: 20, alignment: .bottomTrailing)
                            .padding([.top, .leading], 90.0)
                        
                        
                    }
                    ZStack{
                        Rectangle()
                            .fill(opaqueColor)
                        
                        
                        
                    }
                    
                    
                }
                
                VStack{
                    ZStack{
                        Rectangle()
                            .fill(opaqueColor)
                        Rectangle()
                        
                            .fill(myColor4)
                            .frame(
                                width: 30, height: 10, alignment: .top)
                            .padding([.leading, .bottom], 60.0)
                        
                    }
                    ZStack{
                        Rectangle()
                            .fill(opaqueColor)
                        Circle()
                            .stroke(Color.blue, style: StrokeStyle(lineWidth: 4)
                            )
                            .frame(
                                width: 14, height: 14, alignment: .centerFirstTextBaseline)
                            .padding([.top, .leading], 90.0)
                        
                    }
                    ZStack{
                        Rectangle()
                            .fill(opaqueColor)
                        Circle()
                        
                            .fill(myColor4)
                            .frame(
                                width: 12, height: 12, alignment: .bottomTrailing)
                            .padding(/*@START_MENU_TOKEN@*/.top, 90.0/*@END_MENU_TOKEN@*/)
                        
                    }
                    ZStack{
                        Rectangle()
                            .fill(opaqueColor)
                        Rectangle()
                            .fill(Color.white)
                            .frame(
                                width: 16, height: 16, alignment: .bottomLeading)
                            .padding(/*@START_MENU_TOKEN@*/[.leading, .bottom], 80.0/*@END_MENU_TOKEN@*/)
                        
                        
                    }
                    ZStack{
                        Rectangle()
                            .fill(opaqueColor)
                        Circle()
                        
                            .fill(Color.white)
                            .frame(
                                width: 14, height: 20, alignment: .bottomTrailing)
                            .padding([.top, .leading], 60.0)
                        
                        
                        
                        
                    }
                    
                }
                
                
            }
            .padding(.all, 20.0)
            
            
        }
            
            
        }
}

#Preview {
        Design()
    }

