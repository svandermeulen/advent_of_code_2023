import pytest

from src.day_1.part_1 import run
from src.utils.io import read_lines
from src.utils.paths import Paths


@pytest.mark.parametrize(
    "test_input, expected", [(read_lines(path=Paths().path_data_tests / "day_1" / "example_1.txt"), 142)]
)
def test_run(test_input, expected):
    assert run(puzzle_input=test_input) == expected
