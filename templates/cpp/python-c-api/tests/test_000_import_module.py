from importlib.machinery import ExtensionFileLoader
from importlib.util import find_spec
import pytest
from nguyenpanda.swan import red  # Please install nguyenpanda package <3 `pip install nguyenpanda`

def test_importable(SHARE_CONSTANT):
    module_name = SHARE_CONSTANT['module']  # Add your real module name
    module = find_spec(module_name)
    
    if not module or not isinstance(module.loader, ExtensionFileLoader):
        pytest.exit(
            red(f'❌ Critical failure: Cannot import module `{module_name}`.'
                f'Make sure you already change the module name in `tests/conftest.py`'),
            returncode=3,
        )
