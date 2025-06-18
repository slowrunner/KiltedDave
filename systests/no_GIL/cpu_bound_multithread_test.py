#!/bin/env python3

import threading
import time

def cpu_bound_task(n, thread_id):
    count = 0
    for i in range(n):
        count += i*i

N = 100000000

def run_with_threads():
    threads = []
    start = time.time()    
    # Create and start 4 threads
    for i in range(4):
        t = threading.Thread(target=cpu_bound_task, args=(N, i))
        threads.append(t)
        t.start()
    
    # Wait for all threads to complete
    for t in threads:
        t.join()
    
    end = time.time()
    print(f'Total time taken: {end - start:.2f} seconds')

if __name__ == '__main__':
    run_with_threads()
