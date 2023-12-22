import SwiftUI

struct ItemView: View {
    let item: Item
    let namespace: Namespace.ID

    var body: some View {
        VStack {
            Spacer()
            VStack(alignment: .leading, spacing: 12) {
                Text(item.title)
                    .fontWeight(.bold)
                    .font(.title)
                    .frame(maxWidth:.infinity, alignment: .leading)
                    .layoutPriority(1)
                    .matchedGeometryEffect(id: "title-\(item)", in: namespace)
                Text(item.description)
                    .fontWeight(.bold)
                    .font(.callout)
                    .matchedGeometryEffect(id: "description-\(item)", in: namespace)
            }
            .padding(20)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .mask(
                        RoundedRectangle(
                            cornerRadius: 30,
                            style: .continuous
                        )
                    )
                    .blur(radius: 30)
                    .matchedGeometryEffect(id: "blur-\(item)", in: namespace)
            )
        }
        .foregroundStyle(.white)
        .background(
            Image(item.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "image-\(item)", in: namespace)
                .padding(.bottom, 70)
        )
        .background(
            Image(item.background)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "background-\(item)", in: namespace)
        )
        .mask {
            RoundedRectangle(cornerRadius: 30,style: .continuous)
                .matchedGeometryEffect(id: "mask-\(item)", in: namespace)
        }
        .frame(height:300)
        .contentShape(Rectangle())  // So the image doesn't intercept taps on neighboring objects.
    }
}

#Preview("Items") {
    @Namespace var namespace
    return ZStack {
        Color("Background")
            .edgesIgnoringSafeArea(.all)
        VStack(spacing: 16) {
            ItemView(item: Data.items[0], namespace: namespace)
            ItemView(item: Data.items[1], namespace: namespace)
        }
        .padding()
    }
}
