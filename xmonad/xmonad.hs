{-# OPTIONS_GHC -fno-warn-missing-signatures #-}
{-# LANGUAGE TypeSynonymInstances #-}
{-# LANGUAGE MultiParamTypeClasses #-}
import XMonad
import XMonad.Util.EZConfig
import XMonad.Util.Run
import XMonad.Actions.CycleWS
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.SetWMName
import XMonad.Layout.MultiToggle
import XMonad.Layout.MultiToggle.Instances
import XMonad.Layout.PerWorkspace
import XMonad.Layout.Spacing
import XMonad.Layout.ResizableTile
import XMonad.Layout.SimpleFloat

import Data.Char
import Data.List

main = do
    statusbar <- spawnPipe _bar
    xmonad $ def
        {   terminal           = _terminal
        ,   modMask            = _modMask
        ,   borderWidth        = _borderWidth
        ,   workspaces         = _workspaces
        ,   normalBorderColor  = _normalBorderColor
        ,   focusedBorderColor = _focusedBorderColor
        ,   layoutHook         = _layoutHook
        ,   handleEventHook    = _handleEventHook
        ,   logHook            = _logHook statusbar
        ,   startupHook        = _startupHook
        }
        `removeKeys`     _removeKeys
        `additionalKeys` _additionalKeys

------------------------------
-- # color
--
--  color038' : blue
--  color120  : yellow
--  color197  : pink
--  color235  : black
--  color240  : gray
--  color253  : white
--
------------------------------
color038 = "#02aedc"
color120 = "#87ff87"
color197 = "#ff005f"
color235 = "#262626"
color240 = "#585858"
color253 = "#dadada"

------------------------------
-- # bar
------------------------------
_bar =
    "xmobar -i ${HOME}/dotfiles/xmonad/symbols " ++ bgcolor ++ fgcolor
  where
    bgcolor = "-B" ++ wrap " \"" "\" " color235
    fgcolor = "-F" ++ wrap " \"" "\" " color253

------------------------------
-- # terminal
------------------------------
_terminal = "urxvt"

------------------------------
-- # mod mask
------------------------------
_modMask = mod4Mask

------------------------------
-- # border width
------------------------------
_borderWidth = 5

------------------------------
-- # workspaces
------------------------------
_workspaces = ["WEB", "DEV", "TMP", "FLT"]

------------------------------
-- # normal border color
------------------------------
_normalBorderColor = color235

------------------------------
-- # focused border color
------------------------------
_focusedBorderColor = color120

------------------------------
-- # layout hook
------------------------------
_layoutHook =
        avoidStruts
    $   onWorkspace floatWorkspace simpleFloat
    $   spacing 15 normalLayout
  where
    floatWorkspace = last _workspaces
    normalLayout = mkToggle (single FULL) (rtall ||| Mirror rtall)
    rtall = ResizableTall 1 (3/100) (1/2) []
    spacing x = spacingRaw False (Border x x x x) True (Border x x x x) True

------------------------------
-- # handle event hook
------------------------------
_handleEventHook = docksEventHook

------------------------------
-- # log hook
------------------------------
_logHook h = dynamicLogWithPP $ xmobarPP
    {   ppOutput  = hPutStrLn h
    ,   ppOrder   = \(ws:l:_) -> [l, ws]
    ,   ppSep     = "  "
    ,   ppWsSep   = ""
    ,   ppTitle   = const ""
    ,   ppLayout  = toLayoutIcon
    ,   ppCurrent = toWorkspaceIcon . (++ "_c")
    ,   ppVisible = toWorkspaceIcon . (++ "_v")
    ,   ppUrgent  = toWorkspaceIcon . (++ "_u")
    ,   ppHidden  = toWorkspaceIcon . (++ "_h")
    ,   ppHiddenNoWindows = const toWorkspaceIcon "xxx"
    }

toLayoutIcon :: String -> String
toLayoutIcon s =
    "<icon=lay/" ++ opts ++ name ++ ".xpm/>"
  where
    opts = concatMap (map toLower) $ checkLayoutOpts s
    name = map toLower $ lastWord s

checkLayoutOpts :: String -> [String]
checkLayoutOpts s =
  let opts = ["Mirror"]
  in  filter (`elem` words s) opts

lastWord :: String -> String
lastWord s = snd $ splitAt (last $ upperIndices s) s

upperIndices :: String -> [Int]
upperIndices s = sort . nub $ concatMap (`elemIndices` s) ['A'..'Z']

toWorkspaceIcon :: String -> String
toWorkspaceIcon = wrap "<icon=wsp/" ".xpm/>" . map toLower

------------------------------
-- # startup hook
------------------------------
_startupHook = do
    setWMName "LG3D"
    spawn "fcitx-autostart"
    spawn "light-locker --lock-on-suspend"
    spawn "nitrogen --restore"

------------------------------
-- # remove keys
------------------------------
_removeKeys =
    [   (_modMask               , xK_e  )
    ,   (_modMask               , xK_r  )
    ,   (_modMask               , xK_h  )
    ,   (_modMask               , xK_l  )
    ,   (_modMask               , xK_Tab)
    ,   (_modMask .|. shiftMask , xK_Tab)
    ]

------------------------------
-- # additional keys
------------------------------
_additionalKeys =
    [   ((_modMask               , xK_Down  ), sendMessage MirrorShrink)
    ,   ((_modMask               , xK_Up    ), sendMessage MirrorExpand)
    ,   ((_modMask               , xK_Left  ), sendMessage Shrink)
    ,   ((_modMask               , xK_Right ), sendMessage Expand)
    ,   ((_modMask               , xK_i     ), sendMessage $ IncMasterN $ -1)
    ,   ((_modMask               , xK_o     ), sendMessage $ IncMasterN    1)
    ,   ((_modMask               , xK_f     ), sendMessage $ Toggle FULL)
    ,   ((_modMask               , xK_comma ), prevScreen)
    ,   ((_modMask               , xK_period), nextScreen)
    ,   ((_modMask               , xK_Return), spawn _terminal)
    ,   ((_modMask               , xK_w     ), spawn "firefox")
    ,   ((_modMask               , xK_s     ), spawn "light-locker-command -l")
    ,   ((_modMask .|. shiftMask , xK_s     ), spawn "systemctl suspend")
    ,   ((_modMask               , xK_p     ), spawn $ script "screenshot.sh")
    ]

script :: String -> String
script = (++) "sh ${HOME}/dotfiles/xmonad/scripts/"
