# Confidential Pelusa Challenge

“You just opened your eyes and are in Mexico 1986; help Diego set the score from 1 to 2 goals for a win, and do whatever is necessary!”

## Objective of CTF

- Score from 1 to 2 goals for a win.

## Vulnerabilities

- The next requirement can be easily achieved, we can call the function by the constructor of a contract and the contract size will be equal to 0.

```
require(msg.sender.code.length == 0, "Only EOA players")
```

-

## To solve it we need to...

1. Become a player by successfully calling the function passTheBall().
