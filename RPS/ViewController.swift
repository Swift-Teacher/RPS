import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var signLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var lizardButton: UIButton!
    @IBOutlet weak var spockButton: UIButton!
   
    @IBOutlet weak var ruleLabel: UILabel!
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    var opponentPersona = ["👨🏻‍💻", "💩", "🤢", "😜", "🤬", "🥷🏻", "🫃🏻", "🦃", "🎅🏿"]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateUI(forState: .start)
    }

    @IBAction func rockChosen(_ sender: Any) {
        play(userSign: .rock)
    }
    
    @IBAction func paperChosen(_ sender: Any) {
        play(userSign: .paper)
    }
    
    @IBAction func scissorsChosen(_ sender: Any) {
        play(userSign: .scissors)
    }
    
    @IBAction func lizardChosen(_ sender: Any) {
        play(userSign: .lizard)
    }
    
    @IBAction func spockChosen(_ sender: Any) {
        play(userSign: .spock)
    }
    
    
    @IBAction func playAgain(_ sender: Any) {
        updateUI(forState: .start)
    }
    
    func updateUI(forState state: GameState) {
        statusLabel.text = state.status

        switch state {
        case .start:
            view.backgroundColor = .gray
            
            signLabel.text = opponentPersona.randomElement()
            playAgainButton.isHidden = true
            ruleLabel.isHidden = true
            
            rockButton.isHidden = false
            paperButton.isHidden = false
            scissorsButton.isHidden = false
            lizardButton.isHidden = false
            spockButton.isHidden = false

            rockButton.isEnabled = true
            paperButton.isEnabled = true
            scissorsButton.isEnabled = true
            lizardButton.isEnabled = true
            spockButton.isEnabled = true
            
        case .win:
            view.backgroundColor = UIColor(red: 0.651, green: 0.792, blue: 0.651, alpha: 1)
        case .lose:
            view.backgroundColor = UIColor(red: 0.851, green: 0.424, blue: 0.412, alpha: 1)
        case .draw:
            view.backgroundColor = UIColor(red: 0.663, green: 0.663, blue: 0.663, alpha: 1)
        }
    }
    
    func play(userSign: Sign) {
        let computerSign = randomSign()
        
        let gameState = userSign.gameState(against: computerSign)
        updateUI(forState: gameState)
        
        signLabel.text = computerSign.emoji
        ruleLabel.isHidden = false
        ruleLabel.text = rule
        
        rockButton.isHidden = true
        paperButton.isHidden = true
        scissorsButton.isHidden = true
        lizardButton.isHidden = true
        spockButton.isHidden = true

        rockButton.isEnabled = false
        paperButton.isEnabled = false
        scissorsButton.isEnabled = false
        lizardButton.isEnabled = false
        spockButton.isEnabled = false
        
        switch userSign {
        case .rock:
            rockButton.isHidden = false
        case .paper:
            paperButton.isHidden = false
        case .scissors:
            scissorsButton.isHidden = false
        case .lizard:
            lizardButton.isHidden = false
        case .spock:
            spockButton.isHidden = false
        }
        
        playAgainButton.isHidden = false
    }
}

