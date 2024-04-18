### Brew formula for download and install fork of Dino+.
----

Link to fork: https://github.com/mxlgv/dino

For using this formula, follow next instructions:

```
brew tap mxlgv/homebrew-dino
brew install mxlgv/homebrew-dino/dino
```

You can start the Dino client with the following command:

```
./opt/homebrew/Cellar/dino/3/bin/dino
```
You can create a shortcut with a symbolic link pointing to this file, so that you can open it in a more convenient way.

If you encounter an error related to rpath, you need to add `DYLD_LIBRARY_PATH` to the environment variable:

```
export DYLD_LIBRARY_PATH=/opt/homebrew/Cellar/dino/3/lib
```