//
//  MainView.swift
//  Rooted
//
//  Created by Christopher Woods on 4/18/24.
//

import SwiftUI
import _SpriteKit_SwiftUI

struct MainView: View {
    @EnvironmentObject var user: User
    @State var isShowing: Bool = false
    @State var isRaining: Bool = false
    var myPlants: [String] = ["root1","root2","root3","root4","root5","root6","root7","root8","root9"]
    
    @State var currentPlantIndex: Int = 0
    @State var plantPadding: CGFloat = 0
    var body: some View {
        ZStack{
            Color(.backgroundBrown).ignoresSafeArea()
            VStack(spacing:0){
                VStack{
                    HStack{
                        Text("R O O T E D")
                            .font(Font.custom("OriyaSangamMN-Bold", size: 30))
                            .foregroundStyle(Color("fontColor"))
                            .padding(.top,15)
                            
                    }
                    
                    VStack{
                        HStack(spacing: 85){
                            Image("wateringCan")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40)
                                .onTapGesture {
                                    if user.completedTasksAmount * 10 >= 100{
                                        withAnimation(.linear(duration: 2)) {
                                            isRaining = true
                                        }
                                        
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                                            withAnimation(.linear(duration: 1)) {
                                                isRaining = false
                                            }
                                            
                                        }
                                    }
                                }
                            Image("bag")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30)
                                .padding(.bottom, 10)
                                .onTapGesture{
                                    currentPlantIndex += 1
                                
                                }
                            Image("leaf")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 35)
                                .onTapGesture{
                                    if user.completedTasksAmount * 10 >= 300{
                                        user.completedPlants.append(user.completedTasks)
                                        user.completedTasks = []
                                        user.completedTasksAmount = 0
                                        user.save()
                                        currentPlantIndex = 0
                                    }
                                }
                        }.padding(.bottom, 5)
                        ZStack (alignment: .leading){
                            Rectangle()
                                .frame(width: 300, height: 20)
                                .cornerRadius(20)
                                .foregroundStyle(Color(.bar))
                            
                            Rectangle()
                                .frame(width: min(CGFloat(user.completedTasksAmount * 10), 300), height: 20)
                                .cornerRadius(20)
                                .foregroundStyle(.green)
                            
                        }
                        
                    }
                    .padding()
                    .overlay(
                        
                        HStack(spacing: 100) {
                            Rectangle()
                                .frame(width: 4, height: 23)
                                .foregroundColor(.white)
                            Rectangle()
                                .frame(width: 4, height: 23)
                                .foregroundColor(.white)
                        }.padding(.top, 51)
                    )
                    Spacer()
                   
                    ZStack{
                        Image(myPlants[currentPlantIndex])
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.width + 10)
                            .padding(0)
                            
                            .onTapGesture{
                                isShowing = true
                                print(user.completedTasksAmount)
                            }
                        
                    }
                    
                }
                //            Text("Youve completed \(user.completedTasks) tasks")
               
                
                
            }
            
            if isShowing{
                CompletedTasksView(isShowing: $isShowing, whatTasks: user.completedTasks).environmentObject(User())
            }
            if isRaining{
            GeometryReader{_ in
                SpriteView(scene: RainFall(), options:[.allowsTransparency])
                    .ignoresSafeArea()
                
            }
                
                
        }

        }.ignoresSafeArea(edges: .bottom).onAppear(){

            if user.completedTasksAmount < 2{
                currentPlantIndex = 1
            }
            if user.completedTasksAmount >= 2 && user.completedTasksAmount < 5{
                currentPlantIndex = 2
                
            }
            if user.completedTasksAmount >= 5 && user.completedTasksAmount < 10{
                currentPlantIndex = 3
                
                
            }
            if user.completedTasksAmount >= 10 && user.completedTasksAmount < 15{
                currentPlantIndex = 4
                plantPadding = 2
                
            }
            if user.completedTasksAmount >= 15 && user.completedTasksAmount < 18{
                currentPlantIndex = 5
                plantPadding = 10
            }
            if user.completedTasksAmount >= 18 && user.completedTasksAmount <= 20{
                currentPlantIndex = 6
                plantPadding = 18
            }
            if user.completedTasksAmount >= 25 && user.completedTasksAmount < 27{
                currentPlantIndex = 7
                plantPadding = 23
            }
            if user.completedTasksAmount >= 27{
                currentPlantIndex = 8
                plantPadding = 8
            }
            
            
        }
    }
}

#Preview {
    MainView().environmentObject(User())
}
