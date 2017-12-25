{-# LANGUAGE DeriveGeneric #-}
-- |
-- Copyright   : 2017, Mateusz Kowalczyk
-- License     : BSD3
-- Maintainer  : fuuzetsu@fuuzetsu.co.uk
-- Stability   : experimental
module Web.IG.Prices.Epic.Get.Version3.Request
  ( Request(..)
  ) where

import qualified Data.Aeson as Aeson
import           Data.Text (Text)
import           GHC.Generics (Generic)
import           Web.IG.Types.Resolution (Resolution)

-- | Returns historical prices for a particular instrument. By default
-- returns the minute prices within the last 10 minutes.
data Request = Request
  { -- | Price resolution
    resolution :: !(Maybe Resolution)
    -- | Start date time @(yyyy-MM-dd'T'HH:mm:ss)@
  , from :: !(Maybe Text)
    -- | End date time @(yyyy-MM-dd'T'HH:mm:ss)@
  , to :: !(Maybe Text)
    -- | Limits the number of price points (not applicable if a date
    -- range has been specified)
  , max :: !(Maybe Int)
    -- | Page size (disable paging = 0)
  , pageSize :: !Int
    -- | Page number
  , pageNumber :: !Int
  } deriving (Show, Eq, Ord, Generic)

instance Aeson.ToJSON Request where
  toEncoding = Aeson.genericToEncoding Aeson.defaultOptions
