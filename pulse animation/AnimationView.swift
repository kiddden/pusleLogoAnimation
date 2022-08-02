import SwiftUI

struct AnimationView: View {
    
    @State private var presentedTab = Tabs.startTab
    
    var body: some View {
        TabView(selection: $presentedTab) {
            VStack {
                Button(action: {
                    withAnimation { self.presentedTab = .animationTab }
                }, label: {
                    Text("Show animation")
                        .padding()
                        .font(.title)
                        .foregroundColor(.white)
                        .background(Color(.systemIndigo))
                        .cornerRadius(32)
                })
            }.tag(Tabs.startTab)
            
            PulseAnimation(imageName: "heart.circle", animationDuration: 4)
                .tag(Tabs.animationTab)
        }
        .ignoresSafeArea()
        .tabViewStyle(.page(indexDisplayMode: .always))
        .indexViewStyle(.page(backgroundDisplayMode: .always))
    }
    
    private enum Tabs {
        case startTab, animationTab
    }
}

struct AnimationView_Previews: PreviewProvider {
    static var previews: some View {
        AnimationView()
    }
}
