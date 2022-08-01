//
//  MatchedView.swift
//  MatchedGeometryEffect
//
//  Created by Macbook on 3.07.2022.
//

import SwiftUI

struct MatchedView: View {
    @Namespace var namespace
    @State var show = false

    var body: some View {
        if !show {
            VStack{
                ItemView(namespace: namespace, show: $show).onTapGesture {
                    withAnimation(.spring(response: 0.6, dampingFraction: 0.8)){
                        show.toggle()
                    }
                }
            }
        }
        
        if show {
            DetailView(namespace: namespace, show: $show)

        }
        
        
    }
    
}

struct MatchedView_Previews: PreviewProvider {
    static var previews: some View {
        MatchedView()
    }
}
