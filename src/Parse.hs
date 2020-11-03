{-# LANGUAGE DeriveGeneric #-}

module Parse (
    parse,
    Records (records)
) where

import Data.Aeson
import qualified Data.ByteString.Lazy.Char8 as L8
import GHC.Generics

data Record = Record {
    dateRep :: String,
    month :: String,
    cases :: Int,
    deaths :: Int,
    countriesAndTerritories :: String,
    continentExp :: String
} deriving (Show, Generic)

data Records = Records {
    records :: [Record]
} deriving (Show, Generic)

instance FromJSON Record
instance ToJSON Record

instance FromJSON Records
instance ToJSON Records

parse :: L8.ByteString -> Either String Records
parse json = eitherDecode json :: Either String Records