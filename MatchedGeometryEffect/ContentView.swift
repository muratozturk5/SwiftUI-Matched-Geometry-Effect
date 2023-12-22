import SwiftUI

struct ContentView: View {
    @State private var scaleItem: Item?
    @State private var selectedItem: Item?
    @Namespace private var animation
    private var columns = [GridItem(.adaptive(minimum: 300), spacing: 16)]

    var body: some View {
        ZStack {
            Color("Background")
                .ignoresSafeArea()

            ScrollView {
                LazyVGrid(columns: columns, spacing: 16) {

                    ForEach(Data.items) { item in
                        ItemView(
                            item: item,
                            namespace: animation
                        )
                        .scaleEffect(item == scaleItem ? 0.95 : 1)
                        .onTapGesture {
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                                scaleItem = item
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                                    scaleItem = nil
                                    selectedItem = item
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.top)
            }

            if let item = selectedItem {
                DetailView(item: item, namespace: animation) {
                    withAnimation(.spring(response: 0.5, dampingFraction: 0.7)) {
                        selectedItem = nil
                    }
                }
                .zIndex(5)
            }
        }
    }
}

#Preview {
    ContentView()
}
