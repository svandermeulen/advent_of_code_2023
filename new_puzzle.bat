@ECHO off
:: inspired by https://github.com/AntonMulder/aoc-2023
SET day=%1
ECHO The day is set to: %day%

SET token=%AOC_TOKEN% & ::FOR reference: https://github.com/wimglenn/advent-of-code-wim/issues/1
SET new_src_dir=src/day_%day%
SET new_tests_dir=tests/day_%day%
SET new_data_dir=data/day_%day%
SET new_data_tests_dir=data/tests/day_%day%

::Add new scripts to src
IF NOT EXIST %new_src_dir% (
	MKDIR "%new_src_dir%"
	<NUL >"%new_src_dir%\__init__.py" (SET /p tv=)
	(
	  ECHO from typing import Iterable
	  ECHO[
      ECHO from src.utils.io import read_lines
	  ECHO from src.utils.paths import Paths
      ECHO[
      ECHO[
      ECHO def run(puzzle_input: Iterable[str]^):
      ECHO     return -1
      ECHO[
      ECHO[
      ECHO if __name__ == "__main__":
      ECHO     print(run(puzzle_input=read_lines(path=Paths(^).path_data / "day_%day%" / "puzzle_input.txt"^)^)^)
    ) >"%new_src_dir%\part_1.py"
) ELSE (ECHO Source folder tree for %new_src_dir% has already been created.)
::<NUL >"%new_src_dir%\part_2.py" (SET /p tv=)
TYPE "%new_src_dir%\part_1.py" >> "%new_src_dir%\part_2.py"

::Add new tests
IF NOT EXIST %new_tests_dir% (
	MKDIR "%new_tests_dir%"
	FOR %%A IN (1, 1, 2) DO (
		(
		  ECHO import pytest
		  from typing_extensions import Iterable
		  ECHO[
		  ECHO from src.day_%day%.part_%%A import run
		  ECHO from src.utils.io import read_lines
		  ECHO from src.utils.paths import Paths
		  ECHO[
		  ECHO[
		  ECHO @pytest.mark.parametrize(
		  ECHO     "test_input, expected", [(read_lines(path=Paths(^).path_data_tests / "day_%day%" / "example_%%A.txt"^), None^)]
		  ECHO ^)
		  ECHO def test_run(test_input: Iterable[str], expected: int^) -^> None:
		  ECHO     assert run(puzzle_input=test_input^) == expected
		) >"%new_tests_dir%\test_part_%%A.py"
	)
) ELSE (ECHO Tests folder tree for %new_tests_dir% has already been created.)

::Add puzzle input data
IF NOT EXIST %new_data_dir% (
	MKDIR "%new_data_dir%"
	FOR /f "delims=" %%i IN ('curl -s --head -w %%{http_code} https://adventofcode.com/2023/day/%day%/input -o NUL') DO SET status_code=%%i
	IF %status_code% == 400 (
		curl -s "https://adventofcode.com/2023/day/%day%/input" -H "Cookie: session=%token%" -o "%new_data_dir%\puzzle_input.txt"
	) ELSE (ECHO Status code is: %status_code%.)
) ELSE (ECHO Data folder tree for %new_data_dir% has already been created.)

::Add puzzle example data
IF NOT EXIST %new_data_tests_dir% (
	MKDIR "%new_data_tests_dir%"
	FOR %%A IN (1, 1, 2) DO (
		<NUL >"%new_data_tests_dir%\example_%%A.txt" (SET /p tv=)
	)
) ELSE (ECHO Test data folder tree for %new_data_dir% has already been created.)