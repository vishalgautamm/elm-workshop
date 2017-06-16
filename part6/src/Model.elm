module Model
    exposing
        ( Model
        , initialModel
        )

import Decoder
    exposing
        ( searchResultDecoder
        , responseDecoder
        , decodeResults
        , SearchResult
        )
import SampleResponse


type alias Model =
    { query : String
    , results : List SearchResult
    }


initialModel : Model
initialModel =
    { query = "tutorial"
    , results = decodeResults SampleResponse.json
    }
