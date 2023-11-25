//
//  NoItemsView.swift
//  TodoList
//
//  Created by Hadid Hardiansyah Saputra on 28/10/23.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    let primaryCustomColor = Color("CustomColor1")
    let secondaryCustomColor = Color("CustomColor2")
    
    var body: some View {
        
//        ScrollView {
            VStack(spacing: 10) {
                Text("There are no items!")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Text("Are you a productive person? I think you should click the ad button and a bunch of items to your todo list!")
                    .padding(.bottom, 20)
                
                NavigationLink {
                    AddView()
                } label: {
                    Text("Add Something✏️")
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(animate ? primaryCustomColor : secondaryCustomColor)
                        .cornerRadius(10)
                }
                .padding(.horizontal, animate ? 30 : 50)
                .shadow(
                    color: animate ? primaryCustomColor.opacity(0.7) : secondaryCustomColor.opacity(0.7),
                    radius: animate ? 30 : 10,
                    x: 0,
                    y: animate ? 50 : 30
                )
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
                
                Spacer() // if did't using spacer() uncomment Scroll View & Navigation View
            }
            .frame(maxWidth: 400)
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
//        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeOut(duration: 1.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
    
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
//        NavigationView {
            NoItemsView()
//                .navigationTitle("Title")
//        }
    }
}
