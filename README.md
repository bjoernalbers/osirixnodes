# OsiriX Nodes

A simple DICOM Nodelist for OsiriX.


## Quickstart

1. Clone this repo and `cd` into it: `git clone git@github.com:bjoernalbers/osirixnodes.git`
2. Run the setup script: `./bin/setup`
3. Start the server via Docker: `docker-compose up`
4. Visit the [Web-UI](http://localhost:3000) and add some nodes

Done.

Then enter the nodes URL http://localhost:3000/nodes.plist under the "nodes"
section with OsiriX-Settings.

**IMPORTANT: Backup your existing nodes since this will overwrite them!**


## License

OsiriX Nodes is released under the
[MIT License](https://github.com/bjoernalbers/osirixnodes/blob/master/LICENSE.txt).
