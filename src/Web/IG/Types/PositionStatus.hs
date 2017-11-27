{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE OverloadedStrings #-}
-- |
-- Copyright   : 2017, Mateusz Kowalczyk
-- License     : BSD3
-- Maintainer  : fuuzetsu@fuuzetsu.co.uk
-- Stability   : experimental
module Web.IG.Types.PositionStatus
  ( PositionStatus(..)
  ) where

import qualified Data.Aeson as Aeson
import qualified Data.Aeson.Types as Aeson (typeMismatch)
import           Data.Text (Text)
import           GHC.Generics (Generic)

data PositionStatus =
    -- | Amended
    AMENDED
    -- | Closed
  | CLOSED
    -- | Deleted
  | DELETED
    -- | Open
  | OPEN
    -- | Partially Closed
  | PARTIALLY_CLOSED
  deriving (Show, Eq, Ord, Generic)

instance Aeson.FromJSON PositionStatus where
  parseJSON (Aeson.String "AMENDED") = pure AMENDED
  parseJSON (Aeson.String "CLOSED") = pure CLOSED
  parseJSON (Aeson.String "DELETED") = pure DELETED
  parseJSON (Aeson.String "OPEN") = pure OPEN
  parseJSON (Aeson.String "PARTIALLY_CLOSED") = pure PARTIALLY_CLOSED
  parseJSON invalid = Aeson.typeMismatch "PositionStatus" invalid

instance Aeson.ToJSON PositionStatus where
  toEncoding AMENDED = Aeson.toEncoding ("AMENDED" :: Text)
  toEncoding CLOSED = Aeson.toEncoding ("CLOSED" :: Text)
  toEncoding DELETED = Aeson.toEncoding ("DELETED" :: Text)
  toEncoding OPEN = Aeson.toEncoding ("OPEN" :: Text)
  toEncoding PARTIALLY_CLOSED = Aeson.toEncoding ("PARTIALLY_CLOSED" :: Text)
