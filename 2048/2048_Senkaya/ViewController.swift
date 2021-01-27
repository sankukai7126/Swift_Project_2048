//
//  ViewController.swift
//  2048_Senkaya
//
//  Created by Mikrail Senkaya on 07/01/2021.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var VertialLayout: UIStackView!
    @IBOutlet var Line0: [UILabel]!  //Tableau contenant les labels de la premiere ligne
    @IBOutlet var Line1: [UILabel]!  //Tableau contenant les labels de la seconde ligne
    @IBOutlet var Line2: [UILabel]!  //Tableau contenant les labels de la troisieme ligne
    @IBOutlet var Line3: [UILabel]!  //Tableau contenant les labels de la derniere ligne
    @IBOutlet var Case: [UILabel]!  //Tableau contenant tous les labels qui correspondent au cases
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var UndoButton: UIButton!
    var CaseBackUp: [Int] = Array(repeating: 0, count: 16) //Tableau de backup pour enregistrer l'etat de toute les cases correspondant au tour d'avant
    var ScoreBackUp: Int = 0
    
    //Fonction qui permet de sauvegarder l'etat des cases avant le swipe
    func BackUp(){
        for i in 0..<Case.count{
            CaseBackUp[i] = Case[i].tag
        }
        ScoreBackUp = ScoreLabel.tag
    }
    
    //Fonction qui regarde si toutes les cases sont remplis
    func CheckDefeat(){
        
        var freeCase: Int = 0
        
        for i in Case{
            if i.tag == 0{
                freeCase = freeCase+1
            }
        }
        
        if freeCase == 0{
            UndoButton.tag = 1
        }
        
    }
    
    @IBAction func RightSwipe(_ sender: UISwipeGestureRecognizer) {
        
        // On sauvegarde l'etat actuel du tableau
        BackUp()
        
        //On bouge toutes les cases a droites si un mouvement est possible
        //Si 2 cases qui ont le meme numero on fusionne les cases et on multiplie le score par deux
        for j in 0..<4{
            for i in 0..<3{
                if Line0[i+1].tag == Line0[i].tag{
                    Line0[i+1].tag = Line0[i+1].tag*2
                    Line0[i].tag = 0
                    ScoreLabel.tag += Line0[i+1].tag
                }else if Line0[i+1].tag == 0{
                    Line0[i+1].tag = Line0[i].tag
                    Line0[i].tag = 0
                }
            }
            for i in 0..<3{
                if Line1[i].tag == Line1[i+1].tag{
                    Line1[i+1].tag = Line1[i+1].tag*2
                    Line1[i].tag = 0
                    ScoreLabel.tag += Line1[i+1].tag
                }else if Line1[i+1].tag == 0{
                    Line1[i+1].tag = Line1[i].tag
                    Line1[i].tag = 0
                }
            }
            for i in 0..<3{
                if Line2[i].tag == Line2[i+1].tag{
                    Line2[i+1].tag = Line2[i+1].tag*2
                    Line2[i].tag = 0
                    ScoreLabel.tag += Line2[i+1].tag
                }else if Line2[i+1].tag == 0{
                    Line2[i+1].tag = Line2[i].tag
                    Line2[i].tag = 0
                }
            }
            for i in 0..<3{
                if Line3[i].tag == Line3[i+1].tag{
                    Line3[i+1].tag = Line3[i+1].tag*2
                    Line3[i].tag = 0
                    ScoreLabel.tag += Line3[i+1].tag
                }else if Line3[i+1].tag == 0{
                    Line3[i+1].tag = Line3[i].tag
                    Line3[i].tag = 0
                }
            }
        }
        
        var rand = Int.random(in: 0..<16)
        if Case[rand].tag != 0{
            while Case[rand].tag != 0{
                rand = Int.random(in: 0..<16)
            }
        }
        
        //On ajoute aleatoirement un deux dans une des cases vides
        
        Case[rand].tag = 2
        
        CheckDefeat()
        
        CaseColor()
        CaseText()
        
    }
    
    @IBAction func LeftSwipe(_ sender: UISwipeGestureRecognizer) {
        
        // On sauvegarde l'etat actuel du tableau
        BackUp()
        
        //On bouge toutes les cases a gauche si un mouvement est possible
        //Si 2 cases qui ont le meme numero on fusionne les cases et on multiplie le score par deux
        
        for j in 0..<4{
            for i in 0..<3{
                if Line0[3-i-1].tag == Line0[3-i].tag{
                    Line0[3-i-1].tag = Line0[3-i-1].tag*2
                    Line0[3-i].tag = 0
                    ScoreLabel.tag += Line0[3-i-1].tag
                }else if Line0[3-i-1].tag == 0{
                    Line0[3-i-1].tag = Line0[3-i].tag
                    Line0[3-i].tag = 0
                }
            }
            for i in 0..<3{
                if Line1[3-i-1].tag == Line1[3-i].tag{
                    Line1[3-i-1].tag = Line1[3-i-1].tag*2
                    Line1[3-i].tag = 0
                    ScoreLabel.tag += Line1[3-i-1].tag
                }else if Line1[3-i-1].tag == 0{
                    Line1[3-i-1].tag = Line1[3-i].tag
                    Line1[3-i].tag = 0
                }
            }
            for i in 0..<3{
                if Line2[3-i-1].tag == Line2[3-i].tag{
                    Line2[3-i-1].tag = Line2[3-i-1].tag*2
                    Line2[3-i].tag = 0
                    ScoreLabel.tag += Line2[3-i-1].tag
                }else if Line2[3-i-1].tag == 0{
                    Line2[3-i-1].tag = Line2[3-i].tag
                    Line2[3-i].tag = 0
                }
            }
            for i in 0..<3{
                if Line3[3-i-1].tag == Line3[3-i].tag{
                    Line3[3-i-1].tag = Line3[3-i-1].tag*2
                    Line3[3-i].tag = 0
                    ScoreLabel.tag += Line3[3-i-1].tag
                }else if Line3[3-i-1].tag == 0{
                    Line3[3-i-1].tag = Line3[3-i].tag
                    Line3[3-i].tag = 0
                }
            }
        }
        
        //On ajoute aleatoirement un deux dans une des cases vides
        
        var rand = Int.random(in: 0..<16)
        if Case[rand].tag != 0{
            while Case[rand].tag != 0{
                rand = Int.random(in: 0..<16)
            }
        }
        
        Case[rand].tag = 2
        
        CheckDefeat()
        
        CaseColor()
        CaseText()
        
    }
    
    @IBAction func UpSwipe(_ sender: UISwipeGestureRecognizer) {
        
        // On sauvegarde l'etat actuel du tableau
        BackUp()
        
        //On bouge toutes les cases en haut si un mouvement est possible
        //Si 2 cases qui ont le meme numero on fusionne les cases et on multiplie le score par deux
        for j in 0..<4{
            for i in 0..<12{
                if Case[i + 4].tag == Case[i].tag{
                    Case[i].tag = Case[i].tag * 2
                    Case[i + 4].tag = 0
                    ScoreLabel.tag += Case[i].tag
                }else if Case[i].tag == 0{
                    Case[i].tag = Case[i + 4].tag
                    Case[i + 4].tag = 0
                }
            }
        }
        
        //On ajoute aleatoirement un deux dans une des cases vides
        
        var rand = Int.random(in: 0..<16)
        if Case[rand].tag != 0{
            while Case[rand].tag != 0{
                rand = Int.random(in: 0..<16)
            }
        }
        
        Case[rand].tag = 2
        
        CheckDefeat()
        
        CaseColor()
        CaseText()
    }
    
    @IBAction func DownSwipe(_ sender: UISwipeGestureRecognizer) {
        
        // On sauvegarde l'etat actuel du tableau
        BackUp()
        
        //On bouge toutes les cases en haut si un mouvement est possible
        //Si 2 cases qui ont le meme numero on fusionne les cases et on multiplie le score par deux
        
        for j in 0..<4{
            for i in 0..<12{
                if Case[15 - i - 4].tag == Case[15 - i].tag{
                    Case[15 - i].tag = Case[15 - i].tag * 2
                    Case[15 - i - 4].tag = 0
                    ScoreLabel.tag += Case[15 - i].tag
                }else if Case[15 - i].tag == 0{
                    Case[15 - i].tag = Case[15 - i - 4].tag
                    Case[15 - i - 4].tag = 0
                }
            }
        }
        
        //On ajoute aleatoirement un deux dans une des cases vides
        
        var rand = Int.random(in: 0..<16)
        if Case[rand].tag != 0{
            while Case[rand].tag != 0{
                rand = Int.random(in: 0..<16)
            }
        }
        
        Case[rand].tag = 2
        
        CheckDefeat()
        
        CaseColor()
        CaseText()
        
    }
    
    func InitCase(){
        //On initialise toutes les cases a 0
        for i in Case{
            i.tag = 0
        }
        
        //On ajoute deux 2 dans les cases aleatoirement
        var rand1 = Int.random(in: 1..<16)
        var rand2 = Int.random(in: 1..<16)
        if rand2 == rand1{
            while rand2==rand1{
                rand2 = Int.random(in: 1..<16)
            }
        }
        Case[Case.index(before: rand1)].tag = 2
        Case[Case.index(before: rand2)].tag = 2
        
        UndoButton.tag = 0
        
        ScoreLabel.tag = 0
        
        self.view.backgroundColor = UIColor.black
        
    }
    
    func CaseColor(){
        //On change la couleur de la case en fonction de la valeur
        for i in Case{
            if i.tag == 0{
                i.backgroundColor = UIColor.darkGray
                i.textColor = UIColor.white
            }else if i.tag == 2{
                i.backgroundColor = UIColor.systemPurple
                i.textColor = UIColor.white
            }else if i.tag == 4{
                i.backgroundColor = UIColor.systemPink
                i.textColor = UIColor.white
            }else if i.tag == 8{
                i.backgroundColor = UIColor.systemIndigo
                i.textColor = UIColor.white
            }else if i.tag == 16{
                i.backgroundColor = UIColor.systemGreen
                i.textColor = UIColor.white
            }else if i.tag == 32{
                i.backgroundColor = UIColor.systemBlue
                i.textColor = UIColor.white
            }else if i.tag == 64{
                i.backgroundColor = UIColor.systemYellow
                i.textColor = UIColor.white
            }else if i.tag == 128{
                i.backgroundColor = UIColor.systemOrange
                i.textColor = UIColor.white
            }else if i.tag == 256{
                i.backgroundColor = UIColor.systemRed
                i.textColor = UIColor.white
            }else if i.tag == 512{
                i.backgroundColor = UIColor.systemTeal
                i.textColor = UIColor.white
            }else if i.tag == 1024{
                i.backgroundColor = UIColor.systemGray
                i.textColor = UIColor.white
            }else if i.tag == 2048{
                i.backgroundColor = UIColor.black
                i.textColor = UIColor.white
            }
        }
        
        if UndoButton.tag == 0{
            UndoButton.backgroundColor = UIColor.systemBlue
        }else{
            UndoButton.backgroundColor = UIColor.red
        }
        
    }
    
    func CaseText(){
        //On change le texte en fonction de la valeur de la case
        for i in Case{
            if i.tag == 0{
                i.text = ""
            }else{
                i.text = "\(i.tag)"
            }
        }
        
        if UndoButton.tag == 0{
            UndoButton.setTitle("UNDO", for: .normal)
        }else{
            UndoButton.setTitle("REPLAY", for: .normal)
        }
        
        ScoreLabel.text = "\(ScoreLabel.tag)"
        
    }
    
    @IBAction func UndoClicked(_ sender: Any) {
        //Si on a pas perdu on reprend le tableau
        if UndoButton.tag == 0{
            for i in 0..<Case.count{
                Case[i].tag = CaseBackUp[i]
            }
            
            ScoreLabel.tag = ScoreBackUp
            
            CaseColor()
            CaseText()
        }else{
            InitCase()
            CaseColor()
            CaseText()
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        InitCase()
        CaseColor()
        CaseText()
    }
    
    

    

}

