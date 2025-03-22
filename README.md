# GirFFI-Atspi

GirFFI-based Ruby bindings for Atspi

## Usage

```ruby
require "gir_ffi-atspi"

desktop = Atspi.get_desktop(0)
child = desktop.get_child_at_index(0)
# ...
```

## Installation

```bash
gem install gir_ffi-atspi
```

## Requirements

GirFFI-Atspi needs the [GirFFI](https://rubygems.org/gems/gir_ffi) gem and
supports the same platforms.

In addition, it needs introspection data for the Atspi library.
On Debian and Ubuntu, you can get this by installing `gir1.2-atspi-2.0`.

GirFFI-Atspi has not been tested on Mac OS X or Microsoft Windows. YMMV. Pull
requests to support these platforms are welcome.

## Contributing

Please see [CONTRIBUTING.md](CONTRIBUTING.md) for contribution guidelines.

## License

Copyright &copy; 2025 [Matijs van Zuijlen](http://www.matijs.net/)

GirFFI-Atspi is free software, distributed under the terms of the GNU Lesser
General Public License, version 2.1 or later. See the file COPYING.LIB for more
information.
