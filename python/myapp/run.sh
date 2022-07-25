#!/bin/bash

unittest() {
    env PYTHONPATH=src/:test/ python3 -m coverage run -m unittest discover . -p '*_test.py'
}

report() {
    env PYTHONPATH=src/:test/ python3 -m coverage report && python3 -m coverage html
}

help() {
    declare -a LINES
    LINES+=("Usage: $0 [command]")
    LINES+=("\nPossible commands:")
    LINES+=("\n  unittest\t\t# Run tests using unittest package")
    LINES+=("\n  report\t\t# Generate coverge report")
    
    LINES+=("\n")
    echo -e "${LINES[@]}"
}

case $1 in
    unittest)
      unittest
      ;;
    report)
      report
      ;;
    *)
      help
esac