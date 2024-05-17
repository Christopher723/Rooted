import SwiftUI

struct FallingDirtAnimation: View {
    @State private var offsetY: CGFloat = 0
    @State private var opacity: Double = 0
    
    var body: some View {
        ZStack {
            // Background
            Color.green.edgesIgnoringSafeArea(.all)
            
            // Ground
            Rectangle()
                .fill(Color(red: 139/255, green: 69/255, blue: 19/255))
                .frame(width: 300, height: 50)
                .offset(y: 100)
            
            // Falling dirt
            Circle()
                .fill(Color(red: 139/255, green: 69/255, blue: 19/255))
                .frame(width: 20, height: 20)
                .offset(y: offsetY)
                .opacity(opacity)
                .onAppear {
                    withAnimation(Animation.linear(duration: 1.5)) {
                        self.offsetY = 150
                        self.opacity = 1
                    }
                }
        }
    }
}

struct FallingDirtAnimation_Previews: PreviewProvider {
    static var previews: some View {
        FallingDirtAnimation()
    }
}
