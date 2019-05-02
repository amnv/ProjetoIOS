//
//  ViewController.swift
//  AppleMusic
//
//  Created by Elton Santana on 16/04/19.
//  Copyright © 2019 Memo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
 
    @IBOutlet weak var musicasTableView: UITableView!
    
    var musicaASerAdicionada: Musica! {
        didSet {
            musicas.append(self.musicaASerAdicionada)
            //self.musicasTableView.reloadData()
        }
    }
    
    @IBAction func voltePraCa(_ sender: UIStoryboardSegue) {
            self.musicasTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.musicasTableView.dataSource = self
        self.musicasTableView.delegate = self
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       // self.musicasTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicaTableViewCell") as! MusicaTableViewCell
        
        let musica = musicas[indexPath.row]
        
        cell.artistaLabel.text = musica.artista.nome
        cell.musicaLabel.text = musica.nome
        cell.generoLabel.text = musica.genero.rawValue
        cell.artistaImageView.image = musica.artista.foto
        
        return cell
    }
    
}



