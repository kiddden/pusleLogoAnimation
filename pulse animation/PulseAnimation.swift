import SwiftUI

struct PulseAnimation: View {
    
    var imageName: String
    var imageSize: CGFloat
    var animationDuration: CGFloat
    @State private var startAnimation = false
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: imageSize / 2)
                .frame(width: imageSize / 2, height: imageSize / 2)
                .foregroundColor(Color(.systemIndigo))
                .scaleEffect(startAnimation ? 4 : 1)
                .opacity(startAnimation ? 0 : 0.6)
                .animation(Animation.easeInOut(duration: animationDuration).repeatForever(autoreverses: false), value: startAnimation)
            Circle()
                .stroke(lineWidth: imageSize / 2)
                .frame(width: imageSize / 1.9, height: imageSize / 1.9)
                .foregroundColor(Color(.systemIndigo))
                .scaleEffect(startAnimation ? 3 : 1)
                .opacity(startAnimation ? 0 : 0.7)
                .animation(Animation.easeInOut(duration: animationDuration).repeatForever(autoreverses: false).delay(0.5), value: startAnimation)
            Circle()
                .stroke(lineWidth: imageSize / 2)
                .frame(width: imageSize / 1.7, height: imageSize / 1.7)
                .foregroundColor(Color(.systemIndigo))
                .scaleEffect(startAnimation ? 2 : 1)
                .opacity(startAnimation ? 0 : 0.8)
                .animation(Animation.easeInOut(duration: animationDuration).repeatForever(autoreverses: false).delay(1), value: startAnimation)
            Image(systemName: imageName)
                .resizable()
                .frame(width: imageSize, height: imageSize)
            // MARK: - The next two lines should be removed if your image background is not transparent.
                .background(Color(.systemIndigo))
                .cornerRadius(100)
            // MARK: -
                .scaleEffect(startAnimation ? 1.2 : 1)
                .animation(Animation.easeInOut(duration: animationDuration / 2).repeatForever(autoreverses: true), value: startAnimation)
                .shadow(radius: 35)
                .onAppear {
                    withAnimation {
                        self.startAnimation = true
                    }
                }
        }
        .scaleEffect(startAnimation ? 1 : 0)
        .animation(.spring().speed(0.5), value: startAnimation)
    }
}

struct PulseAnimation_Previews: PreviewProvider {
    static var previews: some View {
        PulseAnimation(imageName: "heart.circle", imageSize: 152, animationDuration: 4)
    }
}
