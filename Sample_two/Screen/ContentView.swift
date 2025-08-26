

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = Users()
    var body: some View {
       NavigationStack {
           VStack {
               List(viewModel.users) { user in
                   
                   NavigationLink(destination: UserDetails(user: user)){
                       Text(user.name)
                   }
               }
               
           }
           .padding()
           .navigationTitle(Text("Users"))
           
        }
    }
}

#Preview {
    ContentView()
}
