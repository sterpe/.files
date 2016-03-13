#_.files


## installation
	git clone https://github.com/sterpe/_.files.git
	cd _.files
	make && make install

## notes to self

### disable rootless mode (OS X)
- Reboot into Recovery Mode (reboot and hold down `⌘--R`).
- Open a Terminal Window.
- `csrutil disable`
- Reboot.

### re-enable rootless mode (OS X)
- Repeat steps 1 & 2 above.
- `csrutil enable`
- Reboot.

### reset NVRAM (PRAM) (OS X)
- Shut down the Mac.
- Power on the machine.
- Press and hold `⌘--Option-P-R` immediately after the startup sound.
- Hold `⌘--Option-P-R` until the machine restarts and you hear the second startup sound.
- Release the keys.

### reset the SMC (Macbook)
- Shutdown the Mac.
- Plug in the MagSafe power adapter to a power source and to the Mac.
- Using the _built-in keyboard_, press `Shift-Control-Option` on the _left side_
of the keyboard, and press the power button at the same time.
- Release all the keys, then press the power button again to turn on the Mac.

(The LED on Magsafe power adapters might change states or temporarily turn off
when you reset the SMC.)
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
