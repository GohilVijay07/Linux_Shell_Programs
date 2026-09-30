# Linux Shell Programming Practicals

This folder contains the Linux/Bash programs supplied in the original ZIP, renamed with clear practical names and corrected for common Bash syntax/typing errors so they can be run directly.

## Practical mapping

| Practical | Program | How to run |
|---|---|---|
| 1 | `01_number_check.sh` | `./01_number_check.sh` |
| 2 | `02_largest_of_three.sh` | `./02_largest_of_three.sh` |
| 3 | `03_sum_n_natural_numbers.sh` | `./03_sum_n_natural_numbers.sh` |
| 4 | `04_bash_calculator_functions.sh` | `./04_bash_calculator_functions.sh` |
| 5 | `05_display_month_calendar.sh` | `./05_display_month_calendar.sh 7 2023` |
| 6 | `06_date_time_formatting.sh` | `./06_date_time_formatting.sh` |
| 7 | `07_io_error_redirection.sh` | `./07_io_error_redirection.sh` |
| 8 | `08_concatenate_files.sh` | `./08_concatenate_files.sh output.txt file1.txt file2.txt` |
| 9 | `09_display_text_files.sh` | `./09_display_text_files.sh` or `./09_display_text_files.sh /path/to/dir` |
| 23 | `23_user_management_menu.sh` | `sudo ./23_user_management_menu.sh` |

## General steps to run any program

```bash
cd Linux_Shell_Programs
chmod +x *.sh
./01_number_check.sh
```

You only need `chmod +x` once after copying/cloning the project. Alternatively, every script can be run with:

```bash
bash filename.sh
```

## Practical 5

The script accepts both month and year because the lab sheet asks for the calendar of a specified month and the original program used `cal <month> <year>`.

Example:

```bash
./05_display_month_calendar.sh 8 2026
```

If `cal` is not installed on Ubuntu/Debian:

```bash
sudo apt update
sudo apt install ncal
```

## Practical 7

This creates/updates these files in the current directory:

- `output.txt` — standard output redirection (`>` and `>>`)
- `error.txt` — standard error redirection (`2>`)

## Practical 8

Example:

```bash
echo "File 1 content" > a.txt
echo "File 2 content" > b.txt
./08_concatenate_files.sh combined.txt a.txt b.txt
cat combined.txt
```

## Practical 23 — Important

This script changes Linux user accounts. Run it only in a lab/test Linux environment and review the selected option before confirming deletion.

Run:

```bash
sudo ./23_user_management_menu.sh
```

The menu contains 17 menu-driven options covering all practical requirements: create user, delete user (with confirmation), modify info, password, lock/unlock, user info, groups, list all users, check existence, logged-in users, shell/home directory change, account expiration, aging info, remove user with home directory, and exit.

## GitHub upload

After extracting this folder:

```bash
git init
git add .
git commit -m "Add Linux shell practical programs"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPOSITORY.git
git push -u origin main
```

Replace `YOUR_USERNAME/YOUR_REPOSITORY` with your GitHub repository.

## Notes

- These are Bash shell scripts and should be run on Linux, WSL, or another Bash environment.
- The uploaded lab PDF contains 29 practicals. The supplied ZIP contained programs for practicals 1-9 and 23 only; this package does not invent the missing practicals.
