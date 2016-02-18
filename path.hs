import System.IO
import System.Directory
import System.FilePath
import System.Environment
import Data.List

slice :: Int -> Int -> [Char] -> [Char]
slice from to xs = Data.List.take (to - from + 1) (Data.List.drop from xs)


getDir :: [String] -> FilePath
getDir args = System.FilePath.makeValid (Data.List.head args)

-- OS X 上面，该方法无效
-- System.Directory.listDirectory

main :: IO ()
main = do
    pwd  <- System.Directory.getCurrentDirectory
    args <- System.Environment.getArgs
    let path = if (Data.List.length args ) > 0 then getDir args else pwd

    System.IO.putStr "Path: "
    System.IO.print path
    files <- System.Directory.getDirectoryContents path
    let ss = filter (\fname -> 
                        fname /= (System.FilePath.makeValid ".") 
                        && fname /= (System.FilePath.makeValid "..")
                    ) 
                    files

    System.IO.putStrLn "Files: "
    System.IO.print files

    sequence (map (\_ -> System.IO.putStr "*" ) [1..80])
    System.IO.putStr "\n"

    System.IO.print ss
