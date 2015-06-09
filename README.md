. files
===

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
