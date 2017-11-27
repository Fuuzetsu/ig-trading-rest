{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}
-- |
-- Copyright   : 2017, Mateusz Kowalczyk
-- License     : BSD3
-- Maintainer  : fuuzetsu@fuuzetsu.co.uk
-- Stability   : experimental
module Web.IG.Types.WorkingOrderType
  ( WorkingOrderType(..)
  ) where

import qualified Data.Aeson as Aeson
import qualified Data.Aeson.Types as Aeson (typeMismatch)
import           Data.Text (Text)
import           GHC.Generics (Generic)

-- | Working order type
data WorkingOrderType =
    -- | Limit working order
    LIMIT
    -- | Stop working order
  | STOP
  deriving (Show, Eq, Ord, Generic)

instance Aeson.ToJSON WorkingOrderType where
  toEncoding LIMIT =
    Aeson.toEncoding ("LIMIT" :: Text)
  toEncoding STOP =
    Aeson.toEncoding ("STOP" :: Text)

instance Aeson.FromJSON WorkingOrderType where
  parseJSON (Aeson.String "LIMIT") = pure LIMIT
  parseJSON (Aeson.String "STOP") = pure STOP
  parseJSON invalid = Aeson.typeMismatch "WorkingOrderType" invalid
