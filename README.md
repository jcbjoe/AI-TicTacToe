# TicTacToe

## Overview

This is a solver for [tic-tac-toe](https://en.wikipedia.org/wiki/Tic-tac-toe), written in C++.

The program 

(1) searches the game tree using a [minimax](https://en.wikipedia.org/wiki/Minimax) algorithm with or without [alpha-beta pruning](https://en.wikipedia.org/wiki/Alpha%E2%80%93beta_pruning) (depending on the macro `AB_PRUNE` in [TicTacToe.h](TicTacToe/TicTacToe.h));

(2) allows the user to play against the computer.

## Usage

The compiler must support the C++11 standard to compile, e.g. modern versions of [GCC](https://gcc.gnu.org/projects/cxx0x.html) or [Visual Studio](https://msdn.microsoft.com/library/hh567368.aspx).

On Windows, open the Visual Studio solution [TicTacToe.sln](TicTacToe.sln).

On Linux,

```
make
bin/tictactoe
```

## Evaluation Function

For a terminal state with n moves (5 <= n <= 9), the payoff v of the MAX player is evaluated with the following rule:

- If MAX wins, v = +(10 - n)
- If MIN wins, v = -(10 - n)
- If the game is drawn, v = 0

In contrast to a naive three-valued evalution function, this design favors fast wins and slow losses, and therefore avoids unreasonable moves.

## Result

As expected, the minimax profit for both MAX and MIN player is 0, i.e. the game ends in a draw if both player plays perfectly.

### Without Pruning

An unpruned search takes ~100 ms.

Statistics:

| Ply   | MAX   | MIN   |
| ----- | ----- | ----- |
| 1     | 0     | 0     |
| 2     | 0     | 0     |
| 3     | 0     | 0     |
| 4     | 0     | 0     |
| 5     | 1440  | 0     |
| 6     | 0     | 5328  |
| 7     | 47952 | 0     |
| 8     | 0     | 72576 |
| 9     | 81792 | 0     |

```
Draws   46080
Leaves  255168
Nodes   549946
```

### With Pruning

An alpha-beta pruned search takes ~5ms.

Statistics:

| Ply   |  MAX  | MIN   |
| ----- | ----- | ----- |
| 1     | 0     | 0     |
| 2     | 0     | 0     |
| 3     | 0     | 0     |
| 4     | 0     | 0     |
| 5     | 186   | 0     |
| 6     | 0     | 432   |
| 7     | 1924  | 0     |
| 8     | 0     | 2299  |
| 9     | 2294  | 0     |

```
Draws   1318
Leaves  8453
Nodes   20866
```

## Further Work

- More complex games, e.g. [Connect Four](https://en.wikipedia.org/wiki/Connect_Four), [Gomoku](https://en.wikipedia.org/wiki/Gomoku), [Reversi](https://en.wikipedia.org/wiki/Reversi), [checkers](https://en.wikipedia.org/wiki/Draughts), [chess](https://en.wikipedia.org/wiki/Chess), [Go](https://en.wikipedia.org/wiki/Go_(game))

- Heuristic evaluation function

- [Iterative deepening](https://en.wikipedia.org/wiki/Iterative_deepening_depth-first_search)

- [Transposition table](https://en.wikipedia.org/wiki/Transposition_table)

## License

This software is licensed under the MIT License. See [LICENSE](LICENSE).
