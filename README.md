#_.files


## installation
	git clone https://github.com/sterpe/_.files.git
	cd _.files
	make && make install

## notes to self

### unicode key codes (`Alt+WXYZ`)
- `©: U+00A9`
- `⌘: U+2318`
- `λ: U+03BB`

### disable rootless mode (OS X)
- Reboot into Recovery Mode (reboot and hold down `⌘-R`).
- Open a Terminal Window.
- `csrutil disable`
- Reboot.

### re-enable rootless mode (OS X)
- Repeat steps 1 & 2 above.
- `csrutil enable`
- Reboot.

### reset NVRAM (PRAM) (Macbook)
- Shut down the Mac.
- Power on the machine.
- Press and hold `⌘-Option-P-R` immediately after the startup sound.
- Hold `⌘-Option-P-R` until the machine restarts and you hear the second startup sound.
- Release the keys.

### reset the SMC (Macbook)
- Shutdown the Mac.
- Plug in the MagSafe power adapter to a power source and to the Mac.
- Using the _built-in keyboard_, press `Shift-Control-Option` on the _left side_
of the keyboard, and press the power button at the same time.
- Release all the keys, then press the power button again to turn on the Mac.

(The LED on Magsafe power adapters might change states or temporarily turn off
when you reset the SMC.)

### show hidden files in finder
	defaults write com.apple.finder AppleShowAllFiles YES

### hide hidden files in finder
	defaults write com.apple.finder AppleShowAllFiles NO

### eject all disks
	osascript -e "tell app \"Finder\" to eject (every disk whose ejectable is true)"
git
===
* Checkout a specific tag

````
	git tag -l; git checkout tags/<tag_name>
````

osx
===
* Dock is acting up:

````
	killall Dock
````

* Eject everything:

````
	osascript -e 'tell application "Finder" to eject (every disk 
	whose ejectable is true)'
````

chmod
===

* Recursively *chmod* only directories:

````
	find . -type d -exec chmod 755 {} \;
````

* Recursively set the execute bit on every directory:

````
	chmod -R a+X *
````

* Recursively chmod only files:

````
	find . -type f -exec chmod 644 {} \;
````

* Recursively chmod only PHP files (with extension .php):

````
	find . -type f -name '*.php' -exec chmod 644 {} \;
````

* Pretty print xml

```
	cat ugly.xml | xmllint --format - > pretty.xml
```

* Clear ~/.bash_history completely

```
	cat /dev/null > ~/.bash_history && history -c && exit
```
