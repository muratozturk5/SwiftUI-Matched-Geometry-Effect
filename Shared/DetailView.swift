//
//  DetailView.swift
//  MatchedGeometryEffect
//
//  Created by Macbook on 3.07.2022.
//

import SwiftUI

struct DetailView: View {
    var namespace : Namespace.ID
    @Binding var show : Bool
    var title : String
    var description : String
    var background : String
    var image : String

    var body: some View {
        ZStack {
            Color("Background").ignoresSafeArea()
            ScrollView {
                cover
                
                VStack(spacing: 12){
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi dignissim dolor eu porttitor finibus. Duis varius posuere ante in volutpat. Aenean nibh nibh, varius eget suscipit vitae, aliquet at turpis. Proin at mollis tellus, sed sollicitudin dolor. Fusce diam nunc, laoreet ut lacinia id, tincidunt vitae turpis. Fusce vitae pulvinar augue. Sed lacinia varius nulla, non sagittis erat maximus quis. Aenean scelerisque eu magna eu porta. Integer a enim sodales nisl pellentesque laoreet sit amet et dolor\n\n        Vivamus ultrices, libero ut sollicitudin facilisis, arcu tellus suscipit orci, ultrices fringilla elit lectus id velit. Nulla in rutrum lectus. Ut semper urna ac tristique mollis. Etiam sit amet diam orci. Ut felis leo, auctor sit amet metus non, commodo congue massa. Vestibulum facilisis, velit at tempor ultrices, sem justo efficitur dolor, vitae ultrices diam ante et ante. Vivamus venenatis sit amet eros et sodales. Suspendisse porta vitae odio at finibus. Fusce sollicitudin enim vitae libero tincidunt, finibus venenatis nibh congue. Suspendisse fringilla cursus libero id sodales. Nulla auctor tincidunt suscipit. Aliquam eros augue, rhoncus vitae hendrerit congue, varius at nunc. Cras pulvinar justo felis, sit amet dapibus orci elementum sed. Duis eu laoreet diam.").fontWeight(.medium).font(.callout).frame(maxWidth : .infinity)
                    

                }.padding(20)
                    .background(
                        Rectangle().fill(.ultraThinMaterial)
                            .mask(RoundedRectangle(cornerRadius: 30 , style : .continuous))
                    ) .padding(20).padding(.top,80)
            }
            .ignoresSafeArea()
            
            Button {
                
                withAnimation(.spring(response: 0.5, dampingFraction: 0.7)){
                    show.toggle()
                }
            } label: {
                Image(systemName: "xmark")
                    .font(.body.weight(.bold))
                    .foregroundColor(.black)
                    .padding(8)
                    .background(.ultraThinMaterial, in: Circle())
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding(.horizontal,20)
            .padding(.vertical,40)
            .ignoresSafeArea()
        }
    }
    
    var cover : some View {
        
    
            VStack{
                Spacer()
            }.frame(maxWidth:.infinity)
                .frame(height:500)
                .foregroundStyle(.white)
                .background(
                    Image(image).resizable().aspectRatio(contentMode: .fit)
                        .matchedGeometryEffect(id: "image", in: namespace)
                )
                .background(
                    Image(background).resizable().aspectRatio(contentMode: .fill)
                        .matchedGeometryEffect(id: "background", in: namespace)
                ).mask {
                    RoundedRectangle(cornerRadius: 30,style: .continuous).matchedGeometryEffect(id: "mask", in: namespace)
                }  .overlay{
                    VStack(alignment: .leading, spacing: 12){
                        Text(title).fontWeight(.bold).font(.title).frame(maxWidth:.infinity,alignment: .leading).matchedGeometryEffect(id: "title", in: namespace)
                        Text(description).fontWeight(.bold).font(.callout).matchedGeometryEffect(id: "title2", in: namespace)
                        
                        
                        Divider()
                        HStack{
                            Image(systemName: "person.circle")
                                .resizable()
                                .frame(width: 26, height: 26).cornerRadius(10).padding(8)
                                .background(.ultraThinMaterial,in:RoundedRectangle(cornerRadius: 18,style:.continuous))
                            
                            Text("Murat ÖZTÜRK").font(.footnote).fontWeight(.semibold)
                        }
                    }.padding(20)
                        .background(
                            Rectangle().fill(.ultraThinMaterial)
                                .mask(RoundedRectangle(cornerRadius: 30 , style : .continuous))
                                .matchedGeometryEffect(id: "blur", in: namespace)
                        ).offset(y:250) .padding(20)
            }
            
         
        
        
        
    }
}

struct DetailView_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        DetailView(namespace: namespace, show: .constant(true),title: "Walk",description: "Description",background: "Background 3",image: "Woman Walk")
    }
}
