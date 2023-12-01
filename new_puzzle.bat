@echo off
SET day=%1
ECHO The day is set to: %day%

SET token=%AOC_TOKEN% & ::For reference: https://github.com/wimglenn/advent-of-code-wim/issues/1
SET new_dir=day_%day%
IF NOT EXIST %new_dir% (
	mkdir "%new_dir%"
	<nul >"%new_dir%\__init__.py" (set /p tv=)
	:: Create test folder and files
	mkdir %new_dir%\tests
	mkdir %new_dir%\tests\data
	<nul >"%new_dir%\tests\__init__.py" (set /p tv=)
	
	FOR %%A IN (1, 1, 2) DO (
		(
		  echo import pytest
		  echo[ 
		  echo from day_%day%.part_%%A import run
		  echo from utils.io import readlines
		  echo[ 
		  echo[ 
		  echo @pytest.mark.parametrize("test_input, expected", [(readlines(path="data/example_1.txt"^), None^)]^)
		  echo def test_run(test_input, expected^):
		  echo     assert run(puzzle_input=test_input^) == expected
		) >"%new_dir%\tests\test_part_%%A.py"
	)
	(
	  echo from typing import Iterable
	  echo[
      echo from utils.io import readlines
      echo[ 
      echo[ 
      echo def run(puzzle_input: Iterable[str]^):
      echo     return -1
      echo[ 
      echo[ 
      echo if __name__ == "__main__":
      echo     print(run(puzzle_input=readlines(path="data/puzzle_input.txt"^)^)^)
    ) >"%new_dir%\part_1.py"
	
	<nul >"%new_dir%\part_2.py" (set /p tv=)
	type "%new_dir%\part_1.py" >> "%new_dir%\part_2.py"
	if %day% == 1 (
		for /f "delims=" %%i in ('curl -s --head -w %%{http_code} https://adventofcode.com/2023/day/%day%/input -o NUL') do set status_code=%%i
		echo The status code is: %status_code%
		if %status_code% == 400 (
			mkdir "%new_dir%/data"
			curl -s "https://adventofcode.com/2023/day/%day%/input" -H "Cookie: session=%token%" -o "%new_dir%\data\puzzle_input.txt"
		)
	)
) ELSE (ECHO Folders have already been created)


