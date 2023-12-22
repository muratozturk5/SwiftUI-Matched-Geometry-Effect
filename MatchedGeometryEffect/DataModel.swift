import Foundation

struct Item: Identifiable, Equatable {
    let id = UUID()
    let title: String
    let description: String
    let background: String
    let image: String
    let identity: String
    let details: String
}

struct Data {

    // Some sample images courtesy of [Vecteezy.com](https://www.vecteezy.com/).

    static let items = [
        Item(title: "Nature Walk",
             description: "Get out of the city for a new perspective",
             background: "Background1",
             image: "NatureWalk",
             identity: "Murat ÖZTÜRK",
             details: Data.lorum),
        Item(title: "Yoga", 
             description: "Improve your strength, balance, and flexibility",
             background: "Background2", 
             image: "Yoga",
             identity: "Maharishi Mahesh Yogi", 
             details: Data.lorum),
        Item(title: "Swimming",
             description: "A great workout for your whole body",
             background: "Background3",
             image: "Swimming",
             identity: "Michael Phelps",
             details: Data.lorum),
        Item(title: "Evening Walk", 
             description: "Reduce your stress and improve your mood",
             background: "Background1",
             image: "EveningWalk",
             identity: "T-Bone Walker",
             details: Data.lorum)
    ]

    static private let lorum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur."

}
