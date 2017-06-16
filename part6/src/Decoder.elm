module Decoder
    exposing
        ( searchResultDecoder
        , responseDecoder
        , decodeResults
        , SearchResult
        )

import Json.Decode
    exposing
        ( Decoder
        , int
        , string
        , list
        , decodeString
        )
import Json.Decode.Pipeline exposing (required, decode)


type alias SearchResult =
    { id : Int
    , name : String
    , stars : Int
    }


searchResultDecoder : Decoder SearchResult
searchResultDecoder =
    decode SearchResult
        |> required "id" int
        |> required "full_name" string
        |> required "stargazers_count" int


responseDecoder : Decoder (List SearchResult)
responseDecoder =
    decode identity
        |> required "items" (list searchResultDecoder)


decodeResults : String -> List SearchResult
decodeResults json =
    case decodeString responseDecoder json of
        Ok searchResults ->
            searchResults

        Err errorMessage ->
            []
