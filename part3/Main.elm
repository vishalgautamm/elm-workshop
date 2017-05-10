module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)


type alias InitModel =
    { query : String, results : List { id : Int, name : String, stars : Int } }


initialModel : InitModel
initialModel =
    { query = "tutorial"
    , results =
        [ { id = 1
          , name = "TheSeamau5/elm-checkerboardgrid-tutorial"
          , stars = 66
          }
        , { id = 2
          , name = "grzegorzbalcerek/elm-by-example"
          , stars = 41
          }
        , { id = 3
          , name = "sporto/elm-tutorial-app"
          , stars = 35
          }
        , { id = 4
          , name = "jvoigtlaender/Elm-Tutorium"
          , stars = 10
          }
        , { id = 5
          , name = "sporto/elm-tutorial-assets"
          , stars = 7
          }
        ]
    }


elmHubHeader : Html msg
elmHubHeader =
    header []
        [ h1 [] [ text "ElmHub" ]
        , span [ class "tagline" ] [ text "Like GitHub, but for Elm things." ]
        ]


view model =
    div [ class "content" ]
        [ elmHubHeader
        , ul [ class "results" ] (List.map viewSearchResult model.results)
        ]


viewSearchResult result =
    li []
        [ span [ class "star-count" ] [ text (toString result.stars) ]
        , a [ href ("https://github.com/" ++ result.name), target "_blank" ]
            [ text result.name ]
        , button
            -- TODO add an onClick handler that sends a DELETE_BY_ID msg
            [ class "hide-result", onClick { operation = "DELETE_BY_ID", data = result.id } ]
            [ text "X" ]
        ]


update msg model =
    -- TODO if msg.operation == "DELETE_BY_ID",
    if msg.operation == "DELETE_BY_ID" then
        { model | results = List.filter (\result -> result.id /= msg.data) model.results }
    else
        model


main =
    Html.beginnerProgram
        { view = view
        , update = update
        , model = initialModel
        }
