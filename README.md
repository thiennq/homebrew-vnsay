# homebrew-vnsay

Homebrew tap for **vnsay**, Vietnamese text-to-speech on the command line
without Python (like Apple's `say`, with Vietnamese voices first).

```sh
brew install thiennq/vnsay/vnsay
```

The formula installs the prebuilt binary from
[thiennq/vnsay-releases](https://github.com/thiennq/vnsay-releases).
The current version is 0.2.0 (`brew upgrade vnsay` from 0.1.0; the command
that speaks is now `vnsay speak`). It is not code-signed yet; Homebrew installs
it without a Gatekeeper prompt.
This tap was called `homebrew-zerotts`; old links redirect here.

## Credits and license

vnsay uses the **ZeroTTS** model and engine by **ZeroWeight AI**
(https://github.com/zeroweight-ai/ZeroTTS), released under the MIT License
(Copyright (c) 2026 ZeroWeight AI). The installed package carries that notice
and the full license text.
