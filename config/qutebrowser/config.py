# Uncomment this to still load settings configured via autoconfig.yml
# config.load_autoconfig()

# Always restore open sites when qutebrowser is reopened.
c.auto_save.session = True

# Page to open if :open -t/-b/-w is used without URL. Use `about:blank`
# for a blank page.
# Type: FuzzyUrl
c.url.default_page = 'www.google.ch'

c.url.searchengines = {'DEFAULT': 'https://www.google.ch/search?hl=fr&q={}'}

# Page(s) to open at the start.
# Type: List of FuzzyUrl, or FuzzyUrl
c.url.start_pages = 'https://www.google.ch'

# Bindings for normal mode
config.bind('<ctrl+left>', 'tab-prev')
config.bind('<ctrl+leftarrow>', 'tab-prev')
config.bind('<ctrl+right>', 'tab-next')
config.bind('Backspace', 'H')
config.bind('H', 'back')
config.bind('backspace', 'back')
config.bind(',m', 'spawn /usr/bin/optirun /usr/bin/mpv --cache=4000 --force-window=immediate {url} --keep-open')
