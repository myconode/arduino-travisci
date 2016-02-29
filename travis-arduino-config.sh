# Inspired by Adasfruit's Arduino/Travis CI project:
# https://github.com/adafruit/travis-ci-arduino/

# Latest Version
ARDUINO_VERSION=1.6.7

# Make headless display utility (xvfb) available for arduino CLI
/sbin/start-stop-daemon --start --quiet --pidfile /tmp/custom_xvfb_1.pid --make-pidfile --background --exec /usr/bin/Xvfb -- :1 -ac -screen 0 1280x1024x16
sleep 3
export DISPLAY=:1.0

# download and install latest arduino
wget "https://downloads.arduino.cc/arduino-$ARDUINO_VERSION-linux64.tar.xz"
tar xf "arduino-$ARDUINO_VERSION-linux64.tar.xz"
mv "arduino-$ARDUINO_VERSION $HOME/arduino_ide"

# add the arduino CLI to our PATH
export PATH="$HOME/arduino_ide:$PATH"
