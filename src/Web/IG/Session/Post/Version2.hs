-- |
-- Copyright   : 2017, Mateusz Kowalczyk
-- License     : BSD3
-- Maintainer  : fuuzetsu@fuuzetsu.co.uk
-- Stability   : experimental
--
-- <https://labs.ig.com/rest-trading-api-reference/service-detail?id=534 /session>
module Web.IG.Session.Post.Version2
  ( Response(..)
  , Request(..)
  ) where

import Servant.API
import Servant.Client
import Web.IG.Session.Post.Version2.Response
import Web.IG.Session.Post.Version2.Request
