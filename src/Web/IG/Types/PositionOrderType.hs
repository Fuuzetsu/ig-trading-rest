{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}
-- |
-- Copyright   : 2017, Mateusz Kowalczyk
-- License     : BSD3
-- Maintainer  : fuuzetsu@fuuzetsu.co.uk
-- Stability   : experimental
module Web.IG.Types.PositionOrderType
  ( PositionOrderType(..)
  ) where

import qualified Data.Aeson as Aeson
import qualified Data.Aeson.Types as Aeson (typeMismatch)
import           Data.Text (Text)
import           GHC.Generics (Generic)

-- | Working order type
data PositionOrderType =
    -- | Limit orders get executed at the price seen by IG at the
    -- moment of booking a trade. A limit determines the level at
    -- which the order or the remainder of the order will be rejected.
    LIMIT
    -- | Market orders get executed at the price seen by the IG at the
    -- time of booking the trade. A level cannot be specified. Not
    -- applicable to BINARY instruments
  | MARKET
    -- | Quote orders get executed at the specified level. The level
    -- has to be accompanied by a valid quote id. This type is only
    -- available subject to agreement with IG.
  | QUOTE
  deriving (Show, Eq, Ord, Generic)

instance Aeson.ToJSON PositionOrderType where
  toEncoding LIMIT = Aeson.toEncoding ("LIMIT" :: Text)
  toEncoding MARKET = Aeson.toEncoding ("MARKET" :: Text)
  toEncoding QUOTE = Aeson.toEncoding ("QUOTE" :: Text)

instance Aeson.FromJSON PositionOrderType where
  parseJSON (Aeson.String "LIMIT") = pure LIMIT
  parseJSON (Aeson.String "MARKET") = pure MARKET
  parseJSON (Aeson.String "QUOTE") = pure QUOTE
  parseJSON invalid = Aeson.typeMismatch "PositionOrderType" invalid
