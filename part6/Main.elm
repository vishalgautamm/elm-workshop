module Main exposing (..)

import Html exposing (Html, beginnerProgram)
import Model exposing (Model, initialModel)
import Update exposing (update, Msg)
import View exposing (view)


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { view = view
        , update = update
        , model = initialModel
        }
