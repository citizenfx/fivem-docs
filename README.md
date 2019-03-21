FiveM Documentation
===================

Source of [docs.fivem.net][docs].

Development
-----------

Install [Hugo][gohugo] *0.49*, then run:

```sh
git submodule init
git submodule update
hugo server -D
```

Checking for dead links
-----------------------

Install [Wget][wget], start a Hugo server, then run:

```sh
wget --spider -o ./wget.log -e robots=off -w 1 -r -p http://localhost:1313
```

More info on that [here][check-dead-links].

[docs]: https://docs.fivem.net
[gohugo]: https://gohugo.io
[wget]: http://www.gnu.org/software/wget/
[check-dead-links]: https://www.createdbypete.com/articles/simple-way-to-find-broken-links-with-wget/
