{-# LANGUAGE DeriveGeneric #-}
-- |
-- Copyright   : 2017, Mateusz Kowalczyk
-- License     : BSD3
-- Maintainer  : fuuzetsu@fuuzetsu.co.uk
-- Stability   : experimental
module Web.IG.Types.Deal
  ( Deal(..)
  ) where

import qualified Data.Aeson as Aeson
import           GHC.Generics (Generic)
import           Web.IG.Types.AffectedDealStatus (AffectedDealStatus)
import           Web.IG.Types.DealId (DealId)

-- | Working order type
data Deal = Deal
  { -- | Deal identifier
    dealId :: !DealId
  , status :: !AffectedDealStatus
  } deriving (Show, Eq, Ord, Generic)

instance Aeson.ToJSON Deal where
  toEncoding = Aeson.genericToEncoding Aeson.defaultOptions

instance Aeson.FromJSON Deal where
  parseJSON = Aeson.genericParseJSON Aeson.defaultOptions
