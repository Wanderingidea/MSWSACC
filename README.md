# mswsacc Middle Square Weyl Sequence PRNG accelerator

### Purpose:
Generates Gigabytes of random numbers in seconds with 8 bytes as input.<br>
Beware not to use the Middle Square Weyl Sequence Pseudo Random Number Generator (PRNG) for cryptographic purposes. For experimental purposes it seems well suited.<br>
After each cycle of the random number generator is complete (after 2^64 generated integers), it gets another 8 bytes as the new input for the PRNG from STDIN.

### Usage example with a True Random Number generator connected at /dev/ttyUSB0:
`mswsacc < /dev/ttyUSB0 > test.bin`

### Tests on a generated file of 2.1 GB:
```
me < test.bin
minimum entropy: 0.99999938 bits per bit
```
```
ent -b < test.bin
Entropy = 1.000000 bits per bit.

Optimum compression would reduce the size
of this 17854437376 bit file by 0 percent.

Chi square distribution for 17854437376 samples is 0.00, and randomly
would exceed this value 95.43 percent of the times.

Arithmetic mean value of data bits is 0.5000 (0.5 = random).
Monte Carlo value for Pi is 3.141578027 (error 0.00 percent).
Serial correlation coefficient is -0.000006 (totally uncorrelated = 0.0).
```
```
rngtest < test.bin
rngtest 6.16
Copyright (c) 2004 by Henrique de Moraes Holschuh
This is free software; see the source for copying conditions.  There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

rngtest: starting FIPS tests...
rngtest: entropy source drained
rngtest: bits received from input: 17854437376
rngtest: FIPS 140-2 successes: 892029
rngtest: FIPS 140-2 failures: 692
rngtest: FIPS 140-2(2001-10-10) Monobit: 89
rngtest: FIPS 140-2(2001-10-10) Poker: 78
rngtest: FIPS 140-2(2001-10-10) Runs: 258
rngtest: FIPS 140-2(2001-10-10) Long run: 269
rngtest: FIPS 140-2(2001-10-10) Continuous run: 0
rngtest: input channel speed: (min=35.453; avg=4299.985; max=6357.829)Mibits/s
rngtest: FIPS tests speed: (min=1.871; avg=120.826; max=123.854)Mibits/s
rngtest: Program run time: 145018507 microseconds
```
### Sources:
https://arxiv.org/pdf/1704.00358.pdf
