<p align="center">
  <img src="https://rawgit.com/joelpurra/jqnpm/master/resources/logotype/penrose-triangle.svg" alt="jqnpm logotype, a Penrose triangle" width="100" />
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

# Zeros::myFirstFunction
"World" | Zeros::myFirstFunction		# "Hello World!"
```



---

## License
Copyright (c) 2015 Joel Purra <http://joelpurra.com/>
All rights reserved.

When using **jq-zeros**, comply to the MIT license. Please see the LICENSE file for details.
