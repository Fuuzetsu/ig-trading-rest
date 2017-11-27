{-# LANGUAGE DeriveGeneric #-}
-- |
-- Copyright   : 2017, Mateusz Kowalczyk
-- License     : BSD3
-- Maintainer  : fuuzetsu@fuuzetsu.co.uk
-- Stability   : experimental
module Web.IG.Confirms.DealReference.Get.Version1.Response
  ( Response(..)
  ) where

import qualified Data.Aeson as Aeson
import           Data.Text (Text)
import qualified Data.Vector as V
import           GHC.Generics (Generic)
import           Web.IG.Types.Deal (Deal)
import           Web.IG.Types.DealCondition (DealCondition)
import           Web.IG.Types.DealId (DealId)
import           Web.IG.Types.DealStatus (DealStatus)
import           Web.IG.Types.Direction (Direction)
import           Web.IG.Types.Epic (Epic)
import           Web.IG.Types.PositionStatus (PositionStatus)

-- | Deal confirmation
data Response = Response
  { -- | Affected deal
    affectedDeals :: !(V.Vector Deal)
    -- | Transaction date
  , date :: !Text
    -- | Deal identifier
  , dealId :: !DealId
    -- | Deal reference
  , dealReference :: !Text
    -- | Deal status
  , dealStatus :: !DealStatus
    -- | Deal direction
  , direction :: !Direction
    -- | Instrument epic identifier
  , epic :: !Epic
    -- | Instrument expiry
  , expiry :: !(Maybe Text)
    -- | True if guaranteed stop
  , guaranteedStop :: !Bool
    -- | Level
  , level :: !(Maybe Double)
    -- | Limit distance
  , limitDistance :: !(Maybe Double)
    -- | Limit level
  , limitLevel :: !(Maybe Double)
    -- | Profit
  , profit :: !(Maybe Double)
    -- | Profit currency
  , profitCurrency :: !(Maybe Text)
    -- | Describes the error (or success) condition for the specified
    -- trading operation
  , reason :: !DealCondition
    -- | Size
  , size :: !(Maybe Double)
    -- | Position status
  , status :: !(Maybe PositionStatus)
    -- | Stop distance
  , stopDistance :: !(Maybe Double)
    -- | Stop level
  , stopLevel :: !(Maybe Double)
    -- | True if trailing stop
  , trailingStop :: !Bool
  } deriving (Show, Eq, Ord, Generic)

instance Aeson.ToJSON Response where
  toEncoding = Aeson.genericToEncoding Aeson.defaultOptions

instance Aeson.FromJSON Response where
  parseJSON = Aeson.genericParseJSON Aeson.defaultOptions
