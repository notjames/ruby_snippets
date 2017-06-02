## Synopsis

**This script requires the following to run:

Ruby ~> 2.3.0
minitest ~> 5.10.0
minitest-reporters ~> 1.1.14
**

Simply run `btree-sds` from the command line. IE ./btree-sds
Do note that this particular script is meant to run the use-cases outlined in the assignment.

There exists another test script used during the authoring of this beast and it is located
in the scripts directory named `deeper_concept`.

## Motivation

This library is my first attempt at writing a btree class driven by a controller that manages the binary tree nodes. The following were the guidelines I was required to follow:

Rules and Properties of Nodes include:  

- Binary search tree has comparisons done on weight such that:

  left.weight < weight < right.weight.

- Nodes have names, a string value. No two nodes can have the same name.
- Nodes have a weight, an integer value. No two nodes can have the same Weight.

Note that the script currently only satisfies the assignment as it is stated, no more as yet.

## Tests

To run the test suite, simply run the command **rake** from your `/path/to/sds`

## Contributors

Jim Conner (snafuxnj@yahoo.com)

## License

MIT?
