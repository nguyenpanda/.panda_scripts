#include "_hello.h"

PyObject* _hello(PyObject* self, PyObject* args) {
    if (PyTuple_Size(args) == 0) {
        return PyUnicode_FromString("Hello nguyenpanda!");
    }

	const char* name = NULL;
    if (!PyArg_ParseTuple(args, "s", &name)) {
        PyErr_SetString(PyExc_TypeError, "Function takes exactly one string argument");
        return NULL;
    }

    size_t len = strlen(name) + 8;  // "Hello " + name + '!\0'
    char* buffer = (char*) malloc(len);
    if (buffer == NULL) {
        PyErr_NoMemory();
        return NULL;
    }

    snprintf(buffer, len, "Hello %s!", name);
    PyObject* result = PyUnicode_FromString(buffer);
    free(buffer);
    return result;
}
