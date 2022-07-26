# Overview

This repo contains projects in different languages, specifically Python, TypeScript, and Java.

The same application (as close as possible) is coded in each language with the same test as well.
In the base case, the test will actuall **NOT** test anything, meaning it doesn't call any methods from the *testee*.

The results obviously depend on the frameworks/libraries/packages used in each project/language, but popular ones are used.

# Principle

Regardless of the programming language, the idea is to have basically 2 classes/files: the code and its test.

The test itself will actually test nothing. `The expectation is that we get 0% code coverage.`


The code is very simple and looks like the following (in python):

```python
class MyService:

    def doA(self):
        return "Hello"

    def doB(self):
        return "World"
    
    def doC(self):
        return "!"
```

Its test is just as simple, and it's actually very wrong as it doesn't test (assert) anything:

```python
import unittest
from com.example.my_service import MyService

class MyServiceTest(unittest.TestCase):

    def test_do_it(self):
        print("Not doing it.")
```


# Projects

## Python

Here [Coverage.py](https://coverage.readthedocs.io/en/6.4.2/) will report a surprising **57% code coverage**, even though **not a single method has been called** on the `MyService` class.
It looks more like `Coverage.py` reports *statement coverage** and doesn't (can't?) report at the function level.

The python project is available [here](./python/myapp).

## TypeScript

Here [NYC](https://github.com/istanbuljs/nyc) will report nothing at first. Instantiating the `MyService` class will then report a 0% code coverage for functions, as expected.

At the statement level, `NYC` reports a 25% coverage. Statements can be different between languages but it's interesting here that even the definition of the functions (e.g. `doA(): string {`) is included as a miss, whereas `Coverage.py` will report those as a hit.

The TypeScript project is available [here](./ts/myapp).

## Java

[JaCoCo](https://github.com/jacoco/jacoco) here is used and it will report 0% code coverage as expected.

Even at the statement level Java will report a 0% coverage, as expected.

The Java project is available [here](./java/myapp).

# Takeaways

1. Python code coverage seems to be very tricky to get right. Even when using one of the most famous code coverage tool, `Coverage.py`, reports are very misleading. It also requires some configuration that should be the default to begin with.

2. TypeScript with `NYC` has pretty accurate code coverage reports. It does need to know the objects to be "digested" to run an accurate report on all your classes and code used, but it makes sense out of the box.

3. Java with `JaCoCo` has here the perfect reports. It will load the objects we define in our code without instantiating them, and there's no need to configure anything beyond the basics like in other languages (dependency and usage).
