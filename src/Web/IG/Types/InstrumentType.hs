{-# LANGUAGE DeriveGeneric     #-}
-- |
-- Copyright   : 2017, Mateusz Kowalczyk
-- License     : BSD3
-- Maintainer  : fuuzetsu@fuuzetsu.co.uk
-- Stability   : experimental
module Web.IG.Types.InstrumentType
  ( InstrumentType(..)
  ) where

import qualified Data.Aeson as Aeson
import qualified Data.Aeson.Types as Aeson (typeMismatch)
import qualified Data.Text as T
import           GHC.Generics (Generic)
import           Text.Read (readMaybe)

-- | Instrument type
data InstrumentType =
    -- | Binaries
    BINARY
    -- | Capped bungees
  | BUNGEE_CAPPED
    -- | Commodity bungees
  | BUNGEE_COMMODITIES
    -- | Currency bungees
  | BUNGEE_CURRENCIES
    -- | Index bungees
  | BUNGEE_INDICES
    -- | Commodities
  | COMMODITIES
    -- | Currencies
  | CURRENCIES
    -- | Indices
  | INDICES
    -- | Commodity options
  | OPT_COMMODITIES
    -- | Currency options
  | OPT_CURRENCIES
    -- | Index options
  | OPT_INDICES
    -- | FX options
  | OPT_RATES
    -- | Share options
  | OPT_SHARES
    -- | Rates
  | RATES
    -- | Sectors
  | SECTORS
    -- | Shares
  | SHARES
    -- | Sprint Market
  | SPRINT_MARKET
    -- | Test market
  | TEST_MARKET
    -- | Unknown
  | UNKNOWN
  deriving (Show, Eq, Ord, Generic, Read)

instance Aeson.FromJSON InstrumentType where
  parseJSON = Aeson.withText "InstrumentType" $ \e -> case readMaybe (T.unpack e) of
    Just c -> pure c
    Nothing -> Aeson.typeMismatch "InstrumentType" (Aeson.String e)
