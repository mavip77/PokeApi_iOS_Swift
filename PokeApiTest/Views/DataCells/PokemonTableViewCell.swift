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

        selectedBackgroundView = {
              let view = UIView.init()
          view.backgroundColor = .cyan
              return view

    }()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

  public func Populate(pokemon:Pokemon?){


    if let pokemon = pokemon{


      let urlImage = ConstantansApp.URL_POKEMON_IMAGE_BASE + "\(pokemon.id!)" + ConstantansApp.POSTFIX_POKEMON_IMAGE_URL
      self.pokemonImage.af.setImage(withURL: URL(string: urlImage)!)
      self.PokemonName.text = pokemon.name

      let index = Int(pokemon.id!)

      let indexAsString = "#" + String(format: "%04d", index as! CVarArg)

      self.PokemonId.text = indexAsString

      
    }



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
