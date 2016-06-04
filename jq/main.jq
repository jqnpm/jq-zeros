import "joelpurra/jq-dry" as DRY;
import "joelpurra/jq-stress" as Stress;


def zeros($n):
	""
	| DRY::addition($n; "0");

# TODO: Check that input is a number.
# TODO: Check that there are no decimal points.
def integer($n):
	tostring as $str
	| if ($str | Stress::remove("-") | length) >= $n then
		$str
	else
		(
			# Special handling for negative zero.
			if . < 0 or $str == "-0" then
				"-"
			else
				""
			end
		) as $sign
		# Special handling for negative zero.
		| if . < 0 or $str == "-0"  then
			. * -1
		else
			.
		end
		| tostring as $positiveStr
		| (
			zeros($n)
			+ $positiveStr
		)
		| (
			$sign
			+ .[-1 * $n:]
		)
	end;

# TODO: Check that input is a number.
# TODO: Check that there are no negative numbers nor decimal points.
def fractions($n):
	tostring
	| Stress::esrever
	| tonumber
	| integer($n)
	| Stress::esrever;

# TODO: Check that input is a number.
def pad($n; $m):
	tostring
	| split(".")
	| .[0] |= (if Stress::isNullOrEmpty then (. // 0) else . end)
	| .[1] |= (if Stress::isNullOrEmpty then (. // 0) else . end)
	| map(tonumber)
	| .[0] |= (
		if . == 0 and $n == 0 then
			""
		else
			integer($n)
		end
	)
	| .[1] |= (
		if . == 0 and $m == 0 then
			""
		else
			fractions($m)
		end
	)
	| join(".")
	| rtrimstr(".");
