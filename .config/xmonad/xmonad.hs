-------------------------------------------------
--  __   __                                _   --
--  \ \ / /                               | |  --
--   \ V / _ __ ___   ___  _ __   __ _  __| |  --      
--    > < | '_ ` _ \ / _ \| '_ \ / _` |/ _` |  --
--   / . \| | | | | | (_) | | | | (_| | (_| |  --
--  /_/ \_\_| |_| |_|\___/|_| |_|\__,_|\__,_|  --
-------------------------------------------------  
-------------------------------------by-Darth06--

-- Important stuff (base)
import XMonad 
import Data.Monoid 
import System.Exit 
import qualified XMonad.StackSet as W 
import qualified Data.Map        as M 

-- Keys
import Graphics.X11.ExtraTypes.XF86 

-- Layouts
import XMonad.Layout.Spacing 
import XMonad.Layout.LayoutModifier
import XMonad.Layout.MultiToggle (mkToggle, single, EOT(EOT), (??))
import XMonad.Layout.MultiToggle.Instances (StdTransformers(MIRROR))
import XMonad.Layout.WindowNavigation
import XMonad.Layout.GridVariants (Grid(Grid))
import XMonad.Layout.Renamed
import XMonad.Layout.ResizableTile

-- Fullscreen
import XMonad.Layout.NoBorders 

-- Xmobar
import XMonad.Hooks.DynamicLog 
import XMonad.Hooks.StatusBar
import XMonad.Util.Loggers 

-- Some IDEs need this import and set wm LG3D
import XMonad.Hooks.SetWMName

------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.
--
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $

    -- launch a terminal
    [ ((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)
    
    -- volume keys
    , ((0, xF86XK_AudioMute), spawn $ "~/.local/bin/volume mute")
    , ((0, xF86XK_AudioLowerVolume), spawn $ "~/.local/bin/volume down")
    , ((0, xF86XK_AudioRaiseVolume), spawn $ "~/.local/bin/volume up")
    
    -- brightness
    -- Increase brightness
    , ((0, xF86XK_MonBrightnessUp), spawn $ "~/.local/bin/backlight up")
    -- Decrease brightness
    , ((0, xF86XK_MonBrightnessDown), spawn $ "~/.local/bin/backlight down")

    -- Microphone
    , ((0, xF86XK_AudioMicMute), spawn $ "pactl set-source-mute @DEFAULT_SOURCE@ toggle") 
 
    -- launch dmenu 
    , ((modm .|. shiftMask, xK_p ), spawn "dmenu_run -i -nb '#00002a' -nf '#cc241d' -sb '#cc241d' -sf '#00002a' -fn 'HackRegular:bold:pixelsize=14'")
    
    -- open the system search box (rofi)  
    , ((modm, xK_p ), spawn $ "~/.local/bin/launcher.sh")
    
    -- quicklinks 
    --quick1
    , ((modm, xK_n ), spawn $ "~/.local/bin/apps.sh")
    --quick2
    , ((modm, xK_v ), spawn $ "~/.local/bin/quicklinks.sh")
    
    -- powermenu (rofi)
    , ((modm, xK_o ), spawn $ "~/.local/bin/powermenu")   

    -- screenshot menu (rofi)
    , ((0, xK_Print ), spawn $ "~/.local/bin/screenshot")
    
    -- lockscreen
    , ((modm, xK_i ), spawn "dm-tool lock")

    -- launch web browser
    , ((modm, xK_g ), spawn "firefox") 

    -- close focused window
    , ((modm .|. shiftMask, xK_c ), kill)

    -- Rotate through the available layout algorithms
    , ((modm, xK_space ), sendMessage NextLayout)
    
    --  Reset the layouts on the current workspace to default
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)

    -- Move focus to the next window
    , ((mod1Mask, xK_Tab ), windows W.focusDown)

    -- Move focus to the next window
    , ((modm, xK_j ), windows W.focusDown)

    -- Move focus to the previous window
    , ((modm, xK_k ), windows W.focusUp)

    -- Swap the focused window and the master window
    , ((modm, xK_Return ), windows W.swapMaster)

    -- Swap the focused window with the next window
    , ((modm .|. shiftMask, xK_j ), windows W.swapDown)

    -- Swap the focused window with the previous window
    , ((modm .|. shiftMask, xK_k ), windows W.swapUp)

    -- Shrink the master area
    , ((modm, xK_h ), sendMessage Shrink)

    -- Expand the master area
    , ((modm, xK_l ), sendMessage Expand)

    -- Push window back into tiling
    , ((modm, xK_t ), withFocused $ windows . W.sink)

    -- Quit xmonad
    , ((modm .|. shiftMask, xK_q ), io (exitWith ExitSuccess))

    -- Restart xmonad
    , ((modm, xK_q ), spawn "xmonad --recompile; xmonad --restart")

    ]
    ++
    --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]

------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events
--
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $

    -- mod-button1, Set the window to floating mode and move by dragging
    [ ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                       >> windows W.shiftMaster))

    -- mod-button2, Raise the window to the top of the stack
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))

    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))

    -- you may also bind events to the mouse scroll wheel (button4 and button5)
    ]

-- Some settings:
-- Alternate focus windows with the mouse pointer:
-- Whether focus follows the mouse pointer.
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = True

-- Whether clicking on a window to focus also passes the click to the window
myClickJustFocuses :: Bool
myClickJustFocuses = False

---- The default number of workspaces (virtual screens) and their names.
-- By default we use numeric strings, but any string may be used as a
-- workspace name. The number of workspaces is determined by the length
-- of this list.
--
-- A tagging example:
--
-- > workspaces = ["web", "irc", "code" ] ++ map show [4..9]
--
-- Others examples: 
--
--myWorkspaces = [" www ", " dev ", " sys ", " doc ", " win ", " chat ", " mus ", " vid ", " vbox "]
--myWorkspaces    = ["I","II","III","IV","V","VI","VII","VIII","IX","X"]
--Darth06
--myWorkspaces    = ["\58968","\985630","\986031","\983712","\986413","\983598","\62479","\61441","\985125"] 
--vinicius
--myWorkspaces    = ["\58968","\985630","\986031","\983712","<fc=#e3d18a><fn=3>\xf02a0</fn></fc>","\983598","\62479","\61441","\985125"] 
myWorkspaces =
          "<fc=#fc514e><fn=3>\xe658</fn></fc>":
          "<fc=#1919e6><fn=3>\xf0a1e</fn></fc>":
          "<fc=#e3d18a><fn=3>\xf0baf</fn></fc>":
          "<fc=#ff5874><fn=3>\xf02a0</fn></fc>":
          "<fc=#a1cd5e><fn=3>\xf02a0</fn></fc>":
          "<fc=#82aaff><fn=3>\xf02a0</fn></fc>":
          "<fc=#c792ea><fn=3>\xf02a0</fn></fc>":
          "<fc=#7fdbca><fn=3>\xf02a0</fn></fc>":
          "<fc=#7c8f8f><fn=3>\xf02a0</fn></fc>":
          []

--Turn your Woskspaces clickable... Obs: Need xdotool instaled in your system.
myClickableWorkspaces :: [String]
myClickableWorkspaces = clickable 
           -- $ [" 1 ", " 2 ", " 3 ", " 4 ", " 5 ", " 6 ", " 7 ", " 8 ", " 9 "]
           -- $ [" \58968","\985630","\986031","\983712","\986413","\983598","\62479","\61441","\985125"]
           $ myWorkspaces 
    where
        clickable l = [ "<action=xdotool key super+" ++ show (n) ++ ">" ++ ws ++ "</action>" |
                  (i,ws) <- zip [1..9] l,
                  let n = i ]

------------------------------------------------------------------------
-- Layouts:
-- You can specify and transform your layouts by modifying these values.
-- If you change layout bindings be sure to use 'mod-shift-space' after
-- restarting (with 'mod-q') to reset your layout state to the new
-- defaults, as xmonad preserves your old layout settings by default.
--
-- The available layouts.  Note that each layout is separated by |||,
-- which denotes layout choice.
--
--Makes setting the spacingRaw simpler to write. The spacingRaw module adds a configurable amount of space around windows.

mySpacing :: Integer -> l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
mySpacing i = spacingRaw False (Border i i i i) True (Border i i i i) True

vwm     = renamed [Replace "vwm"]
           $ smartBorders
           $ windowNavigation
           $ Full

dev      = renamed [Replace "dev"]
           $ smartBorders
           $ windowNavigation
           $ ResizableTall 1 (3/100) (1/2) []

grid     = renamed [Replace "grid"]
           $ smartBorders
           $ windowNavigation
           $ mySpacing 8
           $ mkToggle (single MIRROR)
           $ Grid (16/10)

devI 	 = renamed [Replace "devI"]
           $ smartBorders
	       $ windowNavigation
	       $ Mirror 
           $ dev

devII	 = renamed [Replace "devII"]
	       $ smartBorders
	       $ windowNavigation
	       $ mySpacing 8
	       $ Mirror 
           $ dev

-- The layout hook
myLayoutHook = mkToggle (EOT) myDefaultLayout

  where
    myDefaultLayout = vwm
		      ||| dev
              ||| grid
		      ||| devI
		      ||| devII
              
--------------------------------------------------------------------------
-- Window rules:

-- Execute arbitrary actions and WindowSet manipulations when managing
-- a new window. You can use this to, for example, always float a
-- particular program, or have a client always appear on a particular
-- workspace.
--
-- To find the property name associated with a program, use
-- > xprop | grep WM_CLASS
-- and click on the client you're interested in.
--
-- To match on the WM_NAME, you can use 'title' in the same way that
-- 'className' and 'resource' are used below.
--
myManageHook = composeAll
    [ className =? "MPlayer"        --> doFloat
    , className =? "Gimp"           --> doFloat
    , className =? "netbeans"       --> doFloat
    , className =? "feh" 	        --> doFloat
    , className =? "mpv" 	        --> doFloat
    , className =? "vlc" 	        --> doFloat
    , className =? "kcalc" 	        --> doFloat
    , className =? "qalculate-gtk"  --> doFloat
    , resource  =? "desktop_window" --> doIgnore
    , resource  =? "kdesktop"       --> doIgnore]

------------------------------------------------------------------------
-- Custom PP, configure it as you like. It determines what is being written to the bar.
--
-- Darth06:
myXmobarPP :: PP
myXmobarPP = def
		{ ppSep             = wine " • "
		, ppTitleSanitize   = xmobarStrip
		, ppCurrent         = wine . wrap "•"  " •" 
		, ppHidden          = blue . wrap "" "  "
        , ppUrgent          = wine . wrap (wine "!") (wine "!")
    	, ppOrder           = \[ws, l, _, wins] -> [ws, l, wins]
   		, ppExtras          = [logTitles formatFocused formatUnfocused]
    		}
  	where

    formatFocused   = wrap (blue "(") (blue ")") . wine . ppWindow
    formatUnfocused = wrap (wine "(") (wine ")") . blue . ppWindow
 
     -- | Windows should have *some* title, which should not not exceed a
     -- sane length.
    ppWindow :: String -> String
    ppWindow = xmobarRaw . (\w -> if null w then "untitled" else w) . shorten 30

    blue, wine :: String -> String
    wine     = xmobarColor "#cc241d" ""
    blue     = xmobarColor "#5d5cff" ""

-- Key binding to toggle the gap for the bar.
toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)
------------------------------------------------------------------------
-- Now run xmonad with all the defaults we set up.

-- Run xmonad with the settings you specify. No need to modify this.
--
main = xmonad =<< statusBar "xmobar" myXmobarPP toggleStrutsKey defaults 
           
-- A structure containing your configuration settings, overriding
-- fields in the default config. Any you don't override, will
-- use the defaults defined in xmonad/XMonad/Config.hs
--
-- No need to modify this.
--

defaults = def {
      -- simple stuff
        terminal           = "terminator",
        focusFollowsMouse  = myFocusFollowsMouse,
        clickJustFocuses   = myClickJustFocuses,
        borderWidth        = 2,
        modMask            = mod4Mask,
        workspaces         = myClickableWorkspaces,
        normalBorderColor  = "#070081",
        focusedBorderColor = "#82aaff",

      -- key bindings
        keys               = myKeys,
        mouseBindings      = myMouseBindings,

      -- hooks, layouts
        layoutHook         = myLayoutHook,
        manageHook         = myManageHook <+> manageHook def,
        startupHook        = setWMName "LG3D" -- Turn possible open some IDEs.
    }
