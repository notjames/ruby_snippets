## Synopsis

Simply run `btree-sds` from the command line. IE `./btree-sds`

This package does **NOT** have an installer. Also note that this particular script is meant to run the use-cases outlined in the assignment (see *Rules to Follow*).

There exists another test script used during the authoring of this beast and it is located
in the scripts directory named `deeper_concept`.

## Dependency Requirements

This script requires the following to be tested and run:

    Ruby ~> 2.3.0
    minitest ~> 5.10.0
    minitest-reporters ~> 1.1.14

## Motivation

This library is my first attempt at writing a btree class driven by a controller that manages the binary tree nodes. The following were the guidelines I was required to follow:

Rules and Properties of Nodes include:  

- Binary search tree has comparisons done on weight such that:

  left.weight < weight < right.weight.

- Nodes have names, a string value. No two nodes can have the same name.
- Nodes have a weight, an integer value. No two nodes can have the same Weight.

Note that the script currently only satisfies the assignment as it is stated, no more as yet.

## Rules to follow
Write a Node class that includes the following: 
- A constructor that takes a name and weight as input 
    Example Constructor:  Node root = new Node(String Name, Int Weight)  

- Include any methods you need.  

- Write unit tests. 

Write a Controller class that includes the following:  
- A constructor that takes a root node as input. 
    Example Constructor:  Controller controller = new Controller(Node rootNode)  
    
- An insert(name, weight) method returns true when insertion was successful and false when not.   
  For example input:output given `Root(aRoot, 5)`:   
  
      controller.insert(aNode,1): true 
      controller.insert(bNode,5): false 
      controller.insert(aNode, 6): false 

- A printOrderedNames() method that returns a list, space separated of names in order of weight from smallest to largest.  
  For example (from the previous example): 

      controller.printOrderedNames(): aNode aRoot
 
- Write unit tests.

## Tests

To run the test suite, simply run the command **rake** from your `/path/to/sds`

## Contributors

Jim Conner (snafuxnj@yahoo.com)

## License

MIT?
