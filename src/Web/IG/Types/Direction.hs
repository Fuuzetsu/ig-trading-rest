{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}
-- |
-- Copyright   : 2017, Mateusz Kowalczyk
-- License     : BSD3
-- Maintainer  : fuuzetsu@fuuzetsu.co.uk
-- Stability   : experimental
module Web.IG.Types.Direction
  ( Direction(..)
  ) where

import qualified Data.Aeson as Aeson
import qualified Data.Aeson.Types as Aeson (typeMismatch)
import           Data.Text (Text)
import           GHC.Generics (Generic)

-- | Deal direction
data Direction =
    -- | Buy
    BUY
    -- | Sell
  | SELL
  deriving (Show, Eq, Ord, Generic)

instance Aeson.ToJSON Direction where
  toEncoding BUY = Aeson.toEncoding ("BUY" :: Text)
  toEncoding SELL = Aeson.toEncoding ("SELL" :: Text)

instance Aeson.FromJSON Direction where
  parseJSON (Aeson.String "BUY") = pure BUY
  parseJSON (Aeson.String "SELL") = pure SELL
  parseJSON invalid = Aeson.typeMismatch "Direction" invalid
