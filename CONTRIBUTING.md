# Contributing to AstraRTOS

## Commit Messages

Write commit messages with a title and description:

```
<area>: <short summary>

<detailed description of what and why>

Signed-off-by: Your Name <your@email.com>
```

### Example

```
scheduler: add task switching

Implements basic scheduling with a ready queue
SysTick triggers PendSV for context switch every 1ms

Signed-off-by: Vedant Malkar <vedant@example.com>
```

### Areas

Use one of these prefixes in the title for the area:

- `startup` - startup code, vector table
- `linker` - linker script changes
- `build` - Makefile, toolchain
- `boot` - inital bring up
- `scheduler` - scheduling, context switch
- `kernel` - core kernel (task, delay, yield)
- `sync` - mutex, semaphore, queue, events
- `drivers` - GPIO, UART, SysTick, etc.
- `docs` - documentation
- `app` - application / demo code

## Branches

When contributing create properly named branch to be merged

- Feature branches - `<area>/<feature>`, e.g. `drivers/gpio-driver`

## Build and Test

Before pushing, make sure your code compiles:

```bash
make clean && make
```
