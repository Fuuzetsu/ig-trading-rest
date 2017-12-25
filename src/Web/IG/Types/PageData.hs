{-# LANGUAGE DeriveGeneric #-}
-- |
-- Copyright   : 2017, Mateusz Kowalczyk
-- License     : BSD3
-- Maintainer  : fuuzetsu@fuuzetsu.co.uk
-- Stability   : experimental
module Web.IG.Types.PageData
  ( PageData(..)
  ) where

import qualified Data.Aeson as Aeson
import           GHC.Generics (Generic)

-- | Paging metadata
data PageData = PageData
  { -- | Page number
    pageNumber :: !Int
    -- | Page size
  , pageSize :: !Int
    -- | Total number of pages
  , totalPages :: !Int
  } deriving (Show, Eq, Ord, Generic)

instance Aeson.ToJSON PageData where
  toEncoding = Aeson.genericToEncoding Aeson.defaultOptions

instance Aeson.FromJSON PageData where
  parseJSON = Aeson.genericParseJSON Aeson.defaultOptions
