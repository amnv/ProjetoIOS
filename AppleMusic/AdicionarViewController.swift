//
//  AdicionarViewController.swift
//  AppleMusic
//
//  Created by Allyson Manoel Nascimento Venceslau on 02/05/19.
//  Copyright © 2019 Memo. All rights reserved.
//

import UIKit

class AdicionarViewController: UIViewController {

    @IBOutlet weak var nomeTextField: UITextField!
    
    @IBOutlet weak var generoSegment: UISegmentedControl!
    @IBOutlet weak var artistaSegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let generos = Genero.allCases
        self.generoSegment.removeAllSegments()
        for (index,genero) in generos.enumerated() {
            self.generoSegment.insertSegment(withTitle: genero.rawValue, at: index, animated: true)
        }
        
        self.artistaSegment.removeAllSegments()
        for (index,artista) in artistas.enumerated() {
            self.artistaSegment.insertSegment(withTitle: artista.nome, at: index, animated: true)
        }
    }
    

    @IBAction func adicionarMusica(_ sender: Any) {
        
        self.performSegue(withIdentifier: "adicionarMusica", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == "adicionarMusica" {
            if let listaViewController = segue.destination as? ViewController {
                let nome = self.nomeTextField.text!
                let genero = Genero.allCases[self.generoSegment.selectedSegmentIndex]
                let artista = artistas[self.artistaSegment.selectedSegmentIndex]
                
                listaViewController.musicaASerAdicionada = Musica(nome: nome, genero: genero, artista: artista)
            }
        }
    }
}
