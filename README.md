# COEN 6501: DIGITAL DESIGN AND SYNTHESIS PROJECT

## Team

```bash

Abishek Arumugam Thiruselvi('40218896')

Manish Pejathaya ('40194909')

Mahsa Vahed('40183415')
```
## Description
Design of arithmetic unit to perform 
```bash
Z=1/4 [A×B] +1
```
## Prerequisites
Follow the below document for setting up the environment, [login to moodle](https://moodle.concordia.ca/) before opening the [setup document](https://moodle.concordia.ca/moodle/mod/resource/view.php?id=3280581)

## Steps to follow for running
Step 1: Download the codes to the local

Step 2: Go to the Menu Bar and click on >> File >> New >> Project, then a popup window will appear (Windows's name: Create Project)

Step 3: We have to enter: Project Name: {name} Project Location: /nfs/home/{first-character-useraccount}/{useraccount}/{projectfolder} Default library name: work.

Step 4: Once it's created, you need to create the same folders structure inside the new project for a better understanding. Below is the structure:

Step 5: Please proceed to create the following folders:
```bash
>> TOP

>> ARRAY MULTIPLIER

>> DIVISION

>> FLIPFLOP

>> FULL ADDER

>> MUX
```
Step 6: Go to the Menu Bar and click on >> Project Menu >> add to project >> existing file. Then a window popup will appear to browse and select all the contained files in the project folder.
While adding each file, enable "copy to project directory" in the "Add File to Project" window popup. After adding all the necessary files to the project, click compile all.

Step 7: Below, you can find the list of project files (all of them must be added to the project). And can be compiled and simulated.


>> TOP: TOP.vhd, TOP_TB.vhd

>> ARRAY MULTIPLIER: ArrayMultiplier16bit.vhd, Exact_Array_Multi_8bit.vhd, MultiplierTB8.vhd, Multiplier_TestBench.vhd, creating_pp.vhd, fullAdder.vhd, myAND.vhd

>> DIVISION: DIV_BY_CONST.vhd, DIV_TB.vhd

>> FLIPFLOP: DFF.vhd, DFF16.vhd, DFF16_TB.vhd, DFF30.vhd, DFF32.vhd, DFF_TestBench.vhd

>> FULL ADDER: FA32_TB.vhd, FullAdder32.vhd

>> MUX: 2to1Mux.vhd, MUX_TB.vhd
``
## Arithmetic Unit
### Control Path Signals
LD_POS, CLR_POS, LOAD_IN, FF0_LD_EN, FF0_CLR_EN, S0_EN_FF, S1_EN_FF, S2_EN_FF

### Data Path Stages
#### Stage 1:
The product of AxB is computed and stored using flip flop if the control flag is high
#### Stage 2:
The division by 4 of the stage 1 result is computed and stored using flip flop if the control flag is high
#### Stage 3:
The result of stage 2 is incremented by one and sent to mux to get the final result *Z.*

## University
[Concordia University](https://www.concordia.ca/)
