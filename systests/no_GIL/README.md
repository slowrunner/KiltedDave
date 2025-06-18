no-GIL Python

REF: https://medium.com/techtofreedom/python-is-removing-gil-gradually-b41274fa62a4  

The no-GIL Python is not available under apt for 24.04 yet, so must use pyenv if really, want it.  

cpu_bound_multithread_test.py  is from the article, to be used to quickly see the no-GIL advantage.  

Ubuntu 24.04 does not have an easy install no-GIL package, so must use pyenv.  Left for future.  

Running cpu_bound_multithread_test.py on Raspberry Pi 4 along side ROS 2 robot Kilted Dave yielded  

Time Taken: 104.06 seconds
 
Did not attempt installing the pyenv no-GIL environment.  6/18/25

