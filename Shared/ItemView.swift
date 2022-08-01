//
//  ItemView.swift
//  MatchedGeometryEffect
//
//  Created by Macbook on 3.07.2022.
//

import SwiftUI

struct ItemView: View {
    var namespace : Namespace.ID
    @Binding var show : Bool
     var title : String
     var description : String
     var background : String
     var image : String

    var body: some View {
        VStack{
            Spacer()
            VStack(alignment: .leading, spacing: 12) {
                Text(title).fontWeight(.bold).font(.title).frame(maxWidth:.infinity,alignment: .leading).matchedGeometryEffect(id: "title", in: namespace)
                Text(description).fontWeight(.bold).font(.callout).matchedGeometryEffect(id: "title2", in: namespace)

            }.padding(20)
                .background(
                Rectangle().fill(.ultraThinMaterial)
                    .mask(RoundedRectangle(cornerRadius: 30 , style : .continuous))
                    .blur(radius: 30)
                    .matchedGeometryEffect(id: "blur", in: namespace)
            )
      
            
        }.foregroundStyle(.white)
            .background(
                Image(image).resizable().aspectRatio(contentMode: .fill)
                    .matchedGeometryEffect(id: "image", in: namespace).padding(.bottom,70)
            )
            .background(
                Image(background).resizable().aspectRatio(contentMode: .fill)
                    .matchedGeometryEffect(id: "background", in: namespace)
            ).mask {
                RoundedRectangle(cornerRadius: 30,style: .continuous).matchedGeometryEffect(id: "mask", in: namespace)
            }.frame(height:300)
    }
}

struct ItemView_Previews: PreviewProvider {
    @Namespace static var namespace

    static var previews: some View {
        ItemView(namespace: namespace, show: .constant(false),title: "Walk",description: "Description",background: "Background 3",image: "Yoga")
    }
}
