# Jekyll post-commit hook to generate a changelog page 

## Description

This hook prepend line to `CHANGELOG.md` for each commit of type "feat"
or "fix".  
Secret paths can be declared so that related commits do not generate changelog updates.

## Demo

See https://kray.me/changelog 

## Installation

* Copy `.githooks/post-commit` to your Jekyll repository `.git/hooks` directory
* Copy `CHANGELOG.md`
