{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}
-- |
-- Copyright   : 2017, Mateusz Kowalczyk
-- License     : BSD3
-- Maintainer  : fuuzetsu@fuuzetsu.co.uk
-- Stability   : experimental
module Web.IG.Types.AffectedDealStatus
  ( AffectedDealStatus(..)
  ) where

import qualified Data.Aeson as Aeson
import qualified Data.Aeson.Types as Aeson (typeMismatch)
import           Data.Text (Text)
import           GHC.Generics (Generic)

data AffectedDealStatus =
    -- | Amended
    AMENDED
    -- | Deleted
  | DELETED
    -- | Fully closed
  | FULLY_CLOSED
    -- | Opened
  | OPENED
    -- | Partially closed
  | PARTIALLY_CLOSED
  deriving (Show, Eq, Ord, Generic)

instance Aeson.FromJSON AffectedDealStatus where
  parseJSON (Aeson.String "AMENDED") = pure AMENDED
  parseJSON (Aeson.String "DELETED") = pure DELETED
  parseJSON (Aeson.String "FULLY_CLOSED") = pure FULLY_CLOSED
  parseJSON (Aeson.String "OPENED") = pure OPENED
  parseJSON (Aeson.String "PARTIALLY_CLOSED") = pure PARTIALLY_CLOSED
  parseJSON invalid = Aeson.typeMismatch "AffectedDealStatus" invalid

instance Aeson.ToJSON AffectedDealStatus where
  toEncoding AMENDED = Aeson.toEncoding ("AMENDED" :: Text)
  toEncoding DELETED = Aeson.toEncoding ("DELETED" :: Text)
  toEncoding FULLY_CLOSED = Aeson.toEncoding ("FULLY_CLOSED" :: Text)
  toEncoding OPENED = Aeson.toEncoding ("OPENED" :: Text)
  toEncoding PARTIALLY_CLOSED = Aeson.toEncoding ("PARTIALLY_CLOSED" :: Text)
