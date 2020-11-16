//
//  PokemonDetail.swift
//  PokeApiTest
//
//  Created by mac on 11/15/20.
//

import UIKit
import AlamofireImage

class PokemonDetail: UIViewController {

  var String_For_test:String?

  var pokemonSelected:Pokemon?

  @IBOutlet weak var titleLabel: UILabel!


  @IBOutlet weak var pokemonImage: UIImageView!




    override func viewDidLoad() {
        super.viewDidLoad()

      print(pokemonSelected)

      populateData(pokemonSelected: self.pokemonSelected)


        // Do any additional setup after loading the view.
    }

  func populateData(pokemonSelected:Pokemon?){

    //Set URL to Image

    if let pokemonIndex = pokemonSelected?.id{

      let pokemonImageURL = ConstantansApp.URL_POKEMON_IMAGE_BASE + "\(pokemonIndex)" + ConstantansApp.POSTFIX_POKEMON_IMAGE_URL
      self.pokemonImage.af.setImage(withURL: URL(string: pokemonImageURL)!)

    }


    self.titleLabel.text = pokemonSelected?.name

    self.title = pokemonSelected?.name



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
