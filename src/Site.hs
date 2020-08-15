--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
import           Data.Monoid (mappend)
import           Hakyll

import           Site.Core

--------------------------------------------------------------------------------
main :: IO ()
main = hakyll $ do

------------------
--- ASSETS 
------------------
    match "assets/**" $ do
        route   idRoute
        compile copyFileCompiler

------------------
--- Projects 
------------------
    match "content/projects/**.md" $ do
        route $ stripContent +||+ setExtension "html"
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/project.html" projectCtx
            >>= loadAndApplyTemplate "templates/default.html" projectCtx
            >>= relativizeUrls

    match "content/projects/index.html" $ do
        route stripContent
        compile $ do
            projects <- recentFirst =<< loadAll "content/projects/**.md"
            let indexCtx =
                    listField "projects" projectCtx (return projects) `mappend`
                    defaultContext
            getResourceBody
                >>= applyAsTemplate indexCtx
                >>= loadAndApplyTemplate "templates/default.html" indexCtx
                >>= relativizeUrls

------------------
--- Thoughts
------------------
    match "content/thoughts/**.md" $ do
        route $ stripContent +||+ setExtension "html"
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/thought.html" thoughtCtx
            >>= loadAndApplyTemplate "templates/default.html" thoughtCtx
            >>= relativizeUrls

    match "content/thoughts/index.html" $ do
        route stripContent
        compile $ do
            thoughts <- recentFirst =<< loadAll "content/thoughts/**.md"
            let indexCtx =
                    listField "thoughts" thoughtCtx (return thoughts) `mappend`
                    defaultContext
            getResourceBody
                >>= applyAsTemplate indexCtx
                >>= loadAndApplyTemplate "templates/default.html" indexCtx
                >>= relativizeUrls

------------------
--- Stuff
------------------
    match "content/stuff/**.md" $ do
        route $ stripContent +||+ setExtension "html"
        compile $ pandocCompiler
            >>= loadAndApplyTemplate "templates/default.html" stuffCtx
            >>= relativizeUrls

------------------
--- PGP
------------------
    match "content/pgp/index.html" $ do
        route stripContent
        compile $ do
            getResourceBody
                >>= applyAsTemplate defaultContext
                >>= loadAndApplyTemplate "templates/default.html" defaultContext
                >>= relativizeUrls
    
    match "content/pgp/key.asc" $ do
        route   stripContent
        compile copyFileCompiler

------------------
--- MISC
------------------
    match "content/error.html" $ do
        route stripContent
        compile $ do
            getResourceBody
                >>= applyAsTemplate defaultContext
                >>= loadAndApplyTemplate "templates/default.html" defaultContext
                >>= relativizeUrls

    match "content/index.html" $ do
        route stripContent
        compile $ do
            projects <- recentFirst =<< loadAll "content/projects/**.md"
            thoughts <- recentFirst =<< loadAll "content/thoughts/**.md"
            stuff    <- recentFirst =<< loadAll "content/stuff/**.md"
            let indexCtx =
                    listField "projects" projectCtx (return projects) `mappend`
                    listField "thoughts" thoughtCtx (return thoughts) `mappend`
                    listField "stuff"    stuffCtx (return stuff) `mappend`
                    defaultContext
            getResourceBody
                >>= applyAsTemplate indexCtx
                >>= loadAndApplyTemplate "templates/default.html" indexCtx
                >>= relativizeUrls

    match "content/favicon.ico" $ do
        route   stripContent
        compile copyFileCompiler

    match "templates/**.html" $ compile templateBodyCompiler

--------------------------------------------------------------------------------
projectCtx :: Context String
projectCtx = defaultContext

thoughtCtx :: Context String
thoughtCtx =
        dateField "date" "%Y-%m-%d" `mappend`
        defaultContext

stuffCtx :: Context String
stuffCtx = defaultContext
