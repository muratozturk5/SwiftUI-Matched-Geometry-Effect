import SwiftUI

@main
struct MatchedGeometryEffectApp: App {
    var body: some Scene {
#if os(macOS)
        // This variation givs us a single window without a tab bar on macOS.
        Window("MatchedGeometryEffect", id: "main") {
            ContentView()
                .onAppear {
                    NSWindow.allowsAutomaticWindowTabbing = false
                }
        }
#elseif os(iOS)
        WindowGroup {
            ContentView()
        }
#endif
    }
}
