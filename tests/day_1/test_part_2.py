from typing import Iterable

import pytest

from src.day_1.part_2 import run
from src.utils.io import read_lines
from src.utils.paths import Paths


@pytest.mark.parametrize(
    "test_input, expected", [(read_lines(path=Paths().path_data_tests / "day_1" / "example_2.txt"), 281)]
)
def test_run(test_input: Iterable[str], expected: int) -> None:
    assert run(puzzle_input=test_input) == expected
