{-

  Unhelpful error messages in Elm closures (deliberately not a minimal code example, to illustrate the message).

-}
module Tricky where

import List
import Dict
import Math.Vector2 as V2

type alias ParsedSvgData = { id       : String 
                           , title    : String
                           , polygons : List ( List ( Float, Float ) ) }

type alias Country = { code  : String
                     , name  : String
                     , lines : List Line }

type alias Line = ( { a1 : V2.Vec2 }, { a2 : V2.Vec2 } )

scale = 1.2

{- Eg. 1 : Record error - message identifies entire let (relatively easy to solve as record syntax reported) -}
{-
hacky1 : Dict.Dict String ParsedSvgData -> List Country
hacky1 countryShapes =

    let countryShapeList = Dict.toList countryShapes

        makeVector ( x, y ) = V2.vec2 ( x / scale ) ( y / scale )

        makeMoreComplicated something =
            case something of
                head :: tail -> ( { a1 = head }, { a2 = tail } )

        makeVectors floatTupleList = List.map makeVector floatTupleList

        makeTuples vectors = 
            let helper v1 v2 = ( { a1 = v1 }, { a1 = v2 } )           {- invalid field here -}
            in
              case vectors of
                _ :: tail -> List.map2 helper vectors ( tail )

        makeLines polygons =
            case polygons of
              first :: rest -> makeTuples ( makeVectors first ) ++ ( makeLines rest )
              _             -> []

        makeCountry ( id, record ) =
            { code  = id
            , name  = record.title
            , lines = makeLines record.polygons }

    in
      List.map makeCountry countryShapeList
-}

{- Eg. 2 : Type error - now you have a real headache, and may need to decompose your function   -}
hacky2 : Dict.Dict String ParsedSvgData -> List Country
hacky2 countryShapes =

    let countryShapeList = Dict.toList countryShapes

        makeVector ( x, y ) = ( ( x / scale ), ( y / scale ) ) {- Incorrect type here (should be Vec2) -}

        makeMoreComplicated something =
            case something of
                head :: tail -> ( { a1 = head }, { a2 = tail } )

        makeVectors floatTupleList = List.map makeVector floatTupleList

        makeTuples vectors = 
            let helper v1 v2 = ( { a1 = v1 }, { a2 = v2 } )
            in
              case vectors of
                _ :: tail -> List.map2 helper vectors ( tail )

        makeLines polygons =
            case polygons of
              first :: rest -> makeTuples ( makeVectors first ) ++ ( makeLines rest )
              _             -> []

        makeCountry ( id, record ) =
            { code  = id
            , name  = record.title
            , lines = makeLines record.polygons }

    in
      List.map makeCountry countryShapeList

{- Error free code - type declarations improve reporting immensely, but aren't always used when prototyping -}
{-
meticulous : Dict.Dict String ParsedSvgData -> List Country
meticulous countryShapes =

    let countryShapeList = Dict.toList countryShapes

        makeVector : ( Float, Float ) -> V2.Vec2
        makeVector ( x, y ) = V2.vec2 ( x / scale ) ( y / scale )

        makeVectors : List ( Float, Float ) -> List V2.Vec2
        makeVectors floatTupleList = List.map makeVector floatTupleList

        makeTuples : List V2.Vec2 -> List Line
        makeTuples vectors = 
            let helper v1 v2 = ( { a1 = v1 }, {a2 = v2 } )
            in
              case vectors of
                _ :: tail -> List.map2 helper vectors ( tail )

        makeLines : List ( List ( Float, Float ) ) -> List Line
        makeLines polygons =
            case polygons of
              first :: rest -> makeTuples ( makeVectors first ) ++ ( makeLines rest )
              _             -> []

        makeCountry : ( String, ParsedSvgData ) -> Country
        makeCountry ( id, record ) =
            { code  = id
            , name  = record.title
            , lines = makeLines record.polygons }

    in
      List.map makeCountry countryShapeList
-}