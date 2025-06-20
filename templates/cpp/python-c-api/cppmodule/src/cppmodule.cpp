#include "cppmodule.h"

static PyObject* cppModuleErr;

static struct PyMethodDef methods[] = {
	{"hello", _hello, METH_VARARGS, "Say hello to someone"},
	{NULL, NULL, 0, NULL},
};

static struct PyModuleDef cppmodule = {
	PyModuleDef_HEAD_INIT,
	"cppmodule",
	"A simple template for creating Python bindings for C/C++ using the Python C API",
	-1,
	methods,
};

PyMODINIT_FUNC PyInit_cppmodule() {
	PyObject* module = PyModule_Create(&cppmodule);
	Py_INCREF(module);
	
	cppModuleErr = PyErr_NewException("cppmodule.error", NULL, NULL);
	Py_INCREF(cppModuleErr);
	PyModule_AddObject(module, "CppModuleError", cppModuleErr);
	return module;
}
