import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        }
    }
    
    private var people:Array<Persons> = []
    private var names: Array<String> = []
    private var infoPersons: Array<Persons> = []
    private var jsonUrl = "https://swapi.co/api/people/?page=1"
    private var limit = 10
    private let maxEntries = 90
    private var nextPage = ""
    var isLoading: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView(frame: .zero)
        apiLoad()
    }
    
    func apiLoad() {
        guard let url = URL(string: jsonUrl) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            DispatchQueue.main.async {
                guard let data = data else { return }
                do {
                    let apiPersons = try JSONDecoder().decode(ApiPersons.self , from: data)
                    self.people = apiPersons.results
                    self.people.forEach({ (person) in
                        self.names.append(person.name)
                        self.infoPersons.append(person)
                    })
                    self.tableView.reloadData()
                    if apiPersons.next != nil {
                        self.nextPage = apiPersons.next!
                    }
                } catch let jsonErr {
                    print("Error in serialization:", jsonErr)
                }
                self.isLoading = false
            }
            
        }.resume()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == names.count - 1 {
            if names.count < maxEntries {
                if isLoading == false {
                    limit += 10
                    jsonUrl = nextPage
                    
                    apiLoad()
                    print(jsonUrl)
                    self.isLoading = true
                }
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
            cell.textLabel?.text = names[indexPath.row]
            return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segueDetails",
                     sender: infoPersons[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueDetails",
            let personDetails = sender as? Persons,
            let destination = segue.destination as? DetailsController {
            destination.person = personDetails
        }
        
    }

}



