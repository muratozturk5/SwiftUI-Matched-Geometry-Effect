//
//  ContentView.swift
//  Shared
//
//  Created by Macbook on 3.07.2022.
//

import SwiftUI

struct ContentView: View {
    @Namespace var namespace
    @Namespace var namespace2
    @Namespace var namespace3

    
    @State var show = false
    @State var show2 = false
    @State var show3 = false

    @State var tap = false
    @State var tap2 = false
    @State var tap3 = false

    var body: some View {
        
        ZStack{
            Color("Background").ignoresSafeArea()
            ScrollView{
              
                    ItemView(namespace: namespace, show: $show,title: "Walk",description: "Description",background: "Background 3",image: "Nature Walk")
                    .scaleEffect(tap ? 0.95 : 1)
                    .onTapGesture {
                        withAnimation(.spring(response: 0.5, dampingFraction: 0.7)){
                            tap = true
                        }
                    
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                           
                            
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.7)){
                                show.toggle()
                                tap = false
                            }
                        }
                        
                       
                    }.padding()
                    
                    ItemView(namespace: namespace2, show: $show2,title: "Yoga",description: "Description",background: "Background 2",image: "Yoga")
                    .scaleEffect(tap2 ? 0.95 : 1)
                    .onTapGesture {
                        withAnimation(.spring(response: 0.5, dampingFraction: 0.7)){
                            tap2 = true
                        }
                    
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                           
                            
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.7)){
                                show2.toggle()
                                tap2 = false
                            }
                        }
                        
                       
                    }.padding()

                
                ItemView(namespace: namespace3, show: $show3,title: "Swiming",description: "Description",background: "Background 4",image: "Swiming")
                .scaleEffect(tap3 ? 0.95 : 1)
                .onTapGesture {
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.7)){
                        tap3 = true
                    }
                
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                       
                        
                        withAnimation(.spring(response: 0.5, dampingFraction: 0.7)){
                            show3.toggle()
                            tap3 = false
                        }
                    }
                    
                   
                }.padding()
                
            }
            
            
            if show {
                DetailView(namespace: namespace, show: $show,title: "Walk",description: "Description",background: "Background 3",image: "Nature Walk").zIndex(5)
               
           }
            
            
             if show2 {
                 DetailView(namespace: namespace2, show: $show2,title: "Yoga",description: "Description",background: "Background 2",image: "Yoga").zIndex(5)

            }
            
            if show3 {
                DetailView(namespace: namespace3, show: $show3,title: "Swiming",description: "Description",background: "Background 4",image: "Swiming").zIndex(5)

           }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
