import Foundation

@MainActor
class Users: ObservableObject{
    @Published var users: [UserModel] = []
    
    //init
    
    init() {
        Task.init {
            await fetchUsers()
        }
    }
    
    //api calling function
    func fetchUsers() async {
        do{
            //url object
            guard let url = URL(string: "https://fake-json-api.mock.beeceptor.com/users") else {
                fatalError("error in url creation")
            }
            //url request
            let urlRequest = URLRequest(url: url)
            
            //get json
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            //check response
            guard (response as?HTTPURLResponse)?.statusCode == 200 else {
                fatalError("error fetching data")
            }
            //decode json into struct
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let users: [UserModel] = try decoder.decode([UserModel].self, from: data)
            
            
            //ui update on main thread
            DispatchQueue.main.async {
                self.users = users
            }
            
            
        } catch{
             //error
            print(error)
        }
    }
}
