## Developing

Basic tests can be executed (headless) directly using the standalone Dart VM:

```bash
# Runs tests that can executed headless using the standalone Dart VM.
$ pub run test -P headless
```

To run tests that require a browser, use `build_runner`:

```bash
# Runs tests that are compiled using dartdevc and run on Chrome.
$ pub run build_runner test -- -P browser
```
