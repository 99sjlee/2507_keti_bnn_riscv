#include "ervp_bit_util.h"

unsigned int convert_sign_and_magnitude(int value, int bitwidth)
{
	unsigned int result;
	int is_minus;
	int max_magnitude = generate_mask_by_size(bitwidth - 1);
	is_minus = (value < 0);
	result = is_minus? (-value) : value;
	if(is_minus)
		result |= (-1 - max_magnitude);
	return result;
}