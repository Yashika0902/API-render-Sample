
import SwiftUI

struct UserDetails: View {
    let user: UserModel
    var body: some View {
        Text(user.address)
            .navigationTitle(user.name)
    }
        
}


