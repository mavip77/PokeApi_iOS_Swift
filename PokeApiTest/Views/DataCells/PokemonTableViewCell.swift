//
//  PokemonTableViewCell.swift
//  PokeApiTest
//
//  Created by mac on 11/14/20.
//

import UIKit
import Alamofire
import AlamofireImage

class PokemonTableViewCell: UITableViewCell {


  @IBOutlet weak var pokemonImage: UIImageView!


  @IBOutlet weak var PokemonName: UILabel!


  @IBOutlet weak var PokemonId: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

  public func Populate(pokemon:Pokemon){

    let PokemonIdInPokeApi = self.getIdPokemonInPokeApi(url: pokemon.url)

    let urlImage = ConstantansApp.URL_POKEMON_IMAGE_BASE + "\(PokemonIdInPokeApi)" + ConstantansApp.POSTFIX_POKEMON_IMAGE_URL
    self.pokemonImage.af.setImage(withURL: URL(string: urlImage)!)
    self.PokemonName.text = pokemon.name

    self.PokemonId.text = "\(PokemonIdInPokeApi)"

  }

  func getIdPokemonInPokeApi(url:String) -> String{

    let StringActions = StringOperations()
    return StringActions.GetPokemonNumber(urlDataAsString: url)

  }

  override func prepareForReuse() {
    super.prepareForReuse()

    self.pokemonImage.af.cancelImageRequest()
  }

}
