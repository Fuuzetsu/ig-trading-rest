{-# LANGUAGE DeriveGeneric #-}
-- |
-- Copyright   : 2017, Mateusz Kowalczyk
-- License     : BSD3
-- Maintainer  : fuuzetsu@fuuzetsu.co.uk
-- Stability   : experimental
module Web.IG.Types.Resolution
  ( Resolution(..)
  ) where

import qualified Data.Aeson as Aeson
import qualified Data.Aeson.Types as Aeson (typeMismatch)
import           Data.Text (Text)
import qualified Data.Text as T
import           GHC.Generics (Generic)
import           Text.Read (readMaybe)


-- | Defines the resolution of requested prices.
data Resolution =
    -- | 1 day
    DAY
    -- | 1 hour
  | HOUR
    -- | 2 hours
  | HOUR_2
    -- | 3 Hours
  | HOUR_3
    -- | 4 hours
  | HOUR_4
    -- | 1 minute
  | MINUTE
    -- | 10 minutes
  | MINUTE_10
    -- | 15 minutes
  | MINUTE_15
    -- | 2 minutes
  | MINUTE_2
    -- | 3 minutes
  | MINUTE_3
    -- | 30 minutes
  | MINUTE_30
    -- | 5 minutes
  | MINUTE_5
    -- | 1 month
  | MONTH
    -- | 1 second
  | SECOND
    -- | 1 week
  | WEEK
  deriving (Show, Eq, Ord, Generic, Read)

instance Aeson.ToJSON Resolution where
  toEncoding = Aeson.toEncoding . T.pack . show

instance Aeson.FromJSON Resolution where
  parseJSON = Aeson.withText "Resolution" $ \e -> case readMaybe (T.unpack e) of
    Just c -> pure c
    Nothing -> Aeson.typeMismatch "Resolution" (Aeson.String e)
