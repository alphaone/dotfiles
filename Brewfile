# Make sure we’re using the latest Homebrew
update

# Upgrade any already-installed formulae
upgrade

# Install GNU core utilities (those that come with OS X are outdated)
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
install coreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
install findutils

# Install wget with IRI support
install wget --enable-iri

# Install more recent versions of some OS X tools
install vim --override-system-vi
tap homebrew/dupes
install homebrew/dupes/grep

# This formula didn’t work well last time I tried it:
#install homebrew/dupes/screen

# Install other useful binaries
install ack
#install exiv2
install git
install tree
install ctags
install osxfuse

install mongodb
install selenium-server-standalone
install chromedriver
install gradle

install ffmpeg
install imagemagick

install libebml --c++11
install libmatroska --c++11
install mkvtoolnix --c++11

install memcached    
install redis

# Remove outdated versions from the cellar
cleanup