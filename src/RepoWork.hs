module RepoWork where

import System.PosixCompat.Files
import System.IO
import System.Process
import Data.List
import Data.List.Split
import System.Process
import System.FilePath ((</>))
import System.Directory (doesDirectoryExist, getDirectoryContents, getCurrentDirectory)


runCommandTest :: IO String
runCommandTest = do
    (_, Just hout, _, _) <- createProcess(proc "ls" []){ std_out = CreatePipe }
    hGetContents hout

sendCommand :: (String, String) -> IO String
sendCommand (cmd, args) = do
    (_, Just hout, _, _) <- createProcess(proc cmd $ words args){ std_out = CreatePipe }
    hGetContents hout

-- runArgon :: String -> IO String
-- runArgon file = sendCommand("stack", "exec recursive-line-count " ++ file)

runArgon :: String -> IO String
runArgon filename = do
    content <- readFile filename
    -- liftIO $ putStrLn "Count Access"
    return $ show $ length $ lines content

simpleFileSize :: String -> IO String
simpleFileSize path = do
  h <- openFile path ReadMode
  size <- hFileSize h
  hClose h
  return $ show size

gitClone :: String -> IO ()
gitClone repo = callProcess "git" ["clone", repo]

removeRepo :: String -> IO ()
removeRepo repo = do
    callProcess "rm" ["-rf", repo]
    putStrLn $ repo ++ " removed."
