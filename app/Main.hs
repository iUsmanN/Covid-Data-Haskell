module Main where

import HTTP

main :: IO ()
main = do
    let url = "https://opendata.ecdc.europa.eu/covid19/casedistribution/json/"
    json <- download url
    print json
