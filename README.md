# Embedded Fundamentals

A collection of small projects and experiments created to develop practical embedded software engineering skills.

The repository focuses on bare-metal programming in C, direct STM32 peripheral configuration, debugging, automated testing and understanding how microcontroller hardware interacts with firmware.

Most hardware exercises target the **NUCLEO-F446RE** development board with the STM32F446RE microcontroller.

> This is a learning repository rather than a single finished application. Larger and more complete projects are maintained in separate repositories.

## Current status

The repository currently contains the initial STM32F446RE project scaffold, CMake configuration, compiler warnings, formatting rules and a working GitHub Actions build.

The planned labs, tests and additional documentation will be introduced gradually when they are first needed. The directory structure described below represents the intended evolution of the repository rather than its current state.

## Learning approach and AI use

This repository is used both to learn embedded systems and to practise responsible AI-assisted engineering.

Each exercise defines a protected learning target: the part that must be designed, implemented and explained independently. AI tools may support the surrounding work, but must not replace the skill currently being learned.

AI tools may be used to:

* locate and explain relevant documentation;
* clarify concepts and ask guiding questions;
* refine requirements and test plans;
* review implementation plans, code, tests and documentation;
* help interpret compiler errors, debugger state and measurements;
* suggest additional experiments after an independent attempt.

AI tools should not be used to:

* implement the protected learning target before an independent attempt;
* provide a ready-made peripheral configuration when that configuration is the subject being learned;
* replace verification against primary documentation and physical hardware;
* invent measurements, test results or technical conclusions.

AI-generated code may be used outside the protected learning target only when it is reviewed, understood and verified before being committed.

Completing an exercise requires being able to explain the relevant code, design decisions and verification results in one's own words.

## Objectives

The main objectives of this repository are to:

* understand ARM Cortex-M and STM32 fundamentals;
* configure peripherals directly through registers;
* learn how to use microcontroller documentation effectively;
* write modular and testable C code;
* work with interrupts, timers and DMA;
* implement common embedded data structures and state machines;
* separate application logic from hardware-dependent code;
* test selected firmware modules on a development computer;
* verify firmware using measurements and automated hardware tests;
* document technical decisions and debugging processes.

## Hardware

The primary development platform is:

* NUCLEO-F446RE;
* STM32F446RE microcontroller;
* integrated ST-LINK debugger and programmer.

Additional hardware is introduced in individual labs when required, for example:

* BME280 environmental sensor;
* SPI Flash memory;
* USB-to-UART connection;
* logic analyzer;
* oscilloscope;
* breadboard and basic electronic components.

Each lab contains its own hardware requirements and connection description.

## Software and tools

The repository is intended to use:

* ARM GNU Toolchain;
* CMake;
* Ninja or Make;
* OpenOCD;
* GDB;
* Python 3;
* Git;
* a serial terminal;
* host-side unit tests.

```markdown
Detailed installation and configuration instructions will be added when the first lab introduces the complete flashing and debugging workflow.

## Planned repository structure

```text
STM32F446RE-Fundamentals/
├── README.md
├── LICENSE
├── .gitignore
├── .clang-format
├── CMakeLists.txt
├── CMakePresets.json
│
├── cmake/
│   └── arm-none-eabi-toolchain.cmake
│
├── platform/
│   └── stm32f446re/
│       ├── startup/
│       ├── linker/
│       ├── include/
│       └── src/
│
├── third_party/
│   └── cmsis/
│
├── common/
│   ├── include/
│   └── src/
│
├── labs/
│   ├── 01-gpio-registers/
│   ├── 02-systick-delay/
│   ├── 03-timer-interrupt/
│   ├── 04-uart-polling/
│   ├── 05-uart-ring-buffer/
│   ├── 06-finite-state-machine/
│   ├── 07-i2c-bme280/
│   ├── 08-spi-flash/
│   ├── 09-adc-timer-trigger/
│   ├── 10-adc-dma/
│   └── 11-python-hardware-tests/
│
├── tests/
│   ├── unit/
│   └── CMakeLists.txt
│
├── tools/
│
├── docs/
│   ├── setup.md
│   ├── learning-log.md
│   └── debug-log.md
│
└── .github/
    └── workflows/
        └── ci.yml
```

## Planned learning path

### 1. GPIO register configuration

* enable a peripheral clock;
* configure GPIO modes;
* control output pins;
* read digital inputs;
* understand read-modify-write operations;
* implement register bit masks.

### 2. SysTick and timing

* configure the SysTick timer;
* implement basic delays;
* understand blocking and non-blocking timing;
* handle timer overflow correctly.

### 3. Timers and interrupts

* configure a general-purpose timer;
* generate periodic interrupts;
* configure the NVIC;
* understand interrupt flags;
* keep interrupt service routines short.

### 4. UART communication

* implement polling-based transmission and reception;
* calculate the baud-rate register value;
* implement interrupt-driven communication;
* create a ring buffer;
* detect and handle communication errors.

### 5. Finite-state machines

* model application behaviour using states and events;
* separate state transitions from hardware access;
* avoid blocking application logic;
* test state transitions on a development computer.

### 6. I2C sensor driver

* implement basic I2C communication;
* communicate with a BME280 sensor;
* read and verify device identification;
* handle timeouts and missing devices;
* convert raw sensor data into usable measurements.

### 7. SPI Flash memory

* implement SPI communication;
* read the memory identification;
* perform read, write and erase operations;
* handle device-busy states;
* verify stored data.

### 8. ADC and DMA

* configure ADC conversion;
* trigger conversions using a timer;
* transfer samples using DMA;
* process data without continuously blocking the processor;
* detect buffer completion events.

### 9. Testing

* test hardware-independent C modules on a computer;
* use fake hardware interfaces;
* test edge cases and error paths;
* automate serial communication tests with Python;
* run selected checks using continuous integration.

## Lab structure

Each lab should contain a small, focused implementation and its own documentation.

A typical lab directory has the following structure:

```text
labs/05-uart-ring-buffer/
├── README.md
├── CMakeLists.txt
├── include/
└── src/
    └── main.c
```

The local README should describe:

* the purpose of the lab;
* required hardware;
* peripheral configuration;
* important design decisions;
* building and flashing instructions;
* verification procedure;
* observed results;
* known limitations.

## Design principles

The exercises follow several general rules:

* peripheral behaviour should be understood before it is abstracted;
* register-level labs should not hide configuration behind STM32 HAL functions;
* CMSIS device definitions may be used to access registers;
* `main.c` should coordinate modules rather than contain all implementation details;
* hardware-dependent and hardware-independent code should be separated;
* reusable modules should expose small and clear interfaces;
* error conditions and timeouts should be handled explicitly;
* important behaviour should be verified using tests or measurements;
* the `main` branch should contain code that builds successfully.

These rules may be introduced gradually as the repository develops.

## Building

Clone the repository:

```bash
git clone https://github.com/AdamAntoniKrupa/STM32F446RE-Fundamentals.git
cd STM32F446RE-Fundamentals

Configure and build the Debug firmware:

```bash
cmake --preset Debug
cmake --build --preset Debug --parallel
```

The exact build command depends on the selected lab. Detailed toolchain configuration and build instructions are described in [`docs/setup.md`](docs/setup.md).

Example CMake workflow:

```bash
cmake --preset nucleo-f446re-debug
cmake --build --preset nucleo-f446re-debug --target <lab-target>
```

The repository currently produces a single Fundamentals.elf target. Lab-specific targets, flashing instructions and verification procedures will be added together with the individual labs.

## Testing

Hardware-independent modules should be tested on the host computer whenever possible.

The test suite may include:

* unit tests for data structures;
* state-machine transition tests;
* command-parser tests;
* driver tests using fake hardware interfaces;
* Python tests communicating with the board through UART;
* build and test checks executed in GitHub Actions.

Host-side test presets have not been introduced yet. They will be added together with the first hardware-independent module.

## Documentation

Planned documentation includes:

* development environment setup;
* learning log;
* debugging log;
* per-lab build, flashing and verification instructions.

## Project status

This repository is under active development.

Exercises and documentation are added gradually as new topics are studied. The repository is expected to evolve together with the increasing complexity of the projects.

Larger projects that combine multiple concepts into complete systems will be maintained in separate repositories.

## License

Project-wide licensing has not yet been documented. Generated STMicroelectronics files retain their original copyright notices. Licensing will be addressed in a separate repository task.
