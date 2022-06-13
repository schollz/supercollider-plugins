# supercollider-plugins

## build all

```
git checkout build
./build.sh
```

## install

first clear your extensions directory (don't do this if you have special extensions)

```lua
os.execute("cp /home/we/.local/share/SuperCollider/Extensions/norns-config.sc /tmp/ && rm -rf /home/we/.local/share/SuperCollider/Extensions/* && mv /tmp/norns-config.sc /home/we/.local/share/SuperCollider/Extensions/")
```

then install as you would normally:

```
;install https://github.com/schollz/supercollider-plugins
```
