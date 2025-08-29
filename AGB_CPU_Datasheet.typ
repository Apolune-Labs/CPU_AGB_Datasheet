#import "@preview/hydra:0.6.2": hydra

// ==== Style ==================================================================

#set page(
  margin: (top: 50pt, bottom: 50pt),
  header: context {
    set text(9pt)
    set par(spacing: 1em)
    if counter(page).get().first() > 1 {
      strong("CPU AGB A, CPU AGB B, CPU AGB E" + h(1fr) + hydra(1, skip-starting: false))
      line(length: 100%)
    }
  },footer: context {
    set text(9pt)
    set par(spacing: 1em)
    line(length: 100%)
    grid(
      columns: (1fr, 1fr, 1fr),
      align(left, move(dy:-2mm, image("images/apolune_labs.svg", width: 7mm))),
      align(center, datetime.today().display() + ", Rev 0"),
      align(right, counter(page).display("1/1", both: true ))
    )
  },
)

#set text(
  font: "Roboto",
  size: 10pt,
)

#set par(
  leading: 0.8em,
  spacing: 2em,
)

#set heading(
  numbering: "1.1",
)

#set table(
  stroke: 0.5pt,
  inset: 5pt,
)

#set list(
  marker: ([•], [-]),
  spacing: 1.1em,
)

#set line(
  stroke: 0.5pt,
)

#set rect(
  stroke: 0.5pt,
)

#set figure.caption(
  position: top,
)

#show figure.caption: c => {
  set text(10pt)
  strong(c)
}

#show figure: set block(breakable: true)

#show link: a => {
  set text(fill: rgb("#0000FF"))
  a
}

// ==== Title Page =============================================================

#text[
  #set text(18pt)
  #set block(spacing: 8pt)
  #line(length: 100%)
  #strong(align(right, "CPU AGB A, CPU AGB B, CPU AGB E"))
  #set block(spacing: 6pt)
  #line(length: 100%)
  #set text(13pt)
  #align(right, "Arm®-based 32-bit MCU+PPU, 16.78 MHz, 16 KB ROM, 386 KB RAM")
  #line(length: 100%)
  #set text(9pt)
  #strong(align(right, "Datasheet"))
]

#columns(2)[
  = Features
  - Arm®-based 32-bit ARM7TDMI MCU
  - Power supplies
    - 3.3V main supply voltage
    - 2.5V (CPU AGB A/B only)
    - 1.8V core voltage (CPU AGB B/E only)
  - Memories
    - 16 KB BIOS ROM providing arithmetic, rotation/scaling, decompression, memory copy, sound and other functions
    - 32 KB internal work RAM
    - 256 KB external work RAM
    - 96 KB video RAM
    - 1 KB object attribute memory
    - 1 KB palette RAM
  - 16-bit Game Pak memory interface, 24-bit address, 8 x 16-bit prefetch buffer
  - 15-bit TFT LCD interface, RGB 555, 240 x 160 pixels, 60 Hz
  - Picture Processing Unit (PPU)
   - 128 objects (up to 64 x 64 pixels)
   - 4 backgrounds (up to 1024 x 1024 pixels)
   - Bitmap mode (240 x 160 or 160 x 128 pixels)
  - Sound
    - 2 DMA sound channels
    - 4 channel Audio Processing Unit (APU)
  - Serial communication interface
    - Normal mode
    - Multi-Player mode
    - UART mode
    - JOY BUS mode
    - General-Purpose mode
  - 4 16-bit timers
    - All mappable as interrupt source
    - Multiple timers can be linked
  - 4 channel DMA controller
  - 10 keypad inputs
    - All mappable as interrupt source

  #colbreak()

  = Description
  The CPU AGB A/B/E devices are based on the Arm® ARM7TDMI 32-bit core operating at a frequency of 16.777 MHz. They also contain a Z80/8080 based 8-bit core operating at a frequency of 4.194 MHz or 8.388 MHz which can execute software developed for DMG/CGB devices.

  These devices embed high-speed memories (32 KB internal work RAM, 256 KB external work RAM and a total of 98 KB of video RAM) as well as a 16 KB BIOS ROM which provides arithmetic, rotation/scaling, decompression, memory copy, sound and other functions. Program instructions and data are fetched via the 16-bit Game Pak memory interface which also features a prefetch buffer. Additionaly they integrate a range of peripherals, including an LCD interface, stereo sound output, keypad inputs, a serial communication interface, timers and a DMA controller.

  The devices embed a graphics accelerator (Picture Processing Unit) which can operate in 6 different modes. It features 4 independent background layers as well as an object layer. It also provides hardware scrolling, scaling, rotating, windowing, mosaic and alpha blending effects.

  = Device Information
  #set text(8pt)
  #figure(
    table(
      columns: (1fr, 1fr, 1fr),
      table.header(strong([Part Number]), strong([Package]), strong([Package Size])),
      table.hline(y: 1, stroke: 1pt),
      [CPU AGB A], [QFP-128], [14mm x 20mm],
      [CPU AGB B], [QFP-156], [14mm x 20mm],
      [CPU AGB E], [CSP-BGA-160], [12mm x 12mm],
    ),
    caption: "Device information",
  )
  #set text(10pt)
]

#pagebreak()

// ==== Outline ================================================================

#outline()

#outline(
  title: [List of Tables],
  target: figure.where(kind: table),
)

#outline(
  title: [List of Figures],
  target: figure.where(kind: image),
)

#pagebreak()

// ==== Content ================================================================

= Introduction
This document provides information on CPU AGB A/B/E microcontrollers, such as description, functional overview, pin assignment and definition, electrical characteristics and packaging.

This document should be read in conjunction with the #link("https://archive.org/details/NintendoGbaManualV1.1")[AGB programming manual], available on www.archive.org.

For information on the Arm® ARM7TDMI core, refer to the #link("https://documentation-service.arm.com/static/5e8e1323fd977155116a3129")[ARM7TDMI technical reference manual], available from the www.arm.com website.

#pagebreak()

= Pinouts and Pin Description
== QFP-128 Pinout Description
#figure(
  rect(
    image("images/qfp-128_pinout.svg", width: 100%),
  ),
  caption: "CPU AGB A QFP-128 pinout"
)

#pagebreak()

== QFP-156 Pinout Description
#figure(
  rect(
    image("images/qfp-156_pinout.svg", width: 100%),
  ),
  caption: "CPU AGB B QFP-156 pinout"
)

#pagebreak()

== CSP-BGA-160 Pinout Description
#figure(
  rect(
    image("images/csp-bga-160_pinout.svg", width: 100%),
  ),
  caption: "CPU AGB E CSP-BGA-160 pinout"
)

#pagebreak()

== Pin/Ball Definition
#figure(
  table(
    align: center + horizon,
    columns: (3em, 3em, 3em, 1fr, 1fr, 4fr),
    rows: (auto, 80pt, auto),
    table.cell(colspan: 3, strong([Pin Number])),
    table.cell(rowspan: 2, strong([Pin Name])),
    table.cell(rowspan: 2, strong([Pin Type])),
    table.cell(rowspan: 2, strong([Description])),
    box(inset: (x:-15pt,y:18pt), rotate(strong([QFP-128]), -90deg)),
    box(inset: (x:-15pt,y:18pt), rotate(strong([QFP-156]), -90deg)),
    box(width: 40pt, inset: (x:-15pt,y:18pt), rotate(strong([CSP-BGA-160]), -90deg)),
    table.hline(y: 2, stroke: 1pt),
    [  1], [ \-], [ C6],         [VDD3],     [Supply],  [3.3V Power supply],
    [  2], [  1], [ \-],         [IN35],     [Input],   [Cartridge voltage switch feedback],
    [  3], [  2], [F14],         [P8],       [Input],   [Keypad button "Shoulder R"],
    [  4], [  3], [E13],         [P0],       [Input],   [Keypad button "A"],
    [  5], [  4], [E14],         [P1],       [Input],   [Keypad button "B"],
    [  6], [  5], [D13],         [SO1],      [Output],  [Sound output right],
    [  7], [  6], [D14],         [SO2],      [Output],  [Sound output left],
    [  8], [  7], [C14], overline[IRQ/DREQ], [Input],   [Cartridge interrupt/DMA request signal],
    [ \-], [  8], [D10],         [VDD1],     [Supply],  [1.8V Power supply],
    [ \-], [  9], [ C5],         [GND],      [Supply],  [Ground reference],
    [ \-], [ 10], [ \-],         [VDD35],    [Supply],  [3.3V or 5V Power supply],
    [  9], [ 11], [ \-], overline[CS2],      [Output],  [Cartridge chip select 2],
    [ 10], [ 12], [B14],         [A23],      [Output],  [Cartridge address, bit 23],
    [ 11], [ 13], [B13],         [A22],      [Output],  [Cartridge address, bit 22],
    [ 12], [ 14], [A13],         [A21],      [Output],  [Cartridge address, bit 21],
    [ 13], [ 15], [B12],         [A20],      [Output],  [Cartridge address, bit 20],
    [ 14], [ 16], [A12],         [A19],      [Output],  [Cartridge address, bit 19],
    [ 15], [ 17], [B11],         [A18],      [Output],  [Cartridge address, bit 18],
    [ \-], [ 18], [ C7],         [GND],      [Supply],  [Ground reference],
    [ \-], [ 19], [ \-],         [VDD35],    [Supply],  [3.3V or 5V Power supply],
    [ 16], [ 20], [A11],         [A17],      [Output],  [Cartridge address, bit 17],
    [ 17], [ 21], [B10],         [A16],      [Output],  [Cartridge address, bit 16],
    [ 18], [ 22], [A10],         [AD15],     [I/O],     [Cartridge address/data, bit 15],
    [ 19], [ 23], [ B9],         [AD14],     [I/O],     [Cartridge address/data, bit 14],
    [ 20], [ 24], [ A9],         [AD13],     [I/O],     [Cartridge address/data, bit 13],
    [ 21], [ 25], [ B8],         [AD12],     [I/O],     [Cartridge address/data, bit 12],
    [ 22], [ 26], [ A8],         [AD11],     [I/O],     [Cartridge address/data, bit 11],
    [ \-], [ 27], [ C9],         [GND],      [Supply],  [Ground reference],
    [ \-], [ 28], [ \-],         [VDD35],    [Supply],  [3.3V or 5V Power supply],
    [ 23], [ 29], [ B7],         [AD10],     [I/O],     [Cartridge address/data, bit 10],
    [ 24], [ 30], [ A7],         [AD9],      [I/O],     [Cartridge address/data, bit 9],
    [ 25], [ 31], [ B6],         [AD8],      [I/O],     [Cartridge address/data, bit 8],
    [ 26], [ 32], [ A6],         [AD7],      [I/O],     [Cartridge address/data, bit 7],
    [ 27], [ 33], [ B5],         [AD6],      [I/O],     [Cartridge address/data, bit 6],
    [ 28], [ 34], [ A5],         [AD5],      [I/O],     [Cartridge address/data, bit 5],
    [ 29], [ 35], [ B4],         [AD4],      [I/O],     [Cartridge address/data, bit 4],
    [ \-], [ 36], [C10],         [GND],      [Supply],  [Ground reference],
    [ \-], [ 37], [ \-],         [VDD35],    [Supply],  [3.3V or 5V Power supply],
    [ 30], [ 38], [ A4],         [AD3],      [I/O],     [Cartridge address/data, bit 3],
    [ 31], [ 39], [ B3],         [AD2],      [I/O],     [Cartridge address/data, bit 2],
    [ 32], [ 40], [ A3],         [AD1],      [I/O],     [Cartridge address/data, bit 1],
    [ 33], [ 41], [ B2],         [AD0],      [I/O],     [Cartridge address/data, bit 0],
    [ 34], [ 42], [ A2], overline[CS1],      [Output],  [Cartridge chip select 1],
    [ 35], [ 43], [ B1], overline[RD],       [Output],  [Cartridge read signal],
    [ 36], [ 44], [ C2], overline[WR],       [Output],  [Cartridge write signal],
    [ 37], [ 45], [ C1],         [PHI],      [Output],  [Cartridge clock signal],
    [ 38], [ 46], [ \-],         [VDD35],    [Supply],  [3.3V or 5V Power supply],
    [ 39], [ 47], [C12],         [GND],      [Supply],  [Ground reference],
    [ 40], [ 48], [ D1],         [SC],       [I/O],     [Serial communication pin "SC"],
    [ 41], [ 49], [ D2],         [SD],       [I/O],     [Serial communication pin "SD"],
    [ 42], [ 50], [ E1],         [SI],       [I/O],     [Serial communication pin "SI"],
    [ 43], [ 51], [ E2],         [SO],       [I/O],     [Serial communication pin "SO"],
    [ \-], [ 52], [ \-],         [VDD35],    [Supply],  [3.3V or 5V Power supply],
    [ \-], [ 53], [ D4],         [GND],      [Supply],  [Ground reference],
    [ \-], [ 54], [ G4],         [VDD1],     [Supply],  [1.8V Power supply],
    [ \-], [ 55], [ D6],         [GND],      [Supply],  [Ground reference],
    [ 44], [ 56], [ \-],         [VDD2],     [Supply],  [2.5V Power supply],
    [ 45], [ 57], [ \-],         [MA0],      [Output],  [Work RAM address, bit 0],
    [ 46], [ 58], [ \-],         [MA1],      [Output],  [Work RAM address, bit 1],
    [ 47], [ 59], [ \-],         [MA2],      [Output],  [Work RAM address, bit 2],
    [ 48], [ 60], [ \-],         [MA3],      [Output],  [Work RAM address, bit 3],
    [ 49], [ 61], [ \-],         [MA4],      [Output],  [Work RAM address, bit 4],
    [ 50], [ 62], [ \-],         [MA5],      [Output],  [Work RAM address, bit 5],
    [ 51], [ 63], [ \-],         [MA6],      [Output],  [Work RAM address, bit 6],
    [ 52], [ 64], [ \-],         [MA7],      [Output],  [Work RAM address, bit 7],
    [ 53], [ 65], [ \-], overline[LB],       [Output],  [Work RAM lower byte select],
    [ 54], [ 66], [ \-], overline[UB],       [Output],  [Work RAM upper byte select],
    [ \-], [ 67], [ D8],         [GND],      [Supply],  [Ground reference],
    [ \-], [ 68], [ \-],         [VDD2],     [Supply],  [2.5V Power supply],
    [ 55], [ 69], [ \-], overline[MWR],      [Output],  [Work RAM write enable signal],
    [ 56], [ 70], [ \-],         [MA8],      [Output],  [Work RAM address, bit 8],
    [ 57], [ 71], [ \-],         [MA9],      [Output],  [Work RAM address, bit 9],
    [ 58], [ 72], [ \-],         [MA10],     [Output],  [Work RAM address, bit 10],
    [ 59], [ 73], [ \-],         [MA11],     [Output],  [Work RAM address, bit 11],
    [ 60], [ 74], [ \-],         [MA12],     [Output],  [Work RAM address, bit 12],
    [ 61], [ 75], [ \-],         [MA13],     [Output],  [Work RAM address, bit 13],
    [ 62], [ 76], [ \-],         [MA14],     [Output],  [Work RAM address, bit 14],
    [ 63], [ 77], [ \-],         [MA15],     [Output],  [Work RAM address, bit 15],
    [ 64], [ 78], [D11],         [GND],      [Supply],  [Ground reference],
    [ 65], [ 79], [ \-],         [VDD2],     [Supply],  [2.5V Power supply],
    [ 66], [ 80], [ \-],         [MD4],      [Input],   [Work RAM data, bit 4],
    [ 67], [ 81], [ \-],         [MD12],     [Input],   [Work RAM data, bit 12],
    [ 68], [ 82], [ \-],         [MD5],      [Input],   [Work RAM data, bit 5],
    [ 69], [ 83], [ \-],         [MD13],     [Input],   [Work RAM data, bit 13],
    [ 70], [ 84], [ \-],         [MD6],      [Input],   [Work RAM data, bit 6],
    [ 71], [ 85], [ \-],         [MD14],     [Input],   [Work RAM data, bit 14],
    [ 72], [ 86], [ \-],         [MD7],      [Input],   [Work RAM data, bit 7],
    [ 73], [ 87], [ \-],         [MD15],     [Input],   [Work RAM data, bit 15],
    [ 74], [ 88], [ \-],         [MA16],     [Output],  [Work RAM address, bit 16],
    [ \-], [ 89], [ \-],         [VDD2],     [Supply],  [2.5V Power supply],
    [ \-], [ 90], [ F4],         [GND],      [Supply],  [Ground reference],
    [ 75], [ 91], [ \-],         [MD11],     [Input],   [Work RAM data, bit 11],
    [ 76], [ 92], [ \-],         [MD3],      [Input],   [Work RAM data, bit 3],
    [ 77], [ 93], [ \-],         [MD10],     [Input],   [Work RAM data, bit 10],
    [ 78], [ 94], [ \-],         [MD2],      [Input],   [Work RAM data, bit 2],
    [ 79], [ 95], [ \-],         [MD9],      [Input],   [Work RAM data, bit 9],
    [ 80], [ 96], [ \-],         [MD1],      [Input],   [Work RAM data, bit 1],
    [ 81], [ 97], [ \-],         [MD8],      [Input],   [Work RAM data, bit 8],
    [ 82], [ 98], [ \-],         [MD0],      [Input],   [Work RAM data, bit 0],
    [ 83], [ 99], [ \-], overline[MRD],      [Output],  [Work RAM output enable signal],
    [ \-], [100], [ \-],         [VDD2],     [Supply],  [2.5V Power supply],
    [ \-], [101], [F11],         [GND],      [Supply],  [Ground reference],
    [ \-], [102], [H11],         [VDD1],     [Supply],  [1.8V Power supply],
    [ \-], [103], [G11],         [GND],      [Supply],  [Ground reference],
    [ \-], [104], [ C8],         [VDD3],     [Supply],  [3.3V Power supply],
    [ 84], [105], [ N7],         [DCK],      [Output],  [Display data sampling clock signal],
    [ 85], [106], [ P7],         [LP],       [Output],  [Display data latch signal],
    [ 86], [107], [ M8],         [PS],       [Output],  [Display power save signal],
    [ 87], [108], [ N8],         [LDR5],     [Output],  [Display data red, bit 5],
    [ 88], [109], [ P8],         [LDR4],     [Output],  [Display data red, bit 4],
    [ 89], [110], [ M9],         [LDR3],     [Output],  [Display data red, bit 3],
    [ 90], [111], [ N9],         [LDR2],     [Output],  [Display data red, bit 2],
    [ 91], [112], [ P9],         [LDR1],     [Output],  [Display data red, bit 1],
    [ 92], [113], [M10],         [LDG5],     [Output],  [Display data green, bit 5],
    [ 93], [114], [N10],         [LDG4],     [Output],  [Display data green, bit 4],
    [ 94], [115], [P10],         [LDG3],     [Output],  [Display data green, bit 3],
    [ 95], [116], [M11],         [LDG2],     [Output],  [Display data green, bit 2],
    [ 96], [117], [N11],         [LDG1],     [Output],  [Display data green, bit 1],
    [ \-], [118], [ H4],         [GND],      [Supply],  [Ground reference],
    [ \-], [119], [C11],         [VDD3],     [Supply],  [3.3V Power supply],
    [ 97], [120], [P11],         [LDB5],     [Output],  [Display data blue, bit 5],
    [ 98], [121], [N12],         [LDB4],     [Output],  [Display data blue, bit 4],
    [ 99], [122], [P12],         [LDB3],     [Output],  [Display data blue, bit 3],
    [100], [123], [N13],         [LDB2],     [Output],  [Display data blue, bit 2],
    [101], [124], [P13],         [LDB1],     [Output],  [Display data blue, bit 1],
    [102], [125], [H12],         [GND],      [Supply],  [Ground reference],
    [103], [126], [ D5],         [VDD3],     [Supply],  [3.3V Power supply],
    [104], [127], [N14],         [SPL],      [Output],  [Display sampling start signal],
    [105], [128], [M12],         [CLS],      [Output],  [Display gate driver clock signal],
    [106], [129], [M13],         [SPS],      [Output],  [Display gate driver start signal],
    [107], [130], [M14],         [MOD],      [Output],  [Display gate driver control signal],
    [108], [131], [L12],         [REVC],     [Output],  [Display reverse control signal],
    [109], [132], [ \-],         [TEST0],    [Unknown], [Unknown purpose],
    [110], [133], [ \-],         [TEST1],    [Unknown], [Unknown purpose],
    [111], [134], [ \-],         [TEST2],    [Unknown], [Unknown purpose],
    [112], [135], [ \-],         [TEST3],    [Unknown], [Unknown purpose],
    [ \-], [136], [ L5],         [VDD1],     [Supply],  [1.8V Power supply],
    [ \-], [137], [ J4],         [GND],      [Supply],  [Ground reference],
    [113], [138], [ \-],         [CK1],      [\-],      [Crystal oscillator],
    [114], [139], [ \-],         [CK2],      [\-],      [Crystal oscillator],
    [ \-], [ \-], [L14],         [XTAL],     [\-],      [Crystal oscillator],
    [115], [140], [ \-],         [VDD2],     [Supply],  [2.5V Power supply],
    [116], [141], [J12],         [GND],      [Supply],  [Ground reference],
    [117], [ \-], [ \-],         [VDD2],     [Supply],  [2.5V Power supply],
    [ \-], [142], [ D7],         [VDD3],     [Supply],  [3.3V Power supply],
    [ \-], [143], [K11],         [GND],      [Supply],  [Ground reference],
    [118], [144], [ \-],         [VCNT5],    [Output],  [Display digital power supply switch],
    [119], [145], [J13],         [P9],       [Input],   [Keypad button "Shoulder L"],
    [120], [146], [J14],         [P6],       [Input],   [Keypad button "D-Pad Up"],
    [121], [147], [H13],         [P5],       [Input],   [Keypad button "D-Pad Left"],
    [122], [148], [H14],         [P7],       [Input],   [Keypad button "D-Pad Down"],
    [123], [149], [G13],         [P4],       [Input],   [Keypad button "D-Pad Right"],
    [124], [150], [ \-],         [FIQ],      [Unknown], [Unknown purpose],
    [125], [151], [C13], overline[RESET],    [Input],   [Device reset],
    [127], [153], [G14],         [P3],       [Input],   [Keypad button "Start"],
    [126], [154], [F13],         [P2],       [Input],   [Keypad button "Select"],
    [ \-], [155], [ D9],         [VDD3],     [Supply],  [3.3V Power supply],
    [128], [156], [K13],         [GND],      [Supply],  [Ground reference],
    [ \-], [ \-], [D12],         [CN],       [Unknown], [Unknown purpose],
    [ \-], [ \-], [F12],         [RS],       [Unknown], [Unknown purpose],
    [ \-], [ \-], [ E4],         [VDD3],     [Supply],  [3.3V Power supply],
    [ \-], [ \-], [E11],         [VDD3],     [Supply],  [3.3V Power supply],
    [ \-], [ \-], [G12],         [VDD3],     [Supply],  [3.3V Power supply],
    [ \-], [ \-], [J11],         [VDD3],     [Supply],  [3.3V Power supply],
    [ \-], [ \-], [ K4],         [VDD3],     [Supply],  [3.3V Power supply],
    [ \-], [ \-], [K12],         [VDD3],     [Supply],  [3.3V Power supply],
    [ \-], [ \-], [ L8],         [VDD3],     [Supply],  [3.3V Power supply],
    [ \-], [ \-], [L10],         [VDD3],     [Supply],  [3.3V Power supply],
    [ \-], [ \-], [ M4],         [VDD3],     [Supply],  [3.3V Power supply],
    [ \-], [ \-], [ L7],         [VDD1],     [Supply],  [1.8V Power supply],
    [ \-], [ \-], [ L4],         [GND],      [Supply],  [Ground reference],
    [ \-], [ \-], [ L6],         [GND],      [Supply],  [Ground reference],
    [ \-], [ \-], [ L9],         [GND],      [Supply],  [Ground reference],
    [ \-], [ \-], [L11],         [GND],      [Supply],  [Ground reference],
    [ \-], [ \-], [L13],         [GND],      [Supply],  [Ground reference],
    [ \-], [ \-], [ M5],         [GND],      [Supply],  [Ground reference],
    [ \-], [ \-], [ M7],         [GND],      [Supply],  [Ground reference],
  ),
  caption: "CPU AGB A/B/E pin definition",
)

#pagebreak()

= Memory Map
#figure(
  rect(
    image("images/memory_map.svg", width: 100%),
  ),
  caption: "Memory map"
)

#pagebreak()

= Package Information
== QFP-128 Package Information
#figure(
  rect(
    image("images/qfp-128_package.svg", width: 100%),
  ),
  caption: "QFP-128 package outline"
)

1. Drawing is not to scale.

#figure(
  table(
    columns: (1fr, 1fr, 1fr),
    table.header(strong([Symbol]), strong([Millimeters]), strong([Inches])),
    table.hline(y: 1, stroke: 1pt),
    [A],  [2.000],  [0.0787],
    [b],  [0.300],  [0.0118],
    [c],  [0.100],  [0.0039],
    [D],  [22.600], [0.8898],
    [D1], [20.000], [0.7874],
    [D3], [18.500], [0.7283],
    [E],  [16.600], [0.6535],
    [E1], [14.000], [0.5512],
    [E3], [12.500], [0.4921],
    [e],  [0.500],  [0.0197],
    [L1], [1.300],  [0.0512],
  ),
  caption: "QFP-128 mechanical data",
)

1. Values in inches are converted from mm and rounded to 4 decimal digits.

#pagebreak()

#figure(
  rect(
    image("images/qfp-128_footprint.svg", width: 100%),
  ),
  caption: "Recommended footprint for QFP-128 package"
)

1. Dimensions are expressed in millimeters.

#pagebreak()

== QFP-156 Package Information
#figure(
  rect(
    image("images/qfp-156_package.svg", width: 100%),
  ),
  caption: "QFP-156 package outline"
)

1. Drawing is not to scale.

#figure(
  table(
    columns: (1fr, 1fr, 1fr),
    table.header(strong([Symbol]), strong([Millimeters]), strong([Inches])),
    table.hline(y: 1, stroke: 1pt),
    [A],  [2.000],  [0.0787],
    [b],  [0.200],  [0.0079],
    [c],  [0.100],  [0.0039],
    [D],  [22.600], [0.8898],
    [D1], [20.000], [0.7874],
    [D3], [18.000], [0.7087],
    [E],  [16.600], [0.6535],
    [E1], [14.000], [0.5512],
    [E3], [12.400], [0.4882],
    [e],  [0.400],  [0.0157],
    [L1], [1.300],  [0.0512],
  ),
  caption: "QFP-156 mechanical data",
)

1. Values in inches are converted from mm and rounded to 4 decimal digits.

#pagebreak()

#figure(
  rect(
    image("images/qfp-156_footprint.svg", width: 100%),
  ),
  caption: "Recommended footprint for QFP-156 package"
)

1. Dimensions are expressed in millimeters.

#pagebreak()

== CSP-BGA-160 Package Information
#figure(
  rect(
    image("images/csp-bga-160_package.svg", width: 100%),
  ),
  caption: "CSP-BGA-160 package outline"
)

1. Drawing is not to scale.

#figure(
  table(
    columns: (1fr, 1fr, 1fr),
    table.header(strong([Symbol]), strong([Millimeters]), strong([Inches])),
    table.hline(y: 1, stroke: 1pt),
    [A],  [1.400],  [0.0551],
    [A2], [1.000],  [0.0394],
    [b],  [0.500],  [0.0197],
    [D],  [12.000], [0.4724],
    [D1], [10.400], [0.4094],
    [E],  [12.000], [0.4724],
    [E1], [10.400], [0.4094],
    [e],  [0.800],  [0.0315],
  ),
  caption: "CSP-BGA-160 mechanical data",
)

1. Values in inches are converted from mm and rounded to 4 decimal digits.

#pagebreak()

#figure(
  rect(
    image("images/csp-bga-160_footprint.svg", width: 100%),
  ),
  caption: "Recommended footprint for CSP-BGA-160 package"
)

1. Dimensions are expressed in millimeters.

#pagebreak()

= Revision History
#figure(
  table(
    columns: (25mm, 20mm, 1fr),
    table.header(strong([Date]), strong([Revision]), strong([Changes])),
    table.hline(y: 1, stroke: 1pt),
    [2025-08-29], [0], [Initial release],
  ),
  caption: "Revision history",
)

= Sources
#set enum(numbering: "[1]")
 + NOCASH, "GBATEK", #link("https://problemkaputt.de/gbatek.htm")
 + gbadev, "gbadoc", #link("https://gbadev.net/gbadoc")
 + RetroSix, "Schematics (Game Boy Advance)", #link("https://www.retrosix.wiki/schematics-game-boy-advance")
 + Gekkio, "gb-schematics", #link("https://github.com/Gekkio/gb-schematics")
 + HDR, "Game_Boy_Micro_Schematic", #link("https://github.com/HDR/Game_Boy_Micro_Schematic")
 + nataliethenerd, "boardscans", #link("https://github.com/nataliethenerd/boardscans")
 + SHARP, "LQ035Q7DH07 LCD Module", #link("https://www.mouser.com/datasheet/2/365/LQ035Q7DH07N_SPEC_LD-21910A-184021.pdf")
