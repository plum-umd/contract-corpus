# contract-corpus
Corpus of programs with contracts

Annotations:
- safe: definitely safe
- unsafe: definitely unsafe
- rt-unsafe: unsafe, found with random testing
- rt-out-memory: random testing ran out of memory
- rt-out-time: random testing ran out of time
- scv-safe: safe, proved by SCV
- scv-unsafe: unsafe, found with SCV concrete counterexample
- scv-unknown: maybe unsafe, found with SCV abstract counterexample
- scv-out-memory: random testing ran out of memory
- scv-out-time: random testing ran out of time
- scv-crash: SCV crashes on this program
