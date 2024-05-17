import SwiftUI
import _SpriteKit_SwiftUI


struct ContentView: View {
    
    @State private var selectedTabIndex = 1
    @StateObject var user = User()
    
    
    
    var body: some View {
        
            NavigationStack{
                VStack{
                    NavigationLink{
                        MainView()
                            .environmentObject(user)
                      
                    } label: {
                        ZStack{
                            RoundedRectangle(cornerRadius: 9.0)
                                .foregroundStyle(.mainScreenButton)
                                .frame(width: 300, height: 100)
                                .shadow(color: .black, radius: 4, y: 2)
                                .padding()
                            VStack(spacing: 0){
                                Image("wateringCan")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 45)
                                Text("Your Plant")
                                    .font(Font.custom("OriyaSangamMN-Bold", size: 30))
                                    .font(.title)
                                    .underline()
                                    .foregroundStyle(.mainGreen)
                            }
                        }
                        
                        
                    }
                    
                    NavigationLink{
                        TaskMenuView(currentTask: Task(name: "Drink more water", bio:
                                                        "today is the day you go and drink more water do it today right now", type: 12)).environmentObject(user)
                    } label: {
                        ZStack{
                        RoundedRectangle(cornerRadius: 9.0)
                            .foregroundStyle(.mainScreenButton)
                            .frame(width: 300, height: 100)
                            .shadow(color: .black, radius: 4, y: 2)
                            .padding()
                        VStack(spacing: 0){
                            Image("sun")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 45)
                            Text("Your Goals")
                                .font(Font.custom("OriyaSangamMN-Bold", size: 30))
                                .font(.title)
                                .underline()
                                .foregroundStyle(.mainGreen)
                        }
                    }
                        
                    }
                    
                    NavigationLink{
                        CollectionView().environmentObject(user)
                    } label:{
                        ZStack{
                        RoundedRectangle(cornerRadius: 9.0)
                            .foregroundStyle(.mainScreenButton)
                            .frame(width: 300, height: 100)
                            .shadow(color: .black, radius: 4, y: 2)
                            .padding()
                        VStack(spacing: 0){
                            Image("leaf")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 45)
                            Text("Your Achievements")
                                .font(Font.custom("OriyaSangamMN-Bold", size: 30))
                                .font(.title)
                                .underline()
                                .foregroundStyle(.mainGreen)
                        }
                    }
                    }
                    
                    
//                    Circle().frame(width:100)
//                        .onTapGesture{
//                            user.completedTasksAmount = 0
//                            user.completedTasks = []
//                            user.completedPlants = []
//                            user.myTasks = []
//                            user.onBoarding = false
//                            user.save()
//                            
//                            
//                        }
                    
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.backgroundBrown)
            
            }.onAppear(){
                if user.onBoarding != true{
                    user.myTasks.append(Task(name: "Click Me!", bio: "Welcome to Rooted! You completed your first task. Hit Complete and check your plants progress!", type: 2))
                    user.myTasks.append(Task(name: "Add a Goal!", bio: "Welcome to Rooted! You completed your first task. Try adding new task with the plus button!", type: 2))
                    user.myTasks.append(Task(name: "Complete Plant!", bio: "This is a freebie. Complete this task and go check on your plant. It is ready to be potted. Click the leaf Icon and see your plant in the you achievements section!", type: 2))
                    user.onBoarding = true
                    user.save()
                }
            }
            
    }
}


#Preview {
    ContentView()
}




//struct ContentView: View {
//    
//    @State private var selectedTabIndex = 1
//    @StateObject var user = User()
//    
//    
//    
//    var body: some View {
//        ZStack{
//            Color(.backgroundBrown).ignoresSafeArea()
//            
//            TabView(selection: $selectedTabIndex) {
//                CollectionView()
//                    .environmentObject(user)
//                    .tag(0)
//                
//                MainView()
//                    .environmentObject(user)
//                    .tag(1)
//                    .ignoresSafeArea()
//                
//                TaskMenuView(currentTask: Task(name: "Drink more water", bio:
//                                                "today is the day you go and drink more water do it today right now", type: 12))
//                .environmentObject(user)
//                .tag(2)
//            }
//            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
//            .overlay(
//                HStack(spacing: 20) {
//                    ForEach(0..<3, id: \.self) { index in
//                        Circle()
//                            .foregroundColor(index == selectedTabIndex ? .blue : .gray)
//                            .frame(width: 8, height: 8)
//                            .scaleEffect(index == selectedTabIndex ? 1.2 : 1)
//                            .animation(.spring, value: 1)
//                        
//                    }
//                }
//                    .padding(.bottom, 20)
//                    .padding(.horizontal, 40)
//                , alignment: .bottom
//            )
//        }
//    }
//}
//
//
//#Preview {
//    ContentView()
//}
