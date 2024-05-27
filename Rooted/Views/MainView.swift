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
    @State var isFinished: Bool = false
    @State var isFert: Bool = false
    @State var showingAlert = false
    @State var randomAffirm: String = ""
    @State var multiplier: Int = 1
    var myPlants: [String] = ["root1","root2","root3","root4","root5","root6","root7","root8","root9"]
    
    @State var currentPlantIndex: Int = 0
    @State var plantPadding: CGFloat = 0
    var body: some View {
        NavigationStack{
        ZStack(){
            Color(.backgroundBrown).ignoresSafeArea()
            VStack(spacing:0){
                VStack{
                    ZStack{
                        HStack{
                            Text("R O O T E D")
                                .font(Font.custom("OriyaSangamMN-Bold", size: 30))
                                .foregroundStyle(Color("fontColor"))
                                .padding(.top,15)
                            
                        }
                    }
                   
                    VStack{
                        HStack(spacing: 85){
                            Image("wateringCan")
                                .resizable()
                                .brightness(user.completedTasksAmount * 10 >= 100 ? 0 : -0.5)
                                .scaledToFit()
                                .frame(width: 40)
                                .onTapGesture {
                                    if user.completedTasksAmount * 10 >= 100{
                                        withAnimation(.linear(duration: 2)) {
                                            isRaining = true
                                        }
                                        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                                            withAnimation(.linear(duration: 1)) {
                                                isRaining = false
                                            }
                                            
                                        }
                                    }
                                }
                            Image("bag")
                                .resizable()
                                .brightness(user.completedTasksAmount * 10 >= 200 ? 0 : -0.5)
                                .scaledToFit()
                                .frame(width: 30)
                                .padding(.bottom, 10)
                                .onTapGesture{
                                    
                                    if user.completedTasksAmount * 10 >= 200{
                                        withAnimation(.linear(duration: 2)) {
                                            isFert = true
                                        }
                                        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                                            withAnimation(.linear(duration: 1)) {
                                                isFert = false
                                            }
                                            
                                        }
                                    }
                                    
                                
                                }
                            Image("leaf")
                                .resizable()
                                .brightness(user.completedTasksAmount * 10 >= 300 ? 0 : -0.5)
                                .scaledToFit()
                                .frame(width: 35)
                                .onTapGesture{
                                    
                                    
                                    if user.completedTasksAmount * 10 >= 300{
                                        withAnimation(.linear(duration: 2)) {
                                            isFinished = true
                                        }
                                        UIImpactFeedbackGenerator(style: .heavy).impactOccurred()
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                                            withAnimation(.linear(duration: 1)) {
                                                isFinished = false
                                                user.completedPlants.append(user.completedTasks)
                                                user.completedTasks = []
                                                user.completedTasksAmount = 0
                                                user.save()
                                                currentPlantIndex = 0
                                                if user.completedPlants.count == 0{
                                                    multiplier = 10
                                                }
                                                if user.completedPlants.count == 1{
                                                    multiplier = 5
                                                }
                                                if user.completedPlants.count == 2{
                                                    multiplier = 3
                                                }
                                                if user.completedPlants.count == 3{
                                                    multiplier = 1
                                                }

                                            }
                                            
                                        }
                                        
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
                                
                            
                            
                        }.onTapGesture {
                            showingAlert.toggle()
                        }
                        
                    }
                    .padding(.vertical, 10)
                    Text(randomAffirm)
                        .foregroundStyle(.mainGreen)
                        .font(Font.custom("OriyaSangamMN-Bold", size: 26))
                        
                    
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 10)
                        .padding(.top, 15)
//                    .overlay(
//                        
//                        HStack(spacing: 100) {
//                            Rectangle()
//                                .frame(width: 4, height: 23)
//                                .foregroundColor(.white)
//                            Rectangle()
//                                .frame(width: 4, height: 23)
//                                .foregroundColor(.white)
//                        }.padding(.top, 51)
//                    )
                    Spacer()
                   
                    ZStack{
                        Image(myPlants[currentPlantIndex])
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.width + 10)
                            .padding(0)
                            
                            .onTapGesture{
                                if user.completedTasks.count > 1{
                                    isShowing = true
                                    print(user.completedTasksAmount)
                                }
                            }
                            .overlay{
                                VStack{
                                    HStack{
                                        Image("bag")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 120)
                                            .rotationEffect(.degrees(100))
                                            .padding(40)
                                        Spacer()
                                    }
                                    Spacer().frame(height: 120)
                                }.opacity(isFert ? 1.0 : 0)
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
            if isFinished{
                GeometryReader{_ in
                    SpriteView(scene: MagicFall(), options:[.allowsTransparency])
                        .ignoresSafeArea()
                    
                }
            }
            if isFert{
                GeometryReader{_ in
                    SpriteView(scene: SmokeFall(), options:[.allowsTransparency])
                        .ignoresSafeArea()
                    
                }
            }
            VStack {
                Spacer()
                
                
                HStack{
                    NavigationLink{CollectionView().environmentObject(user)} label: {
                        Image(systemName: "trophy")
                            .font(.title.weight(.semibold))
                            .padding()
                            .background(.button)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                            .shadow(radius: 4, x: 0, y: 4).padding(25)
                    }
                    Spacer()
                    NavigationLink{TaskMenuView(currentTask: Task(name: "Drink more water", bio:
                                                                    "today is the day you go and drink more water do it today right now", type: 12)).environmentObject(user)} label: {
                        Image(systemName: "plus")
                            .font(.title.weight(.semibold))
                            .padding()
                            .background(.button)
                            .foregroundColor(.white)
                            .clipShape(Circle())
                            .shadow(radius: 4, x: 0, y: 4).padding(25)
                    }
                    
                    
                }
            }


        }.ignoresSafeArea(edges: .bottom).onAppear(){
            randomAffirm = myAffirms.randomElement() ?? ""
            
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
            if user.completedPlants.count == 0{
                multiplier = 10
            }
            if user.completedPlants.count == 1{
                multiplier = 5
            }
            if user.completedPlants.count == 2{
                multiplier = 3
            }
            if user.completedPlants.count == 3{
                multiplier = 1
            }
        }
            
        }.alert("\((30 - user.completedTasksAmount) / multiplier) more goals to go!", isPresented: $showingAlert) {
            Button("OK", role: .cancel) { }
        }
    }
}

#Preview {
    MainView().environmentObject(User())
}
