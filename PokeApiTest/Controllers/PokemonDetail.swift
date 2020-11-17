//
//  PokemonDetail.swift
//  PokeApiTest
//
//  Created by mac on 11/15/20.
//

import UIKit
import Alamofire
import AlamofireImage

class PokemonDetail: UIViewController {

  var String_For_test:String?

  var pokemonSelected:Pokemon?

  var Api = PokeApiConnect()

  @IBOutlet weak var titleLabel: UILabel!


  @IBOutlet weak var pokemonImage: UIImageView!

  //Outlets For Stat Base

  @IBOutlet weak var HP: UILabel!

  @IBOutlet weak var ATK: UILabel!

  @IBOutlet weak var DEF: UILabel!

  @IBOutlet weak var SATACK: UILabel!

  @IBOutlet weak var SDEF: UILabel!

  @IBOutlet weak var SPD: UILabel!

  override func viewDidLoad() {
        super.viewDidLoad()

      print(pokemonSelected)

      if let url = pokemonSelected?.url{
        self.Api.GetPokemonSelectedDetailData(urlToPokemonData: url)
      }


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

extension PokemonDetail : PokeApiDetailPokemonsActions{
  func PopulateDetailPokemon(response: PokemonDetailResponse) {

    for item in response.stats{

    }
   

  }


}
