#!/bin/bash

# Practical 7: Demonstrate input, output, and error redirection.
# Uses: >, >>, < and 2>

# Standard output redirection (overwrite)
echo "Hello Linux" > output.txt

# Standard output redirection (append)
echo "This is another line" >> output.txt

# Standard input redirection
cat < output.txt

# Standard error redirection
ls abc.txt 2> error.txt

echo "Done. Check output.txt and error.txt."
