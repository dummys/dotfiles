# Autogenerated config.py
# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

# Uncomment this to still load settings configured via autoconfig.yml
# config.load_autoconfig()

# Always restore open sites when qutebrowser is reopened.
# Type: Bool
c.auto_save.session = True

# Font used in the tab bar.
# Type: QtFont
c.fonts.tabs = '20pt source code pro light'

# Automatically enter insert mode if an editable element is focused
# after loading the page.
# Type: Bool
c.input.insert_mode.auto_load = True

# The position of the tab bar.
# Type: Position
# Valid values:
#   - top
#   - bottom
#   - left
#   - right
c.tabs.position = 'top'

# The width of the tab bar if it's vertical, in px or as percentage of
# the window.
# Type: PercOrInt
c.tabs.width.bar = '60%'

# The page to open if :open -t/-b/-w is used without URL. Use
# `about:blank` for a blank page.
# Type: FuzzyUrl
c.url.default_page = 'www.google.ch'

# Definitions of search engines which can be used via the address bar.
# Maps a searchengine name (such as `DEFAULT`, or `ddg`) to a URL with a
# `{}` placeholder. The placeholder will be replaced by the search term,
# use `{{` and `}}` for literal `{`/`}` signs. The searchengine named
# `DEFAULT` is used when `url.auto_search` is turned on and something
# else than a URL was entered to be opened. Other search engines can be
# used by prepending the search engine name to the search term, e.g.
# `:open google qutebrowser`.
# Type: Dict
c.url.searchengines = {'DEFAULT': 'https://www.google.ch/search?hl=fr&q={}'}

# The page(s) to open at the start.
# Type: List of FuzzyUrl, or FuzzyUrl
c.url.start_pages = 'https://www.google.ch'

# Bindings for normal mode
config.bind(',m', 'spawn /usr/bin/optirun /usr/bin/mpv --cache=4000 --force-window=immediate {url} --keep-open')
config.bind('<ctrl+left>', 'tab-prev')
config.bind('<ctrl+leftarrow>', 'tab-prev')
config.bind('<ctrl+p>', 'spawn --userscript qute-pass')
config.bind('<ctrl+right>', 'tab-next')
config.bind('Backspace', 'H')
config.bind('H', 'back')
config.bind('backspace', 'back')