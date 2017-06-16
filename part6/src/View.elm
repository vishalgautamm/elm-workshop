module View exposing (..)

import Model exposing (Model)
import Decoder exposing (SearchResult)
import Update exposing (update, Msg(..))
import Html
    exposing
        ( Html
        , header
        , div
        , h1
        , text
        , span
        , input
        , button
        , ul
        , li
        , a
        )
import Html.Events exposing (onClick, onInput)
import Html.Attributes
    exposing
        ( class
        , target
        , href
        , property
        , defaultValue
        )


view : Model -> Html Msg
view model =
    div [ class "content" ]
        [ header []
            [ h1 [] [ text "ElmHub" ]
            , span [ class "tagline" ] [ text "Like GitHub, but for Elm things." ]
            ]
        , input [ class "search-query", onInput SetQuery, defaultValue model.query ] []
        , button [ class "search-button" ] [ text "Search" ]
        , ul [ class "results" ]
            (List.map viewSearchResult model.results)
        ]


viewSearchResult : SearchResult -> Html Msg
viewSearchResult result =
    li []
        [ span [ class "star-count" ] [ text (toString result.stars) ]
        , a [ href ("https://github.com/" ++ result.name), target "_blank" ]
            [ text result.name ]
        , button [ class "hide-result", onClick (DeleteById result.id) ]
            [ text "X" ]
        ]
