{-# LANGUAGE DeriveGeneric #-}
-- |
-- Copyright   : 2017, Mateusz Kowalczyk
-- License     : BSD3
-- Maintainer  : fuuzetsu@fuuzetsu.co.uk
-- Stability   : experimental
module Web.IG.Session.Post.Version2.Response
  ( Response(..)
  ) where

import qualified Data.Aeson as Aeson
import           Data.Text (Text)
import qualified Data.Vector as V
import           GHC.Generics (Generic)
import           Web.IG.Types.Account (Account)
import           Web.IG.Types.AccountInfo (AccountInfo)
import           Web.IG.Types.AccountType (AccountType)
import           Web.IG.Types.Environment (Environment)

-- | Summary of client account information returned on successful
-- client login.
--
-- Two security access tokens are returned in the response header, and
-- are required to be submitted via the header in future API requests:
--
-- [CST]: Client session security access token
-- [X-SECURITY-TOKEN]: Account session security access token
--
-- This is used by the v2 Authentication PAPI endpoint
data Response = Response
  { -- | Account financial data
    accountInfo :: !AccountInfo
    -- | Account type
  , accountType :: !AccountType
    -- | Account details
  , accounts :: !(V.Vector Account)
    -- | Client identifier
  , clientId :: !Text
    -- | Account currency
  , currencyIsoCode :: !Text
    -- | Account currency symbol
  , currencySymbol :: !Text
    -- | Active account identifier
  , currentAccountId :: !Text
    -- | Whether the account is enabled for placing trading orders
  , dealingEnabled :: !Bool
    -- | Whether the Client has active demo account
  , hasActiveDemoAccounts :: !Bool
    -- | Whether the Client has active live accounts
  , hasActiveLiveAccounts :: !Bool
    -- | Lightstreamer endpoint for subscribing to account and price updates
  , lightstreamerEndpoint :: !Text
    -- | Describes the environment to be used as the rerouting destination
  , reroutingEnvironment :: !(Maybe Environment)
    -- | Client account timezone offset relative to UTC, expressed in hours
  , timezoneOffset :: !Int
    -- | Whether the account is allowed to set trailing stops on his trades
  , trailingStopsEnabled :: !Bool
  } deriving (Show, Eq, Ord, Generic)

instance Aeson.FromJSON Response where
  parseJSON = Aeson.genericParseJSON Aeson.defaultOptions
