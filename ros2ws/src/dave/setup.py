from setuptools import find_packages, setup

package_name = 'dave'

setup(
    name=package_name,
    version='0.0.0',
    packages=find_packages(exclude=['test']),
    data_files=[
        ('share/ament_index/resource_index/packages',
            ['resource/' + package_name]),
        ('share/' + package_name, ['package.xml']),
    ],
    install_requires=['setuptools'],
    zip_safe=True,
    maintainer='slowrunner',
    maintainer_email='slowrunner@users.noreply.github.com',
    description='Collection of Dave specific nodes',
    license='wild abandon',
    tests_require=['pytest'],
    entry_points={
        'console_scripts': [
            'say_node = dave.say_node:main',
            'battery_node = dave.battery_node:main',
            'docking_node = dave.docking_node:main',
            'dave_node = dave.dave_node:main',
            'test_dock = dave.test_dock:main',
            'say_client = dave.say_svc_client:main',

        ],
    },
)
