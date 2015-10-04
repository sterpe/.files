## Rooting El Capitan

This is the so called "rootless" mode in the new version of OS X.
It effectively makes certain system directories read-only (even for
admins). "/usr" is one of those protected directories (the only
subdirectory that is excluded from this rule is "/usr/local")

One can disable this rootless mode with the following commands:

```
$ sudo nvram boot-args="rootless=0"
$ sudo reboot
```

But this is not recommended! The best practice is to install custom
stuff to "/usr/local" only.
El Capitan now protects certain system directories in "rootless"
mode (a.k.a. System Integrity Protection). If you run the command
ls -lO /System/Library/LaunchDaemons you'll see that the directories
and files under there are now marked as "restricted."

You can disable rootless mode like this:

- Reboot into recovery mode (reboot and hold down Cmd-R)
- Open a terminal
- Use this command: `csrutil disable`
- Reboot and run the command that worked prior to El Capitan

When you're done, it is highly recommended that you re-enable SIP
by following the same steps, but using `csrutil enable` in step 3.

I ran into a problem with the same root cause while trying to get
pear/pecl modules and macports/homebrew apps installed. Those
typically need to install files into /usr/include and /usr/lib,
which are also now restricted.

Note: Previous answers around the Internet about this problem give
you instructions for modifying NVRAM settings, but Apple stated
that the NVRAM method would stop working with El Capitan's public
release. The GM release has already disabled the NVRAM workaround,
so this answer should get you what you need moving forward.

-

`http://apple.stackexchange.com/questions/196224/unix-ln-s-command-not-permitted-in-osx-el-capitan-beta3`
`http://stackoverflow.com/questions/32590053/copying-file-under-root-got-failed-in-os-x-el-capitan-10-11/32590885#32590885`
