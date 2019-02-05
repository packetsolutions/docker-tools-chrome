Chrome web browser that uses X11 socket to display a web browser

Some distros require xhost docker permissions:
```
xhost local:docker
```

Example run command for a throwaway chrome instance
```
docker run \
  --rm \
  --shm-size=256m \
  -e DISPLAY=$DISPLAY \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -d \
  packetsolutions/chrome:latest
```

```
--shm-size=256m
```
is required to as the browser sometimes has issues at high resolutions


Other docker options can be set:
```
--dns=8.8.8.8 \
--dns-search=packetsolutions.io \
```

The following stores the chrome bookmarks/cache:
```
-v ~/dockerchrome/downloads:/home/chrome/Downloads
-v ~/dockerchrome/settings:/home/chrome/.config/google-chrome
-v ~/dockerchrome/cache:/home/chrome/.cache/google-chrome
```

You will need to set the owner of these files to uid=1000:
```
sudo chown -R 1000:1000 ~/dockerchrome
```

Full runboook
```
mkdir ~/dockerchrome
mkdir ~/dockerchrome/downloads
mkdir ~/dockerchrome/settings
mkdir ~/dockerchrome/cache
sudo chown -R 1000:1000 ~/dockerchrome

docker run \
  --rm \
  --shm-size=256m \
  -e DISPLAY=$DISPLAY \
  -v ~/dockerchrome/downloads:/home/chrome/Downloads \
  -v ~/dockerchrome/settings:/home/chrome/.config/google-chrome \
  -v ~/dockerchrome/cache:/home/chrome/.cache/google-chrome \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -d \
  packetsolutions/chrome:latest
```
