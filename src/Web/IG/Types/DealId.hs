{-# LANGUAGE DeriveGeneric              #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
-- |
-- Copyright   : 2017, Mateusz Kowalczyk
-- License     : BSD3
-- Maintainer  : fuuzetsu@fuuzetsu.co.uk
-- Stability   : experimental
module Web.IG.Types.DealId
  ( DealId(..)
  ) where

import qualified Data.Aeson as Aeson
import qualified Data.Aeson.Types as Aeson (typeMismatch)
import           Data.Text (Text)
import           GHC.Generics (Generic)

-- | Deal identifier
newtype DealId = DealId
  { unDealId :: Text
  } deriving (Show, Eq, Ord, Generic, Aeson.ToJSON, Aeson.FromJSON)
