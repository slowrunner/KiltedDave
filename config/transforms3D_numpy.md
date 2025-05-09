# Numpy and transforms3D

ros2_gopigo3_node uses quarternian transforms that have been deprecated in numpy 2.x, so if see:

```
*** ros2 run ros2_gopigo3_node gopigo3_node &
Traceback (most recent call last):
  File "/home/ubuntu/KiltedDave/ros2ws/install/ros2_gopigo3_node/lib/ros2_gopigo3_node/gopigo3_node", line 33, in <module>
    sys.exit(load_entry_point('ros2-gopigo3-node==0.0.0', 'console_scripts', 'gopigo3_node')())
  File "/home/ubuntu/KiltedDave/ros2ws/install/ros2_gopigo3_node/lib/ros2_gopigo3_node/gopigo3_node", line 25, in importlib_load_entry_point
    return next(matches).load()
  File "/usr/lib/python3.10/importlib/metadata/__init__.py", line 171, in load
    module = import_module(match.group('module'))
  File "/usr/lib/python3.10/importlib/__init__.py", line 126, in import_module
    return _bootstrap._gcd_import(name[level:], package, level)
  File "<frozen importlib._bootstrap>", line 1050, in _gcd_import
  File "<frozen importlib._bootstrap>", line 1027, in _find_and_load
  File "<frozen importlib._bootstrap>", line 1006, in _find_and_load_unlocked
  File "<frozen importlib._bootstrap>", line 688, in _load_unlocked
  File "<frozen importlib._bootstrap_external>", line 883, in exec_module
  File "<frozen importlib._bootstrap>", line 241, in _call_with_frames_removed
  File "/home/ubuntu/KiltedDave/ros2ws/install/ros2_gopigo3_node/lib/python3.10/site-packages/ros2_gopigo3_node/gopigo3_node.py", line 56, in <module>
    from tf_transformations import quaternion_about_axis
  File "/opt/ros/humble/lib/python3.10/site-packages/tf_transformations/__init__.py", line 46, in <module>
    import transforms3d
  File "/home/ubuntu/.local/lib/python3.10/site-packages/transforms3d/__init__.py", line 10, in <module>
    from . import quaternions
  File "/home/ubuntu/.local/lib/python3.10/site-packages/transforms3d/quaternions.py", line 26, in <module>
    _MAX_FLOAT = np.maximum_sctype(np.float64)
  File "/usr/local/lib/python3.10/dist-packages/numpy/__init__.py", line 400, in __getattr__
    raise AttributeError(
AttributeError: `np.maximum_sctype` was removed in the NumPy 2.0 release. Use a specific dtype instead. You should avoid relying on any implicit mechanism and select the largest dtype of a kind explicitly in the code.

```

need to reinstall numpy<1.24:
```
sudo pip3 install "numpy<1.24"
```

(sudo pip3 install python3-transforms3d installs 0.3.1+ds-2 )  


There is a new transforms3d  0.4.2 on pypi, released Jun 17, 2024 - not sure if it fixes the issue.

