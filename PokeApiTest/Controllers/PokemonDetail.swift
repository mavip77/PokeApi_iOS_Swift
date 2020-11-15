//
//  PokemonDetail.swift
//  PokeApiTest
//
//  Created by mac on 11/15/20.
//

import UIKit

class PokemonDetail: UIViewController {

  var String_For_test:String?

  var pokemonSelected:Pokemon?

  @IBOutlet weak var titleLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

      self.titleLabel.text = String_For_test

      self.title = pokemonSelected?.name

      print(pokemonSelected)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
