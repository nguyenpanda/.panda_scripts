from setuptools import setup, Extension
from pathlib import Path

CWD = Path.cwd()
MODULE_DIR = CWD / 'cppmodule'
SRC_DIR = MODULE_DIR / 'src'
INC_DIR = MODULE_DIR / 'include'

module = Extension(
    name='cppmodule', 
    sources=[
		SRC_DIR / 'cppmodule.cpp',
  		SRC_DIR / '_hello.cpp',
	],
    include_dirs=[
		str(INC_DIR),
	]
)

setup(
	name='cppmodule',
	version='0.0.0',
	description='A simple template for creating Python bindings for C/C++ using the Python C API',
	author='nguyenpanda',
	# url='',
	ext_modules=[
		module,
	],
)
