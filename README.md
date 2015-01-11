<p align="center">
  <a href="https://github.com/joelpurra/jqnpm"><img src="https://rawgit.com/joelpurra/jqnpm/master/resources/logotype/penrose-triangle.svg" alt="jqnpm logotype, a Penrose triangle" width="100" border="0" /></a>
</p>

# [jq-zeros](https://github.com/joelpurra/jq-zeros)

Integers and floats as strings, padded with zeros to your liking.

This is a package for the command-line JSON processor [`jq`](https://stedolan.github.io/jq/). Install the package in your jq project/package directory with [`jqnpm`](https://github.com/joelpurra/jqnpm):

```bash
jqnpm install joelpurra/jq-zeros
```



## Usage


```jq
import "joelpurra/jq-zeros" as Zeros;

# Zeros::pad: Can pad both integer and fractions.
1.1 | Zeros::pad(3; 3) # "001.100"

# Zeros::pad: Can pad both integer and fractions.
12345.54321 | Zeros::pad(3; 3) # "12345.54321"

# Zeros::pad: Can pad both negative integer and fractions.
-1.1 | Zeros::pad(3; 3) # "-001.100"

# Zeros::pad: Can pad both negative integer and fractions.
-12345.54321 | Zeros::pad(3; 3) # "-12345.54321"

# Zeros::pad: Can pad both integer and fractions without fractions.
1 | Zeros::pad(3; 3) # "001.000"

# Zeros::pad: Can pad both negative integer and fractions without fractions.
-1 | Zeros::pad(3; 3) # "-001.000"

# Zeros::integer: Can pad single digit number to 3 digits.
1 | Zeros::integer(3) # "001"
```



---

## License
Copyright (c) 2015 Joel Purra <http://joelpurra.com/>
All rights reserved.

When using **jq-zeros**, comply to the MIT license. Please see the LICENSE file for details.
