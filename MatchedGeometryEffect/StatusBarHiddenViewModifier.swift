import SwiftUI

struct StatusBarHiddenViewModifier: ViewModifier {
    let hidden: Bool

    func body(content: Content) -> some View {
        content
            #if os(iOS)  // I was unable to get `if #available(iOS 15, *)` to work.
                .statusBarHidden(hidden)
            #endif
    }
}

extension View {

    func statusBarHiddenIfAvailable(_ hidden: Bool) -> some View {
        modifier(StatusBarHiddenViewModifier(hidden: hidden))
    }

}

