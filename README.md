# s3-validator

Validate an AWS S3 `CRC64NVME` checksum against a locally computed hash.

## Build

Requirements:
- `g++` with C++17 support
- `make`

Build with automatic CPU core detection (default):

```bash
make
```

Explicit fast build target:

```bash
make build-fast
```

The Makefile uses all detected CPU cores (`-j<N>`) and optimized compiler flags (`-O3`, `-flto`) for faster builds and runtime performance.

## Test

Run the built-in self-test:

```bash
make test
```

## Usage

Hash a file:

```bash
./crc64nvme_s3 /path/to/file
```

Hash stdin:

```bash
cat /path/to/file | ./crc64nvme_s3
```

The tool outputs:
- CRC64NVME in lowercase hex
- S3-compatible base64 checksum value

## Clean

```bash
make clean
```
