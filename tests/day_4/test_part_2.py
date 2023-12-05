import pytest
from typing_extensions import Iterable

from src.day_4.part_2 import run
from src.utils.io import read_lines
from src.utils.paths import Paths


@pytest.mark.parametrize(
    "test_input, expected", [(read_lines(path=Paths().path_data_tests / "day_4" / "example_2.txt"), None)]
)
def test_run(test_input: Iterable[str], expected: int) -> None:
    assert run(puzzle_input=test_input) == expected
