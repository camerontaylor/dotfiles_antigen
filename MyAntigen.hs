{-# LANGUAGE OverloadedStrings #-}
module MyAntigen where

import Antigen (
                -- Rudimentary imports
                AntigenConfig (..)
              , defaultConfig
              , bundle
              , antigen
                -- If you want to source a bit trickier plugins , ZshPlugin (..)
              , antigenSourcingStrategy
              , sourcingStrategy
              , filePathsSourcingStrategy
              )

bundles =
  [ bundle "Tarrasch/zsh-functional"
  , bundle "Tarrasch/zsh-bd"
  , bundle "Tarrasch/zsh-colors"
  , bundle "Tarrasch/zsh-command-not-found"
  , bundle "zdharma/fast-syntax-highlighting"
  --, bundle "zsh-users/zsh-history-substring-search"
  , (bundle "zsh-users/zsh-history-substring-search") { sourcingStrategy = antigenSourcingStrategy }

  -- If you use a plugin that doesn't have a *.plugin.zsh file. You can set a
  -- more liberal sourcing strategy.
  --
  -- , (bundle "some/stupid-plugin") { sourcingStrategy = antigenSourcingStrategy }

  -- If you use a plugin that has sub-plugins. You can specify that as well
  --
  -- NOTE: If you want to use oh-my-zsh for real (please don't), you still need
  -- to set the $ZSH env var manually.
  -- , (bundle "robbyrussell/oh-my-zsh")
  --    { sourcingLocations = [ "plugins/wd"
  --                          , "plugins/colorize"] }

  -- Sourcing a list of files
  -- , (bundle "alfredodeza/zsh-plugins")
  --    { sourcingStrategy = filePathsSourcingStrategy
  --                          [ "vi/zle_vi_visual.zsh"
  --                          , "pytest/pytest.plugin.zsh"
  --                          ] }

  -- Alternatively, this way will give you the same result
  -- , (bundle "alfredodeza/zsh-plugins")
  --    { sourcingStrategy = antigenSourcingStrategy
  --    , sourcingLocations = [ "vi"
  --                          , "pytest"
  --                          ] }

  -- vvv    Add your plugins here    vvv
  , bundle "mafredri/zsh-async"
  , bundle "intelfx/pure"
  , bundle "zsh-users/zsh-completions"
  , bundle "zsh-users/zsh-autosuggestions"
  , bundle "supercrabtree/k"
  , bundle "greymd/docker-zsh-completion"
  , bundle "hkupty/ssh-agent"
  , bundle "caarlos0/zsh-pg"
  , bundle "hcgraf/zsh-sudo"
  , bundle "chrissicool/zsh-256color"
  , bundle "akoenig/npm-run.plugin.zsh"
  , bundle "lukechilds/zsh-better-npm-completion"
  ]

config = defaultConfig { plugins = bundles }

main :: IO ()
main = antigen config
