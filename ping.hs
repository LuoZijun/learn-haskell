
import System.Process (rawSystem, createProcess, proc, StdStream( CreatePipe ), readProcessWithExitCode )
import Control.Concurrent (forkIO, newEmptyMVar, takeMVar, putMVar, MVar, isEmptyMVar, readMVar )
import GHC.Conc (numCapabilities, setNumCapabilities, getNumCapabilities)
import System.Exit (ExitCode( ExitSuccess ))
import Data.Time.Clock.POSIX( getPOSIXTime )
--import System.Environment (getArgs)
--import Control.Parallel (par)

ping :: String -> MVar(String, ExitCode) -> IO ()
ping ip m = do
    (code, output, error) <- readProcessWithExitCode "ping" ["-t", "1", ip ] ""
    --print (ip, code)
    putMVar m (ip, code)
    return ()

main :: IO ()
main = do
    s <- setNumCapabilities 100
    threadNum <- getNumCapabilities
    putStrLn $ "线程数： " ++ show threadNum
    putStrLn $ "核心数： " ++ show numCapabilities

    m <- newEmptyMVar
    let ips    = map ( \ n -> "192.168.1."++(show n) ) [1..250]
    
    btime <- getPOSIXTime
    putStrLn $ "开始："++ (show btime)

    mapM_ ( \ ip -> forkIO (ping ip m) ) ips

    result <- mapM ( \ _ -> takeMVar m ) [1..250]

    etime <- getPOSIXTime
    putStrLn $ "结束："++ (show etime)


    putStrLn $ "扫描结果: "
    print result

    putStrLn $ "耗时：" ++ ( show (etime-btime) )
    

     
