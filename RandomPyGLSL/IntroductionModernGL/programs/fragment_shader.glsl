#version 430  // version must be first line

// in general, all work carried out here.
// shader runs directly on GPU

out vec4 fragColor;

// get the resolution size and time
uniform vec2 resolution;
uniform float time;

// function to rotate a vector
vec2 rotate2D(vec2 uv, float a) {
	// define elements of rotation matrix
	float s = sin(a);
	float c = cos(a);

	// define and return rotation matrix
	return mat2(c, -s, s, c) * uv;
}

void main() {
	// define uv space and adjust coords to -1,+1 for y and -16/9,+16/9 for x
	vec2 uv = 2 * (gl_FragCoord.xy - 0.5 * resolution.xy) / resolution.y;

	// define color to paint screen
	vec3 col = vec3(0.0);

	// apply rotation to uv
	uv = rotate2D(uv, 0.5 * 3.141592654);

	// now can use uv value to define color
	// create a cardiod from parametric equations
	float r = 0.34;
	for (float i = 0.0; i < 60.0; i++) {
		// define factor to affect iterable
		float factor = (0.4 * sin(time) + 0.5);
		// add to i
		i += factor;

		// define parametric equations
		float a = i / 3;  // used for simplifying
		float dx = 2 * r * cos(a) - r * cos(2 * a) - r * sin(3 * cos(a));
		float dy = 2 * r * sin(a) - r * sin(2 * a) - r * cos(3 * sin(a));

		// update color
		col += 0.01 * factor / length(uv - vec2(dx + 0.1, dy));
	}

	// make color change with time
	col *= 0.3 * sin(vec3(0.6, 0.7, 0.8) * time) + 0.4;

	// apply color, so all black!
	fragColor = vec4(col, 1.0);
}