# MSWSACC Middle Square Weyl Sequence PRNG accelerator

### Purpose:
Generates Gigabytes of random numbers in seconds with 8 (pref. true, non-deterministic) random bytes as seed input.<br>
Beware not to use the Middle Square Weyl Sequence Pseudo Random Number Generator (PRNG) for cryptographic purposes. For experimental purposes it seems well suited, see the tests.<br>
After each cycle of the (deterministic) PRNG is complete, after 2^64 generated integers, it gets another 8 bytes as the new input for the PRNG from STDIN.<br>
MSWSACC compiles without problems with Freepascal under Linux x86_64 and armv7l cpu architectures.

### Usage example with a True Random Number generator (like ESPTRNG) connected at /dev/ttyUSB0:
`mswsacc < /dev/ttyUSB0 > test.bin` generates random 32 bit unsigned integers until CTRL-C is pressed<br>
`mswsacc 200 < /dev/ttyUSB0 > test.bin` generates 200 random 32 bit unsigned integers

### NIST SP800-22 tests on a generated file of 3.8 MB:
```
monobit_test                             0.0634818214509248 PASS
frequency_within_block_test              0.6924858953469919 PASS
runs_test                                0.9262748034964932 PASS
longest_run_ones_in_a_block_test         0.6547922625009353 PASS
binary_matrix_rank_test                  0.852925284726966  PASS
non_overlapping_template_matching_test   1.1137129517682542 PASS
overlapping_template_matching_test       0.5335772305959419 PASS
maurers_universal_test                   0.7649067833249454 PASS
linear_complexity_test                   0.2248646639449576 PASS
serial_test                              0.11260278887152009 PASS
approximate_entropy_test                 0.16322490566057682 PASS
cumulative_sums_test                     0.09451951151361992 PASS
random_excursion_test                    0.08648169848539744 PASS
random_excursion_variant_test            0.04919919819432342 PASS
```

### Tests on a generated file of 2.1 GB:
**Me:**
```
minimum entropy: 0.99999938 bits per bit
```
**Ent:**
```
Entropy = 1.000000 bits per bit.

Optimum compression would reduce the size
of this 17854437376 bit file by 0 percent.

Chi square distribution for 17854437376 samples is 0.00, and randomly
would exceed this value 95.43 percent of the times.

Arithmetic mean value of data bits is 0.5000 (0.5 = random).
Monte Carlo value for Pi is 3.141578027 (error 0.00 percent).
Serial correlation coefficient is -0.000006 (totally uncorrelated = 0.0).
```
**Rngtest:**
```
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
**Dieharder:**
```
#=============================================================================#
#            dieharder version 3.31.2 Copyright 2003 Robert G. Brown          #
#=============================================================================#
   rng_name    |           filename             |rands/second|
 file_input_raw|                        test.bin|  1.98e+07  |
#=============================================================================#
        test_name   |ntup| tsamples |psamples|  p-value |Assessment
#=============================================================================#
   diehard_birthdays|   0|       100|     100|0.89337161|  PASSED  
      diehard_operm5|   0|   1000000|     100|0.06887330|  PASSED  
  diehard_rank_32x32|   0|     40000|     100|0.77191437|  PASSED  
    diehard_rank_6x8|   0|    100000|     100|0.60933611|  PASSED  
   diehard_bitstream|   0|   2097152|     100|0.72439908|  PASSED  
        diehard_opso|   0|   2097152|     100|0.18905248|  PASSED  
# The file file_input_raw was rewound 1 times
        diehard_oqso|   0|   2097152|     100|0.57352828|  PASSED  
# The file file_input_raw was rewound 1 times
         diehard_dna|   0|   2097152|     100|0.15831592|  PASSED  
# The file file_input_raw was rewound 1 times
diehard_count_1s_str|   0|    256000|     100|0.64033373|  PASSED  
# The file file_input_raw was rewound 1 times
diehard_count_1s_byt|   0|    256000|     100|0.84083496|  PASSED  
# The file file_input_raw was rewound 1 times
 diehard_parking_lot|   0|     12000|     100|0.86439180|  PASSED  
# The file file_input_raw was rewound 1 times
    diehard_2dsphere|   2|      8000|     100|0.84373241|  PASSED  
# The file file_input_raw was rewound 1 times
    diehard_3dsphere|   3|      4000|     100|0.95302755|  PASSED  
# The file file_input_raw was rewound 1 times
     diehard_squeeze|   0|    100000|     100|0.63809322|  PASSED  
# The file file_input_raw was rewound 1 times
        diehard_sums|   0|       100|     100|0.00719716|  PASSED  
# The file file_input_raw was rewound 2 times
        diehard_runs|   0|    100000|     100|0.50263277|  PASSED  
        diehard_runs|   0|    100000|     100|0.20790265|  PASSED  
# The file file_input_raw was rewound 2 times
       diehard_craps|   0|    200000|     100|0.50890230|  PASSED  
       diehard_craps|   0|    200000|     100|0.41069742|  PASSED  
# The file file_input_raw was rewound 5 times
 marsaglia_tsang_gcd|   0|  10000000|     100|0.60620921|  PASSED  
 marsaglia_tsang_gcd|   0|  10000000|     100|0.42993544|  PASSED  
# The file file_input_raw was rewound 5 times
         sts_monobit|   1|    100000|     100|0.79006837|  PASSED  
# The file file_input_raw was rewound 5 times
            sts_runs|   2|    100000|     100|0.99093833|  PASSED  
# The file file_input_raw was rewound 5 times
          sts_serial|   1|    100000|     100|0.37027351|  PASSED  
          sts_serial|   2|    100000|     100|0.80528733|  PASSED  
          sts_serial|   3|    100000|     100|0.56591448|  PASSED  
          sts_serial|   3|    100000|     100|0.95744572|  PASSED  
          sts_serial|   4|    100000|     100|0.92433676|  PASSED  
          sts_serial|   4|    100000|     100|0.85600142|  PASSED  
          sts_serial|   5|    100000|     100|0.35307652|  PASSED  
          sts_serial|   5|    100000|     100|0.68659280|  PASSED  
          sts_serial|   6|    100000|     100|0.32244548|  PASSED  
          sts_serial|   6|    100000|     100|0.21518917|  PASSED  
          sts_serial|   7|    100000|     100|0.88217300|  PASSED  
          sts_serial|   7|    100000|     100|0.70165098|  PASSED  
          sts_serial|   8|    100000|     100|0.72694956|  PASSED  
          sts_serial|   8|    100000|     100|0.64412466|  PASSED  
          sts_serial|   9|    100000|     100|0.96494495|  PASSED  
          sts_serial|   9|    100000|     100|0.86804714|  PASSED  
          sts_serial|  10|    100000|     100|0.78893785|  PASSED  
          sts_serial|  10|    100000|     100|0.60498980|  PASSED  
          sts_serial|  11|    100000|     100|0.28201985|  PASSED  
          sts_serial|  11|    100000|     100|0.18137894|  PASSED  
          sts_serial|  12|    100000|     100|0.63715654|  PASSED  
          sts_serial|  12|    100000|     100|0.69608441|  PASSED  
          sts_serial|  13|    100000|     100|0.82226611|  PASSED  
          sts_serial|  13|    100000|     100|0.67027935|  PASSED  
          sts_serial|  14|    100000|     100|0.81174158|  PASSED  
          sts_serial|  14|    100000|     100|0.63334155|  PASSED  
          sts_serial|  15|    100000|     100|0.97445845|  PASSED  
          sts_serial|  15|    100000|     100|0.27314612|  PASSED  
          sts_serial|  16|    100000|     100|0.86505020|  PASSED  
          sts_serial|  16|    100000|     100|0.98047233|  PASSED  
# The file file_input_raw was rewound 5 times
         rgb_bitdist|   1|    100000|     100|0.79204814|  PASSED  
# The file file_input_raw was rewound 6 times
         rgb_bitdist|   2|    100000|     100|0.20794440|  PASSED  
# The file file_input_raw was rewound 6 times
         rgb_bitdist|   3|    100000|     100|0.83396662|  PASSED  
# The file file_input_raw was rewound 6 times
         rgb_bitdist|   4|    100000|     100|0.07016726|  PASSED  
# The file file_input_raw was rewound 6 times
         rgb_bitdist|   5|    100000|     100|0.03357633|  PASSED  
# The file file_input_raw was rewound 6 times
         rgb_bitdist|   6|    100000|     100|0.84586285|  PASSED  
# The file file_input_raw was rewound 6 times
         rgb_bitdist|   7|    100000|     100|0.69468433|  PASSED  
# The file file_input_raw was rewound 7 times
         rgb_bitdist|   8|    100000|     100|0.08627878|  PASSED  
# The file file_input_raw was rewound 7 times
         rgb_bitdist|   9|    100000|     100|0.34571524|  PASSED  
# The file file_input_raw was rewound 7 times
         rgb_bitdist|  10|    100000|     100|0.30832294|  PASSED  
# The file file_input_raw was rewound 8 times
         rgb_bitdist|  11|    100000|     100|0.19928736|  PASSED  
# The file file_input_raw was rewound 8 times
         rgb_bitdist|  12|    100000|     100|0.25975922|  PASSED  
# The file file_input_raw was rewound 8 times
rgb_minimum_distance|   2|     10000|    1000|0.47388336|  PASSED  
# The file file_input_raw was rewound 8 times
rgb_minimum_distance|   3|     10000|    1000|0.07455086|  PASSED  
# The file file_input_raw was rewound 8 times
rgb_minimum_distance|   4|     10000|    1000|0.43378855|  PASSED  
# The file file_input_raw was rewound 8 times
rgb_minimum_distance|   5|     10000|    1000|0.31456633|  PASSED  
# The file file_input_raw was rewound 8 times
    rgb_permutations|   2|    100000|     100|0.99365346|  PASSED  
# The file file_input_raw was rewound 9 times
    rgb_permutations|   3|    100000|     100|0.95697284|  PASSED  
# The file file_input_raw was rewound 9 times
    rgb_permutations|   4|    100000|     100|0.03079249|  PASSED  
# The file file_input_raw was rewound 9 times
    rgb_permutations|   5|    100000|     100|0.15149365|  PASSED  
# The file file_input_raw was rewound 9 times
      rgb_lagged_sum|   0|   1000000|     100|0.06655465|  PASSED  
# The file file_input_raw was rewound 9 times
      rgb_lagged_sum|   1|   1000000|     100|0.95182496|  PASSED  
# The file file_input_raw was rewound 10 times
      rgb_lagged_sum|   2|   1000000|     100|0.27455588|  PASSED  
# The file file_input_raw was rewound 10 times
      rgb_lagged_sum|   3|   1000000|     100|0.65108227|  PASSED  
# The file file_input_raw was rewound 11 times
      rgb_lagged_sum|   4|   1000000|     100|0.82712449|  PASSED  
# The file file_input_raw was rewound 12 times
      rgb_lagged_sum|   5|   1000000|     100|0.88243586|  PASSED  
# The file file_input_raw was rewound 14 times
      rgb_lagged_sum|   6|   1000000|     100|0.53875231|  PASSED  
# The file file_input_raw was rewound 15 times
      rgb_lagged_sum|   7|   1000000|     100|0.14184753|  PASSED  
# The file file_input_raw was rewound 17 times
      rgb_lagged_sum|   8|   1000000|     100|0.94412537|  PASSED  
# The file file_input_raw was rewound 19 times
      rgb_lagged_sum|   9|   1000000|     100|0.87393627|  PASSED  
# The file file_input_raw was rewound 21 times
      rgb_lagged_sum|  10|   1000000|     100|0.84708634|  PASSED  
# The file file_input_raw was rewound 23 times
      rgb_lagged_sum|  11|   1000000|     100|0.98009576|  PASSED  
# The file file_input_raw was rewound 25 times
      rgb_lagged_sum|  12|   1000000|     100|0.26455956|  PASSED  
# The file file_input_raw was rewound 28 times
      rgb_lagged_sum|  13|   1000000|     100|0.83379860|  PASSED  
# The file file_input_raw was rewound 30 times
      rgb_lagged_sum|  14|   1000000|     100|0.14700844|  PASSED  
# The file file_input_raw was rewound 33 times
      rgb_lagged_sum|  15|   1000000|     100|0.36720971|  PASSED  
# The file file_input_raw was rewound 36 times
      rgb_lagged_sum|  16|   1000000|     100|0.53312205|  PASSED  
# The file file_input_raw was rewound 39 times
      rgb_lagged_sum|  17|   1000000|     100|0.21829626|  PASSED  
# The file file_input_raw was rewound 43 times
      rgb_lagged_sum|  18|   1000000|     100|0.29422752|  PASSED  
# The file file_input_raw was rewound 46 times
      rgb_lagged_sum|  19|   1000000|     100|0.37725149|  PASSED  
# The file file_input_raw was rewound 50 times
      rgb_lagged_sum|  20|   1000000|     100|0.55101811|  PASSED  
# The file file_input_raw was rewound 54 times
      rgb_lagged_sum|  21|   1000000|     100|0.41190432|  PASSED  
# The file file_input_raw was rewound 58 times
      rgb_lagged_sum|  22|   1000000|     100|0.72189141|  PASSED  
# The file file_input_raw was rewound 62 times
      rgb_lagged_sum|  23|   1000000|     100|0.63270829|  PASSED  
# The file file_input_raw was rewound 67 times
      rgb_lagged_sum|  24|   1000000|     100|0.37598646|  PASSED  
# The file file_input_raw was rewound 72 times
      rgb_lagged_sum|  25|   1000000|     100|0.63050946|  PASSED  
# The file file_input_raw was rewound 76 times
      rgb_lagged_sum|  26|   1000000|     100|0.92395525|  PASSED  
# The file file_input_raw was rewound 81 times
      rgb_lagged_sum|  27|   1000000|     100|0.53383614|  PASSED  
# The file file_input_raw was rewound 87 times
      rgb_lagged_sum|  28|   1000000|     100|0.62246592|  PASSED  
# The file file_input_raw was rewound 92 times
      rgb_lagged_sum|  29|   1000000|     100|0.37968022|  PASSED  
# The file file_input_raw was rewound 98 times
      rgb_lagged_sum|  30|   1000000|     100|0.23090545|  PASSED  
# The file file_input_raw was rewound 103 times
      rgb_lagged_sum|  31|   1000000|     100|0.00000047|  FAILED  
# The file file_input_raw was rewound 109 times
      rgb_lagged_sum|  32|   1000000|     100|0.58627692|  PASSED  
# The file file_input_raw was rewound 109 times
     rgb_kstest_test|   0|     10000|    1000|0.97980653|  PASSED  
# The file file_input_raw was rewound 110 times
     dab_bytedistrib|   0|  51200000|       1|0.39368805|  PASSED  
# The file file_input_raw was rewound 110 times
             dab_dct| 256|     50000|       1|0.72994918|  PASSED  
Preparing to run test 207.  ntuple = 0
# The file file_input_raw was rewound 110 times
        dab_filltree|  32|  15000000|       1|0.90724832|  PASSED  
        dab_filltree|  32|  15000000|       1|0.60598661|  PASSED  
Preparing to run test 208.  ntuple = 0
# The file file_input_raw was rewound 110 times
       dab_filltree2|   0|   5000000|       1|0.78276380|  PASSED  
       dab_filltree2|   1|   5000000|       1|0.66017137|  PASSED  
Preparing to run test 209.  ntuple = 0
# The file file_input_raw was rewound 110 times
        dab_monobit2|  12|  65000000|       1|0.89657979|  PASSED  
```
### Sources:
https://arxiv.org/pdf/1704.00358.pdf<br>
https://github.com/Wanderingidea/ATtinyTRNG<br>
https://github.com/Wanderingidea/ESPTRNG<br>
https://github.com/Wanderingidea/NanoTRNG<br>
https://www.freepascal.org/
