{-# LANGUAGE DeriveGeneric #-}
-- |
-- Copyright   : 2017, Mateusz Kowalczyk
-- License     : BSD3
-- Maintainer  : fuuzetsu@fuuzetsu.co.uk
-- Stability   : experimental
module Web.IG.WorkingOrders.Otc.Post.Version2.Response
  ( Response(..)
  ) where

import qualified Data.Aeson as Aeson
import           Data.Text (Text)
import           GHC.Generics (Generic)

-- | Create working order response
newtype Response = Response
  { -- | Deal reference of the transaction
    dealReference :: Text
  } deriving (Show, Eq, Ord, Generic)

instance Aeson.FromJSON Response where
  parseJSON = Aeson.genericParseJSON Aeson.defaultOptions
