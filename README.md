# Overview

This repo contains projects in different languages, specifically Python, TypeScript, and Java.

The same application (as close as possible) is coded in each language with the same test as well.
In the base case, the test will actuall **NOT** test anything, meaning it doesn't call any methods from the *testee*.

The results obviously depend on the frameworks/libraries/packages used in each project/language, but popular ones are used.

# Python

The python project is available [here](./python/myapp).

Here [Coverage.py](https://coverage.readthedocs.io/en/6.4.2/) will report a surprising **57% code coverage**, even though not a single method has been called on the `MyService` class.

# TypeScript

The TypeScript project is available [here](./ts/myapp).

Here [NYC](https://github.com/istanbuljs/nyc) will report nothing at first. Instantiating the `MyService` class will then report a 0% code coverage for functions, as expected.

# Java

The Java project is available [here](./java/myapp).

[JaCoCo]() here is used and it will report 0% code coverage as expected.