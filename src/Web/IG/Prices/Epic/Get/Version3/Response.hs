{-# LANGUAGE DeriveGeneric #-}
-- |
-- Copyright   : 2017, Mateusz Kowalczyk
-- License     : BSD3
-- Maintainer  : fuuzetsu@fuuzetsu.co.uk
-- Stability   : experimental
module Web.IG.Prices.Epic.Get.Version3.Response
  ( Metadata(..)
  , Response(..)
  ) where

import qualified Data.Aeson as Aeson
import           Data.Text (Text)
import qualified Data.Vector as V
import           GHC.Generics (Generic)
import           Web.IG.Types.Allowance (Allowance)
import           Web.IG.Types.HistoricalPrice (HistoricalPrice)
import           Web.IG.Types.InstrumentType (InstrumentType)
import           Web.IG.Types.PageData (PageData)

-- | Response metadata data.
data Metadata = Metadata
  { -- | Paging metadata
    pageData :: !PageData
    -- | Size
  , size :: !Int
    -- | Historical price data allowance
  , allowance :: !Allowance
  } deriving (Show, Eq, Ord, Generic)

instance Aeson.FromJSON Metadata where
  parseJSON = Aeson.genericParseJSON Aeson.defaultOptions

-- | List of prices
data Response = Response
  { -- | Deal reference of the transaction
    instrumentType :: !InstrumentType
    -- | Response metadata data.
  , metadata :: !Metadata
    -- | Historical market price snapshot
  , prices :: !(V.Vector HistoricalPrice)
  } deriving (Show, Eq, Ord, Generic)

instance Aeson.FromJSON Response where
  parseJSON = Aeson.genericParseJSON Aeson.defaultOptions
