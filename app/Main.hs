module Main where

import HTTP
import Parse

main :: IO ()
main = do
    let url = "https://opendata.ecdc.europa.eu/covid19/casedistribution/json/"
    json <- download url
    case (parse json) of
        Left error -> print error
        Right recs -> print . head $ (records recs)
