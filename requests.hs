import System.IO
import Network.HTTP
import System.Environment
import Data.List

get :: String -> IO String
get url = Network.HTTP.simpleHTTP (Network.HTTP.getRequest url) >>= Network.HTTP.getResponseBody

getCode :: String -> IO ResponseCode
getCode url = Network.HTTP.simpleHTTP req >>= Network.HTTP.getResponseCode
    where req = Network.HTTP.getRequest url

slice :: Int -> Int -> [Char] -> [Char]
slice from to xs = take (to - from + 1) (drop from xs)

getURL :: [String] -> String
getURL args = do
    let arg = Data.List.head args
    let url = if (slice 0 6 arg) /= "http://" then "http://" ++ arg else arg
    url

main :: IO ()
main = do
    let defaultURL = "http://www.baidu.com"
    args <- System.Environment.getArgs
    let url = if (Data.List.length args ) > 0 then getURL args else defaultURL
    System.IO.putStrLn ("HTTP GET: " ++ url)

    body <- get url
    System.IO.putStrLn body

