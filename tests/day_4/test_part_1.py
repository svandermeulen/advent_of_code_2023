import pytest
from typing_extensions import Iterable

from src.day_4.part_1 import run
from src.utils.io import read_lines
from src.utils.paths import Paths


@pytest.mark.parametrize(
    "test_input, expected", [(read_lines(path=Paths().path_data_tests / "day_4" / "example_1.txt"), 13)]
)
def test_run(test_input: Iterable[str], expected: int) -> None:
    assert run(puzzle_input=test_input) == expected
