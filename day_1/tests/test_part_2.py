import pytest
 
from day_1.part_2 import run
from utils.io import readlines
 
 
@pytest.mark.parametrize("test_input, expected", [(readlines(path="data/example_2.txt"), 281)])
def test_run(test_input, expected):
    assert run(puzzle_input=test_input) == expected
