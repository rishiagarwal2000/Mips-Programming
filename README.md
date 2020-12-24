<!-- Header -->
# MIPS Programming Examples

<!-- TABLE OF CONTENTS -->
<details open="open">
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-code">About the Code</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
        <li><a href="#examples">Examples</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
    </li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgements">Acknowledgements</a></li>
  </ol>
</details>



<!-- ABOUT THE PROJECT -->
## About The Code

Implemented a few examples demonstrating the usage of assembly language to solve problems.

The intention of sharing the code is to help beginners like me to get started with assembly language and to realize that assembly language is **not** difficult. 

### Examples
The examples implemented are:
 
<details close="close">
<summary>
Finding the k-th largest value in an array
</summary>
A MIPS assembly program which does the following:
It accepts the following inputs: 

* _n_ (number of integers)
* _arr_  –  a list of n integers (to be stored in the data segment of your program
* _k_  –  a “small” positive integer
Program finds the kth largest value in the list and outputs it. 

Note that what’s computed is the kth largest value, not the value of the kth largest integer.

A sample run is shown below.

Program: _Enter No. of integers in list_<br>
User: 12 <br>
Program: _Enter list_ <br>
User: 5,  9,  -11,  27,  3,  -2,  8,  305,  27,  15,  -7,  0 <br>
Program: _Enter k (a  positive integer)_ <br>
User: 3 <br>
Program: _15_ <br>

Input constraints: 1<=n<=50 and 1<=k<=5.

Output by the program is in _​italics​_.
</details>

<details close="close">
<summary>
Finding the modulus of a number w.r.t another number
</summary>
A MIPS program to do the following:

* The program should input an ​integer​ of at most 4 decimal digits – this is the modulus, ​n​.
* The program should input a ​string​ of 12 ​decimal​ digits (most significant digit first). This represents a 12-digit integer(padded with 0s, if needed). Call it ​_a_​.
* The program computes ​_a​ mod ​n_​ and displays this value on the screen (result is between 0 and n-1,  i.e., _0  ≤  a mod n  ≤  n-1_). Program prompts the user for input as shown below.
* Program includes a couple of subroutines. 
* Constraints:​ _n>=1_, integer represented by _a>=0_.
Sample run:<br>
_Enter modulus:_​ 1000 <br>
_Enter string of 12 decimal digits:_ 123456789012 <br>
_123456789012 mod 1000 = 12 _<br>
_Wish to continue?: _ ​Y <br>
_Enter modulus: _​​25 <br>
_Enter string of 12 decimal digits: ​_​246801357988 <br>
_246801357988 mod 25 = 13_ <br>
_Wish to continue?: _​N <br>

Output of the program is in ​_italics_.​
</details>

<details close="close">
<summary>
Computing the gcd of two numbers
</summary>
The gcd is the greatest common divisor or common factor shared by two integers. For example, gcd(210, 112) = 14.

The program prompts the user for two integer inputs _m_ and _n_ and then prints the value of _gcd(m,n)_.

Constraints:​ m,n >= 1.
Sample run: <br>
_Enter m: _​​210 <br>
_Enter n: _​​112 <br>
_gcd(210,112) = 14 _<br>
_Wish to continue?:​_ Y <br>
_Enter ​​m:​ ​_462 <br>
_Enter ​​n:​​ _363 <br>
_gcd(462,363) = 33 _<br>
_Wish to continue?:​_ N <br>
Output by the program is in _​italics​_.
</details>

### Built With

Code is in assembly (with .s extension).

<!-- GETTING STARTED -->
## Getting Started

### Prerequisites

[Qtspim Simulator](http://spimsimulator.sourceforge.net/)
SPIM is a software simulator, designed to run programs for MIPS processors. The newest version of Spim is called QtSpim, and unlike all of the other versions, it runs on Microsoft Windows, Mac OS X, and Linux—the same source code and the same user interface on all three platforms!

* Windows Users:
    * Download QtSpim_9.1.21_Windows.msi from [here](https://sourceforge.net/projects/spimsimulator/files/).
    * Install the package and then run.
    * Open any of the example files. Always use the Reinitialize and Load file option.
    * Run the program by clicking on the Run button.

* Mac Users:
    * Download QtSpim_9.1.21_mac.pkg from [here](https://sourceforge.net/projects/spimsimulator/files/).
    * Since this is from a developer not identified by Apple, you would be required to refer to [this link](https://support.apple.com/en-gb/guide/mac-help/mh40616/mac) which tells you how to install such programs.
        * You basically have to Control-click the pkg file for it to run installation
    * Open any of the example files. Always use the Reinitialize and Load file option.
    * Run the program by clicking on the Run button.

* Linux Users:
    * Download qtspim_9.1.21.1_linux64.deb from [here](https://sourceforge.net/projects/spimsimulator/files/).
    * Install the package and then run.
    * Open any of the example files. Always use the Reinitialize and Load file option.
    * Run the program by clicking on the Run button.
  
Clone the repo
   
```sh
$ git clone https://github.com/rishiagarwal2000/Mips-Programming.git 
```

<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE` for more information.



<!-- CONTACT -->
## Contact

Rishi Agarwal - rishiapril2000@gmail.com

Project Link: [https://github.com/rishiagarwal2000/Mips-Programming.git](https://github.com/rishiagarwal2000/Mips-Programming.git)


<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements
* Professor Bernard Menezes, IIT Bombay
* TAs of the course CS341, IIT Bombay (Autumn semester 2020)