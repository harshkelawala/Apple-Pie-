
import UIKit

class ViewController: UIViewController {

    var currentGame : Game!
    
    @IBOutlet weak var treeImageView: UIImageView!
    
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet var letterButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        newRound()
    }

    @IBAction func letterButtonPressed(_ sender: UIButton) {
        
        sender.isEnabled = false
        let letterString = sender.configuration!.title!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        
         updateGameState()
    }
    
    func updateGameState(){
        if currentGame.incorrectMovesLeft == 0{
            totalLoses += 1
        }
        
        else if currentGame.word == currentGame.formattedWord{
            totalWins += 1
        }
        
        else{
            updateUI()
        }
    }
    
    var listOfWords = ["bug", "swift", "glorious", "apple", "xcode", "macbook"]
    
    let incorrectMovesAllowed = 7
    
    var totalWins = 0{
        didSet{
            newRound()
        }
    }
    var totalLoses = 0{
        didSet{
            newRound()
        }
    }
    
    func newRound(){
        if !listOfWords.isEmpty{
            let newWord = listOfWords.removeFirst()
            
            currentGame = Game(word: newWord, incorrectMovesLeft: incorrectMovesAllowed, guessedLetters: [])
            
            enableLetterButtons(true)
            updateUI()
        }
        else{
            enableLetterButtons(false)
        }
        
    }
    
    func enableLetterButtons(_ enable : Bool){
        for buttons in letterButtons{
            buttons.isEnabled = enable
        }
    }
    
    
    func updateUI(){
        
        var letters = [String]()
        for letter in currentGame.formattedWord {
            letters.append(String(letter))
        }
        let wordWithSpacing = letters.joined(separator: " ")
        
        correctWordLabel.text = wordWithSpacing
        
        scoreLabel.text = "Wins : \(totalWins), Losses : \(totalLoses)"
        
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesLeft)")
    }
    
    
}

