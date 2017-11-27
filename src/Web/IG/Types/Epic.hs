{-# LANGUAGE DeriveGeneric              #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
-- |
-- Copyright   : 2017, Mateusz Kowalczyk
-- License     : BSD3
-- Maintainer  : fuuzetsu@fuuzetsu.co.uk
-- Stability   : experimental
module Web.IG.Types.Epic
  ( Epic(..)
  ) where

import qualified Data.Aeson as Aeson
import           Data.Text (Text)
import           GHC.Generics (Generic)

-- | IG instrument identifier, eg @X.D.EURGBP.CASH.IP@.
newtype Epic = Epic { unEpic :: Text }
  deriving (Show, Eq, Ord, Generic, Aeson.ToJSON, Aeson.FromJSON)
