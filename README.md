# Nostalgic-codes

Code from my teenage years and early university projects, mostly low-level programming for hardware. Kept here as an archive, so expect rough edges.

## What is inside

| Path | Description |
|---|---|
| `msp430.c` | MSP430G2553 microcontroller code (serial reception and interrupts). |
| `main.asm`, `ex_.asm`, `ex_7g.asm`, `definindo_vars.asm`, `prova_micro.asm` | AVR assembly exercises (external interrupts, pin-change events, variables). |
| `Adafruit_jun_9.ino`, `sketch_may12a.ino`, `yuri_e_lucas.ino`, `pressure_sensor.c` | Arduino sketches, including a pressure sensor read out on a PCD8544 (Nokia 5110) display. |
| `acelerometro`, `total_acceleration.c` | Accelerometer experiments. |
| `PC Completo/` | Quartus/VHDL project for a simple processor and counters. |
| `Relogio script/` | Clock project. |
| `alg.c`, `medico_tosco.c`, `lista_exs6e7.asm`, `lista_utfpr.c` | Beginner C and assembly exercises (a toy symptom checker, input/printf practice, course problem sets). |

## Notes

- The `PC Completo/` folder contains Quartus build artifacts with very long paths. On Windows, enable long paths before cloning: `git config --global core.longpaths true`.
- Licensed under GPL-3.0 (see `LICENSE`).
