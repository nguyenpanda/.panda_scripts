import pytest

@pytest.fixture(scope='session')
def SHARE_CONSTANT():
    return {
        'module': 'cppmodule',
    }
