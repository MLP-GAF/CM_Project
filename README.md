# Computational Mathematics for Learning and Data Analysis

<p align = center>
<img src="unipiLogoCrop.png" width="250" />
</p>
<p align = center>
    <font size = 2>  
        <br> 
        <a href="https://github.com/Giacomo-Antonioli"> Giacomo Antonioli</a>: g.antonioli3@studenti.unipi.it, 
        <br> 
        <a href="https://github.com/PFasano99/">Paolo Fasano</a>:
        p.fasano1@studenti.unipi.it, 
        <br> <a href="https://github.com/xiaoli98">Malio Li</a>: m.li6@studenti.unipi.it
    </font>
</p>

---
## Abstract
This github repository ha been created to develop the project for the 'Computational Mathematics for Learning and Data Analysis' exam 2021/2022 from the master's degree in Computer Science and Artificial Intelligence from the University of Pisa.
The aim of this project is to evaluate different optimization methods for learning in ELM (Extreme Learning Machines).  
A full explanation of the mathematical content and decision making gone behind this project can be found in the report: CM_Report

The CM_Report will be structured as follow:

<font size = 2>

1. Intro

    1.1. ELM   

    1.2. ELM learning 

    1.3. Iterative Re-weighted Least Squared Problem

    1.4. Optimization Problem

2. Numerical Analysis study of 1.3 

3. Direct method resolution

    3.1. SVD decomposition

    3.2. Solving LS with SVD

    3.3. Analysis on SVD decomposition

    3.4. Conditioning and stability

    3.5. Backward stability    

4. Optimization

    4.1. Deflected subgrandient method

    4.2. Smoothed gradient method

5. Implementation
6. Conclusions

<font>

--- 
# The project
<p>

## Quick start: 


The following section of the document is a guide to install and clone this project.
For a fully functional project, before cloning and starting it, the Julia Programming Language must be installed as well as some libraries.

### Julia

To install the Julia Programming Language: 

- open <a href="https://julialang.org/downloads/"> Download Julia </a> and pick the correct vision for your OS.

OR  

- head to <a href="https://github.com/JuliaLang/julia"> Julia GitHub, to get the latest version, </a> and follow the instructions to clone the project.

<font size = 1.5> *If you have any problems using the Julia Programming Language, check the <a href="https://docs.julialang.org/en/v1/ "> Julia Documentation  </a>* </font>
</p>

### Julia BenchmarkTools

<p>
BenchmarkTools is a <a href="https://julialang.org"> Julia Language </a> package. 
To install BenchmarkTools, please <a href="https://docs.julialang.org/en/v1/manual/getting-started/">open    Julia's interactive session (known as REPL)</a> and press <kbd>]</kbd> key in the REPL to use the package mode, then type the following command
</p>

    pkg> add BenchmarkTools

To know more about the BenchmarkTools, head to the <a href="https://github.com/JuliaCI/BenchmarkTools.jl"> BenchmarkTools Github </a> for more documentation.

### Julia Unit Testing

<p>
Test is a <a href="https://julialang.org"> Julia Language </a> package. 
To install Test, please <a href="https://docs.julialang.org/en/v1/manual/getting-started/">open Julia's interactive session (known as REPL)</a> and press <kbd>]</kbd> key in the REPL to use the package mode, then type the following command
</p>

    pkg> add Test

The unit test performed confronts an expected value and the actual value to decide if they are the same within a certain range of error, in our case checks if the expected value and the value we get are identical with a maximum error of 1e-5.  
To know more about the Test, head to the <a href="https://docs.julialang.org/en/v1/stdlib/Test/"> Unit Testing </a> for more documentation.

### Julia Distributions

<p>
Distributions is a <a href="https://julialang.org"> Julia Language </a> package. 
To install Distributions, please <a href="https://docs.julialang.org/en/v1/manual/getting-started/">open Julia's interactive session (known as REPL)</a> and press <kbd>]</kbd> key in the REPL to use the package mode, then type the following command
</p>

    pkg> add Distributions

The Distributions package is used to generate data, matrices, to test the algorithm.  
To know more about the Distributions, head to the <a href="https://github.com/JuliaStats/Distributions.jl"> Distributions GitHub </a> for more documentation.

### Julia DataFrames

DataFrames is a <a href="https://julialang.org"> Julia Language </a> package. 
To install DataFrames, please <a href="https://docs.julialang.org/en/v1/manual/getting-started/">open Julia's interactive session (known as REPL)</a> and press <kbd>]</kbd> key in the REPL to use the package mode, then type the following command
</p>

    pkg> add DataFrames

The DataFrames package is used to manage the data, similarly to  <a href="https://pandas.pydata.org/docs/">Pandas</a> in Python.  
To know more about the DataFrames, head to the <a href="https://dataframes.juliadata.org/stable/"> DataFrames docs </a> for more documentation.


### Build this repository 
First, make sure you have all the required libraries installed. Then, clone this git repository:

    git clone https://github.com/MLP-GAF/CM_Project.git

--- 

## Bibliography and references 

[1] <a href="https://esami.unipi.it/esami2/programma.php?c=39132"> Computational Mathematics For Learning And Data Analysis UniPi </a>


---

## Contact information

If you have any problems to instal this repository or need any clarification on the code please contact us at: 

|Author             |University Mail                    | Personal Mail             | Github                                                   |
|-------------------|-----------------------------------|---------------------------|----------------------------------------------------------|
| Giacomo Antonioli | g.antonioli3@studenti.unipi.it    | giaco.antonioli@gmail.com | <a href="https://github.com/Giacomo-Antonioli"> Giacomo Antonioli</a> |
| Paolo Fasano      | p.fasano1@studenti.unipi.it       | p.fasano99@hotmail.com    | <a href="https://github.com/PFasano99/">Paolo Fasano</a> |
| Malio Li          | m.li6@studenti.unipi.it           |                           | <a href="https://github.com/xiaoli98">Malio Li</a>       |

---
A board for the organization of this project can be found at <a href="https://github.com/MLP-GAF/CM_Project/projects/1">CM Board</a>