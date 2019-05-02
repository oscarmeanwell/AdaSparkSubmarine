# A Submarine controller written in Ada-SPARK.

* Uses Preconditions and Postconditions in order to create a safety critical system
* Compiles at SPARK gold level guaranteeing the absence of run time errors
* Has a console based GUI therefrom you can control the submarine, actions will not complete unless the preconditions are satisifed. 

### How do I run this? ###
If you have a UNIX based system and just want to run the main file, and not prove the code, you can execute this [file](https://github.com/oscarmeanwell/AdaSparkSubmarine/blob/master/obj/main) from your terminal, like this `./main`. If you have a windows based system, you must install GNAT programming studio and compile the code.

### Controller Structure ###
* Program specification [file](https://github.com/oscarmeanwell/AdaSparkSubmarine/blob/master/src/Coursework.ads), this is where the preconditions and postcoditions are defined.
* Procedure implemenation [file](https://github.com/oscarmeanwell/AdaSparkSubmarine/blob/master/src/Coursework.adb), implements the procedures defined in the specification file.
* Main method [file](https://github.com/oscarmeanwell/AdaSparkSubmarine/blob/master/src/main.adb), calls the procedures implemented in the above file.
