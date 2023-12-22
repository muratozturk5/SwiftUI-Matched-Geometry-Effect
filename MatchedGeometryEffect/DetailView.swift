import SwiftUI

struct DetailView: View {
    let item: Item
    let namespace: Namespace.ID
    let onCloseTap: () -> Void

    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()

            ScrollView {
                cover

                Text(item.details)
                    .font(.callout)
                    .fontWeight(.medium)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(20)
                    .background(
                        Rectangle()
                            .fill(.ultraThinMaterial)
                        .mask(RoundedRectangle(cornerRadius: 30 , style: .continuous))
                )
                .padding(.horizontal, 20)
                .padding(.vertical, 20)
            }
            .ignoresSafeArea(edges: [.top, .horizontal])

            Button {
                onCloseTap()
            } label: {
                Image(systemName: "xmark")
                    .font(.body.weight(.bold))
                    .padding(8)
                    .background(.ultraThinMaterial, in: Circle())
                    .statusBarHiddenIfAvailable(true)
            }
            .buttonStyle(.plain)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding(20)
            .if({
#if os(macOS)
                return false  // On macOS the window title is visible, and we want the button to be under it.
#else
                return true  // Ignore the safe area only on iOS.
#endif
            }()) { view in
                view.ignoresSafeArea()
            }
        }
    }

    var cover: some View {
        VStack {
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 500)
        .foregroundStyle(.white)
        .background(
            Image(item.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .matchedGeometryEffect(id: "image-\(item)", in: namespace)
        )
        .background(
            Image(item.background)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "background-\(item)", in: namespace)
        )
        .mask {
            RoundedRectangle(
                cornerRadius: 5,
                style: .continuous
            )
            .matchedGeometryEffect(id: "mask-\(item)", in: namespace)
        }
        .padding(.bottom, 50)
        .overlay {
            VStack {
                Spacer()
                VStack(alignment: .leading, spacing: 12) {
                    Text(item.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .matchedGeometryEffect(id: "title-\(item)", in: namespace)
                    Text(item.description)
                        .fontWeight(.bold)
                        .font(.callout)
                        .matchedGeometryEffect(id: "description-\(item)", in: namespace)
                    Divider()
                    HStack {
                        Image(systemName: "person.circle")
                            .resizable()
                            .frame(width: 26, height: 26)
                            .cornerRadius(10)
                            .padding(8)
                            .background(
                                .ultraThinMaterial,
                                in: RoundedRectangle(
                                    cornerRadius: 18,
                                    style:.continuous
                                )
                            )
                        Text(item.identity)
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .matchedGeometryEffect(id: "identity-\(item)", in: namespace)
                    }
                }
                .padding(20)
                .background(
                    Rectangle()
                        .fill(.ultraThinMaterial)
                        .mask(RoundedRectangle(cornerRadius: 30, style: .continuous))
                        .matchedGeometryEffect(id: "blur-\(item)", in: namespace)
                )
            }
            .frame(maxHeight: .infinity)
            .padding(.horizontal, 20)
        }
    }
}

#Preview("Nature Walk") {
    let item = Data.items[0]
    @Namespace var namespace
    return ZStack {
        Color("Background")
            .edgesIgnoringSafeArea(.all)
        DetailView(item: item, namespace: namespace) {}
    }
}

#Preview("Yoga") {
    let item = Data.items[1]
    @Namespace var namespace
    return ZStack {
        Color("Background")
            .edgesIgnoringSafeArea(.all)
        DetailView(item: item, namespace: namespace) {}
    }
}
