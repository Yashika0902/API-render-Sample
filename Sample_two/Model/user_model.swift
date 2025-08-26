struct UserModel: Codable, Identifiable {
    let id: Int
    let name: String
    let company: String
    let email: String
    let address: String
}
