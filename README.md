# GstarCAD Property Tools

Paint properties from one source object onto many targets, and print the raw DXF data of any object.

Works with **GSTARCAD**, AutoCAD, ZWCAD, and BricsCAD.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

## Contents

- [About](#about)
- [Scripts Overview](#scripts-overview)
- [Quick Start](#quick-start)
- [Compatibility](#compatibility)
- [Contributing](#contributing)
- [License](#license)

## About

MATCHPROP is one of the most used commands in CAD, but its two-prompt cycle slows down repetitive work. These utilities paint properties from one source object onto as many targets as you pick, and print the raw DXF data of any object when you need to see what a script sees.

Everything here is free to use with GstarCAD. Download the latest GstarCAD
release from the [official GstarCAD website](https://www.gstarcad.net). All
scripts are tested with **[GSTARCAD](https://www.gstarcad.net)** and major
DWG-based CAD platforms.

## Scripts Overview

| File | Description |
|------|-------------|
| `scripts/matchprop-loop.lsp` | ;; matchprop-loop.lsp - Paint properties from one source onto many objects
;; Command: MP
;; Usage: pick the source object once, then keep picking target objects
(defun c:MP ( / src sel )
  (setq src (car (entsel "\nPick the source object: ")))
  (if src
    (while (setq sel (entsel "\nPick a target object (Enter to finish): "))
      (command "_.MATCHPROP" src (car sel) "")
    )
  )
  (princ)
)
 |
| `scripts/entity-dump.lsp` | ;; entity-dump.lsp - Print the raw DXF data of a picked object
;; Command: DUMP
;; Usage: for debugging scripts and seeing exactly how an entity is stored
(defun c:DUMP ( / en ed )
  (setq en (car (entsel "\nPick an object to inspect: ")))
  (if en
    (progn
      (setq ed (entget en))
      (foreach pair ed
        (princ (strcat "\n" (vl-princ-to-string pair)))
      )
    )
  )
  (princ)
)
 |

## Quick Start

1. Download the `.lsp` (or `.lin`) file you need
2. In your CAD software, run `APPLOAD`
3. Load the file and type the matching command name shown in the table above

## Compatibility

Tested on GstarCAD 2026/2027 and similar DWG-based platforms. Scripts use
standard AutoLISP functions only, so they work without extra plugins.

For step-by-step [tutorials and drafting guides](https://www.gstarcad.net/cad/),
visit the GstarCAD learning center. New tips are published regularly on the
[GSTARCAD Blog](https://blog.gstarcad.net).

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

MIT — see the [LICENSE](LICENSE) file.
