module {Appname} (
  module {Appname}
 ) where

import {Appname}.Helpers.SignalHandlers

{appname}Main :: IO ()
{appname}Main = do
    installSignalHandlers
    putStrLn "Hello from {appname}"
