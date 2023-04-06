YTFZF_HIST=1 # history is on by default it can be set to -> 0 history off, 1: history on
YTFZF_LOOP=0 # if set to 1 it is on but normally it is off by default. Can be turned on using option -l
YTFZF_PREF="bestvideo[height<=?480]+bestaudio/best" # set the video format
YTFZF_ENABLE_FZF_DEFAULT_OPTS=1 # fzf colors are going to be the one from your fzf configuration
FZF_PLAYER=”mpv” # sets the video player used by ytfzf (mpv by default), e.g. FZF_PLAYER=”devour mpv”; you can also specify the YTFZF_PLAYER_FORMAT, e.g. YTFZF_PLAYER_FORMAT=”devour mpv –ytdl-format=”
