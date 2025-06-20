# .mk files
MK += Makefile
MK += $(wildcard   mk/*.mk)
MK += $(wildcard   hw/*.mk)
MK += $(wildcard  cpu/*.mk)
MK += $(wildcard arch/*.mk)
MK += $(wildcard   os/*.mk)

# cmake files
CM += CMake* cmake/*.cmake

# C/C++
C += $(wildcard src/*.c*)
H += $(wildcard inc/*.h*)

# ini
F += $(wildcard lib/*.ini) $(wildcard lib/*.f)

# Rust
R += $(wildcard      ./src/*.rs)      ./Cargo.toml
R += $(wildcard config/src/*.rs) config/Cargo.toml
R += $(wildcard server/src/*.rs) server/Cargo.toml
