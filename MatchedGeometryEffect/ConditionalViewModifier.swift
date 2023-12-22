import SwiftUI

extension View {

    /// Based on [How to create a Conditional View Modifier in SwiftUI](https://www.avanderlee.com/swiftui/conditional-view-modifier/) by SwiftLee
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }

}
