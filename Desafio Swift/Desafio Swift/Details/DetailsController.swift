import UIKit

class DetailsController: UIViewController {
    
    var person: Persons?
    
    
    @IBOutlet weak var labelNome: UILabel!
    @IBOutlet weak var labelAltura: UILabel!
    @IBOutlet weak var labelPeso: UILabel!
    @IBOutlet weak var labelCabelo: UILabel!
    @IBOutlet weak var labelPele: UILabel!
    @IBOutlet weak var labelOlhos: UILabel!
    @IBOutlet weak var labelNascimento: UILabel!
    @IBOutlet weak var labelGenero: UILabel!
    @IBOutlet weak var labelTerraNatal: UILabel!
    @IBOutlet weak var labelFilmes: UILabel!
    @IBOutlet weak var labelEspecie: UILabel!
    @IBOutlet weak var labelVeiculo: UILabel!
    @IBOutlet weak var labelNave: UILabel!
    @IBOutlet weak var labelCriacao: UILabel!
    @IBOutlet weak var labelEditado: UILabel!
    @IBOutlet weak var labelUrl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard person != nil else {
            alerta(title: "Falha!", mensagem: "Ocorreu uma falha ao tentar receber os detalhes do personagem!")
            dismiss(animated: true, completion: nil)
            return
        }
        guard let pessoa = person else {return}
        title = "Pessoa - \(pessoa.name)"
        //Print in Labels
        self.labelNome.text = pessoa.name
        self.labelAltura.text = pessoa.height
        self.labelPeso.text = pessoa.mass
        self.labelCabelo.text = pessoa.hair_color
        self.labelPele.text = pessoa.skin_color
        self.labelOlhos.text = pessoa.eye_color
        self.labelNascimento.text = pessoa.birth_year
        self.labelGenero.text = pessoa.gender
        self.labelTerraNatal.text = pessoa.homeworld
        if pessoa.films.isEmpty == false {
            self.labelFilmes.text! = pessoa.films.joined(separator: "\n")
        }
        if pessoa.species.isEmpty == false {
            self.labelEspecie.text = pessoa.species.joined(separator: "\n")
        }
        if pessoa.vehicles.isEmpty == false {
            self.labelVeiculo.text = pessoa.vehicles.joined(separator: "\n")
        }
        if pessoa.starships.isEmpty == false {
            self.labelNave.text = pessoa.starships.joined(separator: "\n")
        }
        self.labelCriacao.text = pessoa.created
        self.labelEditado.text = pessoa.edited
        self.labelUrl.text = pessoa.url
    }
    
    func alerta(title: String, mensagem:String){
        let alert = UIAlertController(title: title, message: mensagem, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
