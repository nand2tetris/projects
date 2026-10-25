# NAND2Tetris Projects

These are the official project files for the NAND2Tetris Course.

For downloads of the Java simulator, [click here](https://www.nand2tetris.org/software).

For the web ide, [click here](https://nand2tetris.github.io/web-ide/).

## Releasing

Each release attaches a `projects.zip` that holds the `projects` folder and this README. Release tags are formatted `YYYY-WW-N`: the year, the ISO week number, and a counter that starts at 1 within that week. For example, `2025-52-1` was the first release in ISO week 52 of 2025. Run `date +%G-%V` to get the first two parts.

To publish a release, either:

- Run the **Release Packer** workflow from the Actions tab, or `gh workflow run release.yml -f tag=2026-43-1`. It creates the tag on the latest commit of `main`, generates release notes, and attaches `projects.zip`.
- Or publish a release by hand from the Releases page. The workflow runs when the release is published and attaches `projects.zip` to it.

Merge changes to `main` before releasing, since the zip is built from the tagged commit. Check the result with `gh release view --json assets`.
