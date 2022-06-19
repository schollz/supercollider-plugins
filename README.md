# supercollider-plugins

this is a script that will allow you to install many 3rd-party custom SuperCollider plugins for norns. these plugins are written in C++ already compiled for norns (through [this build script](https://github.com/schollz/supercollider-plugins/blob/build/build.sh)). all you need to do is run this script `supercollider-plugins` and it will automatically figure out which ones are missing and install them onto your norns.

## available plugins

- [IBufWr](https://github.com/tremblap/IBufWr) - interpolating buffer writer
- [NasalDemons](https://github.com/elgiano/NasalDemons) - play arbitrary memory regions
- [XPlayBuf](https://github.com/elgiano/XPlayBuf) - loop and fading buffer player
- [f0plugins](https://github.com/redFrik) - Frederik Olofsson's amazing sound chip emulation plugins
- [mi-UGens](https://github.com/v7b1/mi-UGens) - Émilie Gillet's open source mutable instruments eurorack modules ported by Volker Böhm
- [portedplugins](https://github.com/madskjeldgaard/portedplugins) - a wide assortment of amazing plugins ported by Mads Kjeldgaard
- [Super BufRD](https://github.com/esluyter/super-bufrd) - UGens for accessing long buffers with subsample accuracy
- [Pulse PTR](https://github.com/ryleelyman/pulseptr) - a PTR variable width pulse wave oscillator by Peter McCulloch, ported by Rylee Alanza Lyman
- [Triangle PTR](https://github.com/ryleelyman/triangleptr) - a PTR variable slope triangle wave oscillator by Rylee Alanza Lyman
- [CDSkip](https://github.com/nhthn/supercollider-cd-skip) - a CD skipping plugin by Nathan Ho

## usage

once installed, these plugins can be used in norns engines. [read here](https://monome.org/docs/norns/engine-study-1/) about making a norns engine. some scripts already utilize these plugins.

## install

```
;install https://github.com/schollz/supercollider-plugins
```

open script to install or uninstall the plugins.

