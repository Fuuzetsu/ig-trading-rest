{-# LANGUAGE DeriveGeneric #-}
-- |
-- Copyright   : 2017, Mateusz Kowalczyk
-- License     : BSD3
-- Maintainer  : fuuzetsu@fuuzetsu.co.uk
-- Stability   : experimental
module Web.IG.Types.HistoricalPrice
  ( HistoricalPrice(..)
  ) where

import qualified Data.Aeson as Aeson
import           Data.Text (Text)
import           GHC.Generics (Generic)
import           Web.IG.Types.Price (Price)

-- | Historical market price snapshot
data HistoricalPrice = HistoricalPrice
  { -- | Price
    closePrice :: !Price
    -- | Price
  , highPrice :: !Price
    -- | Last traded volume. This will generally be null for non
    -- exchange-traded instruments
  , lastTradedVolume :: !(Maybe Int)
    -- | Price
  , lowPrice :: !Price
    -- | Price
  , openPrice :: !Price
    -- | Snapshot local time, format is @yyyy/MM/dd hh:mm:ss@
  , snapshotTime :: !Text
    -- | Snapshot time
  , snapshotTimeUTC :: !Text
  } deriving (Show, Eq, Ord, Generic)

instance Aeson.ToJSON HistoricalPrice where
  toEncoding = Aeson.genericToEncoding Aeson.defaultOptions

instance Aeson.FromJSON HistoricalPrice where
  parseJSON = Aeson.genericParseJSON Aeson.defaultOptions
